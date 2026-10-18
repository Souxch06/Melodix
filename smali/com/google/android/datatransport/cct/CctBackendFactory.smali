.class public Lcom/google/android/datatransport/cct/CctBackendFactory;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


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


# virtual methods
.method public create(Lct;)Lpd1;
    .locals 2

    .line 1
    new-instance p0, Lhj;

    .line 2
    .line 3
    move-object v0, p1

    .line 4
    check-cast v0, Lie;

    .line 5
    .line 6
    iget-object v0, v0, Lie;->a:Landroid/content/Context;

    .line 7
    .line 8
    check-cast p1, Lie;

    .line 9
    .line 10
    iget-object v1, p1, Lie;->b:Lok;

    .line 11
    .line 12
    iget-object p1, p1, Lie;->c:Lok;

    .line 13
    .line 14
    invoke-direct {p0, v0, v1, p1}, Lhj;-><init>(Landroid/content/Context;Lok;Lok;)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method
