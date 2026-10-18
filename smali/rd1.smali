.class public final Lrd1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lqd1;


# instance fields
.field public final a:Ljava/util/Set;

.field public final b:Lqf;

.field public final c:Lxd1;


# direct methods
.method public constructor <init>(Ljava/util/Set;Lqf;Lxd1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrd1;->a:Ljava/util/Set;

    .line 5
    .line 6
    iput-object p2, p0, Lrd1;->b:Lqf;

    .line 7
    .line 8
    iput-object p3, p0, Lrd1;->c:Lxd1;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;La10;Lnd1;)Law;
    .locals 9

    .line 1
    iget-object v0, p0, Lrd1;->a:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    new-instance v2, Law;

    .line 10
    .line 11
    iget-object v7, p0, Lrd1;->c:Lxd1;

    .line 12
    .line 13
    const/4 v8, 0x4

    .line 14
    iget-object v3, p0, Lrd1;->b:Lqf;

    .line 15
    .line 16
    move-object v4, p1

    .line 17
    move-object v5, p2

    .line 18
    move-object v6, p3

    .line 19
    invoke-direct/range {v2 .. v8}, Law;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 20
    .line 21
    .line 22
    return-object v2

    .line 23
    :cond_0
    move-object v5, p2

    .line 24
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 25
    .line 26
    const-string p1, "%s is not supported byt this factory. Supported encodings are: %s."

    .line 27
    .line 28
    filled-new-array {v5, v0}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    throw p0
.end method
