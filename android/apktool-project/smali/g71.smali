.class public final Lg71;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Lgu;

.field public final b:Lh71;

.field public final c:Landroid/content/Context;

.field public final d:Ljava/lang/String;

.field public final e:Lgb1;

.field public final f:Ljava/util/LinkedHashSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/util/Set;Lgu;Lh71;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lwt0;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, p1, p2, v1}, Lwt0;-><init>(Landroid/content/Context;Ljava/lang/Object;I)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p4, p0, Lg71;->a:Lgu;

    .line 14
    .line 15
    iput-object p5, p0, Lg71;->b:Lh71;

    .line 16
    .line 17
    iput-object p1, p0, Lg71;->c:Landroid/content/Context;

    .line 18
    .line 19
    iput-object p2, p0, Lg71;->d:Ljava/lang/String;

    .line 20
    .line 21
    new-instance p1, Lgb1;

    .line 22
    .line 23
    invoke-direct {p1, v0}, Lgb1;-><init>(Lp80;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lg71;->e:Lgb1;

    .line 27
    .line 28
    sget-object p1, Lj71;->a:Ljava/util/LinkedHashSet;

    .line 29
    .line 30
    if-ne p3, p1, :cond_0

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    new-instance p1, Ljava/util/LinkedHashSet;

    .line 35
    .line 36
    invoke-direct {p1, p3}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    iput-object p1, p0, Lg71;->f:Ljava/util/LinkedHashSet;

    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Lkq;)Ljava/lang/Object;
    .locals 4

    .line 1
    instance-of v0, p2, Lf71;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lf71;

    .line 7
    .line 8
    iget v1, v0, Lf71;->p:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Lf71;->p:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lf71;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Lf71;-><init>(Lg71;Lkq;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Lf71;->n:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, Lf71;->p:I

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    if-ne v1, v2, :cond_1

    .line 33
    .line 34
    iget-object p0, v0, Lf71;->m:Lg71;

    .line 35
    .line 36
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 41
    .line 42
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    return-object p0

    .line 47
    :cond_2
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    iput-object p0, v0, Lf71;->m:Lg71;

    .line 51
    .line 52
    iput v2, v0, Lf71;->p:I

    .line 53
    .line 54
    iget-object p2, p0, Lg71;->a:Lgu;

    .line 55
    .line 56
    invoke-virtual {p2, p1, v0}, Lgu;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    sget-object p1, Lar;->j:Lar;

    .line 61
    .line 62
    if-ne p2, p1, :cond_3

    .line 63
    .line 64
    return-object p1

    .line 65
    :cond_3
    :goto_1
    check-cast p2, Ljava/lang/Boolean;

    .line 66
    .line 67
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_4

    .line 72
    .line 73
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 74
    .line 75
    return-object p0

    .line 76
    :cond_4
    iget-object p1, p0, Lg71;->f:Ljava/util/LinkedHashSet;

    .line 77
    .line 78
    iget-object p0, p0, Lg71;->e:Lgb1;

    .line 79
    .line 80
    const/4 p2, 0x0

    .line 81
    if-nez p1, :cond_6

    .line 82
    .line 83
    invoke-virtual {p0}, Lgb1;->getValue()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    check-cast p0, Landroid/content/SharedPreferences;

    .line 88
    .line 89
    invoke-interface {p0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 94
    .line 95
    .line 96
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    if-nez p0, :cond_5

    .line 101
    .line 102
    goto :goto_3

    .line 103
    :cond_5
    :goto_2
    move v2, p2

    .line 104
    goto :goto_3

    .line 105
    :cond_6
    invoke-virtual {p0}, Lgb1;->getValue()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    check-cast p0, Landroid/content/SharedPreferences;

    .line 110
    .line 111
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-eqz v0, :cond_7

    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_7
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    :cond_8
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_5

    .line 127
    .line 128
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    check-cast v0, Ljava/lang/String;

    .line 133
    .line 134
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-eqz v0, :cond_8

    .line 139
    .line 140
    :goto_3
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    return-object p0
.end method
