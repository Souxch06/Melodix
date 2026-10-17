.class public final synthetic Liv;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljm;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lsw0;


# direct methods
.method public synthetic constructor <init>(Lsw0;I)V
    .locals 0

    .line 1
    iput p2, p0, Liv;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Liv;->k:Lsw0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final h(Li7;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget v0, p0, Liv;->j:I

    .line 2
    .line 3
    iget-object p0, p0, Liv;->k:Lsw0;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    invoke-static {p0, p1}, Lcom/google/firebase/remoteconfig/RemoteConfigRegistrar;->a(Lsw0;Li7;)Lyz0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :pswitch_0
    invoke-static {p0, p1}, Lcom/google/firebase/perf/FirebasePerfRegistrar;->b(Lsw0;Li7;)Ll40;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :pswitch_1
    new-instance v0, Lkv;

    .line 19
    .line 20
    const-class v1, Landroid/content/Context;

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Li7;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Landroid/content/Context;

    .line 27
    .line 28
    const-class v2, Lu30;

    .line 29
    .line 30
    invoke-virtual {p1, v2}, Li7;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Lu30;

    .line 35
    .line 36
    invoke-virtual {v2}, Lu30;->d()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    const-class v3, Ltb0;

    .line 41
    .line 42
    invoke-static {v3}, Lsw0;->a(Ljava/lang/Class;)Lsw0;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {p1, v3}, Li7;->c(Lsw0;)Ljava/util/Set;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    const-class v4, Lkw;

    .line 51
    .line 52
    invoke-virtual {p1, v4}, Li7;->d(Ljava/lang/Class;)Llw0;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    invoke-virtual {p1, p0}, Li7;->g(Lsw0;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    move-object v5, p0

    .line 61
    check-cast v5, Ljava/util/concurrent/Executor;

    .line 62
    .line 63
    invoke-direct/range {v0 .. v5}, Lkv;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/util/Set;Llw0;Ljava/util/concurrent/Executor;)V

    .line 64
    .line 65
    .line 66
    return-object v0

    .line 67
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
