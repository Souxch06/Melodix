.class public Lcom/google/firebase/abt/component/AbtRegistrar;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


# static fields
.field private static final LIBRARY_NAME:Ljava/lang/String; = "fire-abt"


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

.method public static synthetic a(Li7;)Lw0;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/firebase/abt/component/AbtRegistrar;->lambda$getComponents$0(Lgm;)Lw0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static synthetic lambda$getComponents$0(Lgm;)Lw0;
    .locals 3

    .line 1
    new-instance v0, Lw0;

    .line 2
    .line 3
    const-class v1, Landroid/content/Context;

    .line 4
    .line 5
    invoke-interface {p0, v1}, Lgm;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Landroid/content/Context;

    .line 10
    .line 11
    const-class v2, Lj4;

    .line 12
    .line 13
    invoke-interface {p0, v2}, Lgm;->d(Ljava/lang/Class;)Llw0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-direct {v0, v1, p0}, Lw0;-><init>(Landroid/content/Context;Llw0;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method


# virtual methods
.method public getComponents()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lwl;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lw0;

    .line 2
    .line 3
    invoke-static {p0}, Lwl;->b(Ljava/lang/Class;)Lvl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "fire-abt"

    .line 8
    .line 9
    iput-object v0, p0, Lvl;->a:Ljava/lang/String;

    .line 10
    .line 11
    const-class v1, Landroid/content/Context;

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
    const/4 v2, 0x1

    .line 23
    const/4 v3, 0x0

    .line 24
    const-class v4, Lj4;

    .line 25
    .line 26
    invoke-direct {v1, v3, v2, v4}, Lbx;-><init>(IILjava/lang/Class;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v1}, Lvl;->a(Lbx;)V

    .line 30
    .line 31
    .line 32
    new-instance v1, Lz0;

    .line 33
    .line 34
    invoke-direct {v1, v3}, Lz0;-><init>(I)V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Lvl;->f:Ljm;

    .line 38
    .line 39
    invoke-virtual {p0}, Lvl;->b()Lwl;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string v1, "21.1.1"

    .line 44
    .line 45
    invoke-static {v0, v1}, Lju1;->j(Ljava/lang/String;Ljava/lang/String;)Lwl;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    filled-new-array {p0, v0}, [Lwl;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method
