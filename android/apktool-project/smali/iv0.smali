.class public final Liv0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lgb1;

.field public final c:I

.field public final d:Lgb1;

.field public final e:Lgb1;

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lmg1;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Liv0;->a:Landroid/content/Context;

    .line 11
    .line 12
    new-instance p1, Lhv0;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-direct {p1, p0, v0}, Lhv0;-><init>(Liv0;I)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Lgb1;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Lgb1;-><init>(Lp80;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Liv0;->b:Lgb1;

    .line 24
    .line 25
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Liv0;->c:I

    .line 30
    .line 31
    new-instance p1, Lxl;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-direct {p1, v0, p2}, Lxl;-><init>(ILjava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    new-instance p2, Lgb1;

    .line 38
    .line 39
    invoke-direct {p2, p1}, Lgb1;-><init>(Lp80;)V

    .line 40
    .line 41
    .line 42
    iput-object p2, p0, Liv0;->d:Lgb1;

    .line 43
    .line 44
    new-instance p1, Lhv0;

    .line 45
    .line 46
    invoke-direct {p1, p0, v0}, Lhv0;-><init>(Liv0;I)V

    .line 47
    .line 48
    .line 49
    new-instance p2, Lgb1;

    .line 50
    .line 51
    invoke-direct {p2, p1}, Lgb1;-><init>(Lp80;)V

    .line 52
    .line 53
    .line 54
    iput-object p2, p0, Liv0;->e:Lgb1;

    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Liv0;->b:Lgb1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lgb1;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public final b(Ljava/util/Map;)Ljava/util/Map;
    .locals 3

    .line 1
    iget-object v0, p0, Liv0;->d:Lgb1;

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    new-instance v1, Ljava/util/LinkedHashMap;

    .line 6
    .line 7
    invoke-direct {v1, p1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Liv0;->a()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance p1, Lgv0;

    .line 15
    .line 16
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {v0}, Lgb1;->getValue()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ljava/lang/String;

    .line 25
    .line 26
    invoke-direct {p1, v2, v0}, Lgv0;-><init>(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-interface {v1, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    invoke-interface {v1}, Ljava/util/Map;->size()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    if-eq p0, p1, :cond_0

    .line 40
    .line 41
    new-instance p0, Ljava/util/LinkedHashMap;

    .line 42
    .line 43
    invoke-direct {p0, v1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 44
    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_0
    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, Ljava/util/Map$Entry;

    .line 60
    .line 61
    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {p1, p0}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 74
    .line 75
    .line 76
    return-object p0

    .line 77
    :cond_1
    sget-object p0, Lv00;->j:Lv00;

    .line 78
    .line 79
    return-object p0

    .line 80
    :cond_2
    invoke-virtual {p0}, Liv0;->a()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    new-instance p1, Lgv0;

    .line 85
    .line 86
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    invoke-virtual {v0}, Lgb1;->getValue()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Ljava/lang/String;

    .line 95
    .line 96
    invoke-direct {p1, v1, v0}, Lgv0;-><init>(ILjava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-static {p0, p1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 104
    .line 105
    .line 106
    return-object p0
.end method
