.class public abstract Lsa0;
.super Ljg;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lu5;


# instance fields
.field public final H:Ljava/util/Set;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;ILi7;Lxa0;Lya0;)V
    .locals 9

    .line 1
    invoke-static {p1}, Lmb2;->a(Landroid/content/Context;)Lmb2;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    sget-object v4, Lva0;->d:Lva0;

    .line 6
    .line 7
    invoke-static {p5}, Lbh;->h(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p6}, Lbh;->h(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    new-instance v6, Lmd1;

    .line 14
    .line 15
    const/4 v0, 0x4

    .line 16
    invoke-direct {v6, v0, p5}, Lmd1;-><init>(ILjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    new-instance v7, Lny0;

    .line 20
    .line 21
    const/16 p5, 0xe

    .line 22
    .line 23
    invoke-direct {v7, p5, p6}, Lny0;-><init>(ILjava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object p5, p4, Li7;->m:Ljava/lang/Object;

    .line 27
    .line 28
    move-object v8, p5

    .line 29
    check-cast v8, Ljava/lang/String;

    .line 30
    .line 31
    move-object v0, p0

    .line 32
    move-object v1, p1

    .line 33
    move-object v2, p2

    .line 34
    move v5, p3

    .line 35
    invoke-direct/range {v0 .. v8}, Ljg;-><init>(Landroid/content/Context;Landroid/os/Looper;Lmb2;Lwa0;ILgg;Lhg;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p4, Li7;->k:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast p0, Ljava/util/Set;

    .line 41
    .line 42
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    if-eqz p2, :cond_1

    .line 51
    .line 52
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    check-cast p2, Lcom/google/android/gms/common/api/Scope;

    .line 57
    .line 58
    invoke-interface {p0, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    if-eqz p2, :cond_0

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    const-string p0, "Expanding scopes is not permitted, use implied scopes instead"

    .line 66
    .line 67
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    const/4 p0, 0x0

    .line 71
    throw p0

    .line 72
    :cond_1
    iput-object p0, v0, Lsa0;->H:Ljava/util/Set;

    .line 73
    .line 74
    return-void
.end method


# virtual methods
.method public final a()Ljava/util/Set;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljg;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lsa0;->H:Ljava/util/Set;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 11
    .line 12
    return-object p0
.end method

.method public final o()Landroid/accounts/Account;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final r()Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lsa0;->H:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method
