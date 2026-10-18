.class public Lcom/google/firebase/datatransport/TransportRegistrar;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


# static fields
.field private static final LIBRARY_NAME:Ljava/lang/String; = "fire-transport"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Li7;)Lqd1;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/firebase/datatransport/TransportRegistrar;->lambda$getComponents$2(Lgm;)Lqd1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Li7;)Lqd1;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/firebase/datatransport/TransportRegistrar;->lambda$getComponents$1(Lgm;)Lqd1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Li7;)Lqd1;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/firebase/datatransport/TransportRegistrar;->lambda$getComponents$0(Lgm;)Lqd1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static synthetic lambda$getComponents$0(Lgm;)Lqd1;
    .locals 1

    .line 1
    const-class v0, Landroid/content/Context;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Lgm;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {p0}, Lxd1;->b(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lxd1;->a()Lxd1;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v0, Luh;->f:Luh;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lxd1;->c(Luh;)Lrd1;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method private static synthetic lambda$getComponents$1(Lgm;)Lqd1;
    .locals 1

    .line 1
    const-class v0, Landroid/content/Context;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Lgm;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {p0}, Lxd1;->b(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lxd1;->a()Lxd1;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v0, Luh;->f:Luh;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lxd1;->c(Luh;)Lrd1;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method private static synthetic lambda$getComponents$2(Lgm;)Lqd1;
    .locals 1

    .line 1
    const-class v0, Landroid/content/Context;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Lgm;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {p0}, Lxd1;->b(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lxd1;->a()Lxd1;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v0, Luh;->e:Luh;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lxd1;->c(Luh;)Lrd1;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method


# virtual methods
.method public getComponents()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lwl;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lqd1;

    .line 2
    .line 3
    invoke-static {p0}, Lwl;->b(Ljava/lang/Class;)Lvl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "fire-transport"

    .line 8
    .line 9
    iput-object v1, v0, Lvl;->a:Ljava/lang/String;

    .line 10
    .line 11
    const-class v2, Landroid/content/Context;

    .line 12
    .line 13
    invoke-static {v2}, Lbx;->b(Ljava/lang/Class;)Lbx;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v0, v3}, Lvl;->a(Lbx;)V

    .line 18
    .line 19
    .line 20
    new-instance v3, Lo40;

    .line 21
    .line 22
    const/16 v4, 0x1c

    .line 23
    .line 24
    invoke-direct {v3, v4}, Lo40;-><init>(I)V

    .line 25
    .line 26
    .line 27
    iput-object v3, v0, Lvl;->f:Ljm;

    .line 28
    .line 29
    invoke-virtual {v0}, Lvl;->b()Lwl;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v3, Lsw0;

    .line 34
    .line 35
    const-class v4, Lrh0;

    .line 36
    .line 37
    invoke-direct {v3, v4, p0}, Lsw0;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v3}, Lwl;->a(Lsw0;)Lvl;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-static {v2}, Lbx;->b(Ljava/lang/Class;)Lbx;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-virtual {v3, v4}, Lvl;->a(Lbx;)V

    .line 49
    .line 50
    .line 51
    new-instance v4, Lo40;

    .line 52
    .line 53
    const/16 v5, 0x1d

    .line 54
    .line 55
    invoke-direct {v4, v5}, Lo40;-><init>(I)V

    .line 56
    .line 57
    .line 58
    iput-object v4, v3, Lvl;->f:Ljm;

    .line 59
    .line 60
    invoke-virtual {v3}, Lvl;->b()Lwl;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    new-instance v4, Lsw0;

    .line 65
    .line 66
    const-class v5, Lod1;

    .line 67
    .line 68
    invoke-direct {v4, v5, p0}, Lsw0;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v4}, Lwl;->a(Lsw0;)Lvl;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {v2}, Lbx;->b(Ljava/lang/Class;)Lbx;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {p0, v2}, Lvl;->a(Lbx;)V

    .line 80
    .line 81
    .line 82
    new-instance v2, Lwd1;

    .line 83
    .line 84
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 85
    .line 86
    .line 87
    iput-object v2, p0, Lvl;->f:Ljm;

    .line 88
    .line 89
    invoke-virtual {p0}, Lvl;->b()Lwl;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    const-string v2, "19.0.0"

    .line 94
    .line 95
    invoke-static {v1, v2}, Lju1;->j(Ljava/lang/String;Ljava/lang/String;)Lwl;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    filled-new-array {v0, v3, p0, v1}, [Lwl;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    return-object p0
.end method
