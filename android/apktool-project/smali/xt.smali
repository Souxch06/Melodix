.class public final Lxt;
.super Lcb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lf90;


# instance fields
.field public n:Ljava/util/Iterator;

.field public o:Lg71;

.field public p:Ljava/lang/Object;

.field public q:I

.field public synthetic r:Ljava/lang/Object;

.field public final synthetic s:Ljava/util/List;

.field public final synthetic t:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/ArrayList;Liq;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lxt;->s:Ljava/util/List;

    .line 2
    .line 3
    iput-object p2, p0, Lxt;->t:Ljava/util/ArrayList;

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-direct {p0, p1, p3}, Lcb1;-><init>(ILiq;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Liq;

    .line 2
    .line 3
    invoke-virtual {p0, p2, p1}, Lxt;->j(Liq;Ljava/lang/Object;)Liq;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lxt;

    .line 8
    .line 9
    sget-object p1, Lwe1;->a:Lwe1;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lxt;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final j(Liq;Ljava/lang/Object;)Liq;
    .locals 2

    .line 1
    new-instance v0, Lxt;

    .line 2
    .line 3
    iget-object v1, p0, Lxt;->s:Ljava/util/List;

    .line 4
    .line 5
    iget-object p0, p0, Lxt;->t:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0, p1}, Lxt;-><init>(Ljava/util/List;Ljava/util/ArrayList;Liq;)V

    .line 8
    .line 9
    .line 10
    iput-object p2, v0, Lxt;->r:Ljava/lang/Object;

    .line 11
    .line 12
    return-object v0
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11

    .line 1
    iget v0, p0, Lxt;->q:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x1

    .line 5
    const/4 v3, 0x0

    .line 6
    sget-object v4, Lar;->j:Lar;

    .line 7
    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    if-eq v0, v2, :cond_1

    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lxt;->n:Ljava/util/Iterator;

    .line 15
    .line 16
    iget-object v5, p0, Lxt;->r:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v5, Ljava/util/List;

    .line 19
    .line 20
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 25
    .line 26
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-object v3

    .line 30
    :cond_1
    iget-object v0, p0, Lxt;->p:Ljava/lang/Object;

    .line 31
    .line 32
    iget-object v5, p0, Lxt;->o:Lg71;

    .line 33
    .line 34
    iget-object v6, p0, Lxt;->n:Ljava/util/Iterator;

    .line 35
    .line 36
    iget-object v7, p0, Lxt;->r:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v7, Ljava/util/List;

    .line 39
    .line 40
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    move-object v10, v7

    .line 44
    move-object v7, v5

    .line 45
    move-object v5, v10

    .line 46
    goto :goto_1

    .line 47
    :cond_2
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lxt;->r:Ljava/lang/Object;

    .line 51
    .line 52
    iget-object v0, p0, Lxt;->s:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v5, p0, Lxt;->t:Ljava/util/ArrayList;

    .line 59
    .line 60
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    if-eqz v6, :cond_6

    .line 65
    .line 66
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    check-cast v6, Lg71;

    .line 71
    .line 72
    iput-object v5, p0, Lxt;->r:Ljava/lang/Object;

    .line 73
    .line 74
    iput-object v0, p0, Lxt;->n:Ljava/util/Iterator;

    .line 75
    .line 76
    iput-object v6, p0, Lxt;->o:Lg71;

    .line 77
    .line 78
    iput-object p1, p0, Lxt;->p:Ljava/lang/Object;

    .line 79
    .line 80
    iput v2, p0, Lxt;->q:I

    .line 81
    .line 82
    invoke-virtual {v6, p1, p0}, Lg71;->a(Ljava/lang/Object;Lkq;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v7

    .line 86
    if-ne v7, v4, :cond_3

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_3
    move-object v10, v0

    .line 90
    move-object v0, p1

    .line 91
    move-object p1, v7

    .line 92
    move-object v7, v6

    .line 93
    move-object v6, v10

    .line 94
    :goto_1
    check-cast p1, Ljava/lang/Boolean;

    .line 95
    .line 96
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_5

    .line 101
    .line 102
    new-instance p1, Lwt;

    .line 103
    .line 104
    const/4 v8, 0x0

    .line 105
    invoke-direct {p1, v7, v3, v8}, Lwt;-><init>(Ljava/lang/Object;Liq;I)V

    .line 106
    .line 107
    .line 108
    invoke-interface {v5, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    iput-object v5, p0, Lxt;->r:Ljava/lang/Object;

    .line 112
    .line 113
    iput-object v6, p0, Lxt;->n:Ljava/util/Iterator;

    .line 114
    .line 115
    iput-object v3, p0, Lxt;->o:Lg71;

    .line 116
    .line 117
    iput-object v3, p0, Lxt;->p:Ljava/lang/Object;

    .line 118
    .line 119
    iput v1, p0, Lxt;->q:I

    .line 120
    .line 121
    iget-object p1, v7, Lg71;->b:Lh71;

    .line 122
    .line 123
    new-instance v8, Lk71;

    .line 124
    .line 125
    iget-object v9, v7, Lg71;->e:Lgb1;

    .line 126
    .line 127
    invoke-virtual {v9}, Lgb1;->getValue()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v9

    .line 131
    check-cast v9, Landroid/content/SharedPreferences;

    .line 132
    .line 133
    iget-object v7, v7, Lg71;->f:Ljava/util/LinkedHashSet;

    .line 134
    .line 135
    invoke-direct {v8, v9, v7}, Lk71;-><init>(Landroid/content/SharedPreferences;Ljava/util/Set;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1, v8, v0, p0}, Lh71;->e(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    if-ne p1, v4, :cond_4

    .line 143
    .line 144
    :goto_2
    return-object v4

    .line 145
    :cond_4
    :goto_3
    move-object v0, v6

    .line 146
    goto :goto_0

    .line 147
    :cond_5
    move-object p1, v0

    .line 148
    goto :goto_3

    .line 149
    :cond_6
    return-object p1
.end method
