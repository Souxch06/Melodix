.class public Lcom/google/firebase/installations/FirebaseInstallationsRegistrar;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


# static fields
.field private static final LIBRARY_NAME:Ljava/lang/String; = "fire-installations"


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

.method public static synthetic a(Li7;)Lh40;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/firebase/installations/FirebaseInstallationsRegistrar;->lambda$getComponents$0(Lgm;)Lh40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static lambda$getComponents$0(Lgm;)Lh40;
    .locals 7

    .line 1
    new-instance v0, Lg40;

    .line 2
    .line 3
    const-class v1, Lu30;

    .line 4
    .line 5
    invoke-interface {p0, v1}, Lgm;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lu30;

    .line 10
    .line 11
    const-class v2, Lub0;

    .line 12
    .line 13
    invoke-interface {p0, v2}, Lgm;->d(Ljava/lang/Class;)Llw0;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    new-instance v3, Lsw0;

    .line 18
    .line 19
    const-class v4, Lwf;

    .line 20
    .line 21
    const-class v5, Ljava/util/concurrent/ExecutorService;

    .line 22
    .line 23
    invoke-direct {v3, v4, v5}, Lsw0;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {p0, v3}, Lgm;->g(Lsw0;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Ljava/util/concurrent/ExecutorService;

    .line 31
    .line 32
    new-instance v4, Lsw0;

    .line 33
    .line 34
    const-class v5, Lqg;

    .line 35
    .line 36
    const-class v6, Ljava/util/concurrent/Executor;

    .line 37
    .line 38
    invoke-direct {v4, v5, v6}, Lsw0;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 39
    .line 40
    .line 41
    invoke-interface {p0, v4}, Lgm;->g(Lsw0;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Ljava/util/concurrent/Executor;

    .line 46
    .line 47
    new-instance v4, Lh41;

    .line 48
    .line 49
    invoke-direct {v4, p0}, Lh41;-><init>(Ljava/util/concurrent/Executor;)V

    .line 50
    .line 51
    .line 52
    invoke-direct {v0, v1, v2, v3, v4}, Lg40;-><init>(Lu30;Llw0;Ljava/util/concurrent/ExecutorService;Lh41;)V

    .line 53
    .line 54
    .line 55
    return-object v0
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
    const-class p0, Lh40;

    .line 2
    .line 3
    invoke-static {p0}, Lwl;->b(Ljava/lang/Class;)Lvl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "fire-installations"

    .line 8
    .line 9
    iput-object v0, p0, Lvl;->a:Ljava/lang/String;

    .line 10
    .line 11
    const-class v1, Lu30;

    .line 12
    .line 13
    invoke-static {v1}, Lbx;->b(Ljava/lang/Class;)Lbx;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0, v1}, Lvl;->a(Lbx;)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Lbx;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v3, 0x1

    .line 24
    const-class v4, Lub0;

    .line 25
    .line 26
    invoke-direct {v1, v2, v3, v4}, Lbx;-><init>(IILjava/lang/Class;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v1}, Lvl;->a(Lbx;)V

    .line 30
    .line 31
    .line 32
    new-instance v1, Lsw0;

    .line 33
    .line 34
    const-class v4, Lwf;

    .line 35
    .line 36
    const-class v5, Ljava/util/concurrent/ExecutorService;

    .line 37
    .line 38
    invoke-direct {v1, v4, v5}, Lsw0;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 39
    .line 40
    .line 41
    new-instance v4, Lbx;

    .line 42
    .line 43
    invoke-direct {v4, v1, v3, v2}, Lbx;-><init>(Lsw0;II)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v4}, Lvl;->a(Lbx;)V

    .line 47
    .line 48
    .line 49
    new-instance v1, Lsw0;

    .line 50
    .line 51
    const-class v4, Lqg;

    .line 52
    .line 53
    const-class v5, Ljava/util/concurrent/Executor;

    .line 54
    .line 55
    invoke-direct {v1, v4, v5}, Lsw0;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 56
    .line 57
    .line 58
    new-instance v4, Lbx;

    .line 59
    .line 60
    invoke-direct {v4, v1, v3, v2}, Lbx;-><init>(Lsw0;II)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v4}, Lvl;->a(Lbx;)V

    .line 64
    .line 65
    .line 66
    new-instance v1, Lz0;

    .line 67
    .line 68
    const/16 v4, 0x1d

    .line 69
    .line 70
    invoke-direct {v1, v4}, Lz0;-><init>(I)V

    .line 71
    .line 72
    .line 73
    iput-object v1, p0, Lvl;->f:Ljm;

    .line 74
    .line 75
    invoke-virtual {p0}, Lvl;->b()Lwl;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    new-instance v1, Ltb0;

    .line 80
    .line 81
    invoke-direct {v1, v2}, Ltb0;-><init>(I)V

    .line 82
    .line 83
    .line 84
    const-class v4, Ltb0;

    .line 85
    .line 86
    invoke-static {v4}, Lwl;->b(Ljava/lang/Class;)Lvl;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    iput v3, v4, Lvl;->e:I

    .line 91
    .line 92
    new-instance v3, Lul;

    .line 93
    .line 94
    invoke-direct {v3, v2, v1}, Lul;-><init>(ILjava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    iput-object v3, v4, Lvl;->f:Ljm;

    .line 98
    .line 99
    invoke-virtual {v4}, Lvl;->b()Lwl;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    const-string v2, "19.1.0"

    .line 104
    .line 105
    invoke-static {v0, v2}, Lju1;->j(Ljava/lang/String;Ljava/lang/String;)Lwl;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    filled-new-array {p0, v1, v0}, [Lwl;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    return-object p0
.end method
