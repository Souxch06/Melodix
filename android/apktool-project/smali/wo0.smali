.class public final Lwo0;
.super Let;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    sget-object v0, Ldt;->k:Ldt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {p0, v1}, Let;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p0, Ljava/util/LinkedHashMap;

    .line 13
    .line 14
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Ljava/util/LinkedHashMap;

    .line 17
    .line 18
    invoke-interface {p0, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
