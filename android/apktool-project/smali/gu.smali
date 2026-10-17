.class public final Lgu;
.super Lcb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lf90;


# instance fields
.field public final synthetic n:I

.field public synthetic o:Ljava/lang/Object;

.field public final synthetic p:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Liq;I)V
    .locals 0

    .line 1
    iput p3, p0, Lgu;->n:I

    .line 2
    .line 3
    iput-object p1, p0, Lgu;->p:Ljava/lang/Object;

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-direct {p0, p1, p2}, Lcb1;-><init>(ILiq;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, Lgu;->n:I

    .line 2
    .line 3
    sget-object v1, Lwe1;->a:Lwe1;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p1, Lxo0;

    .line 9
    .line 10
    check-cast p2, Liq;

    .line 11
    .line 12
    invoke-virtual {p0, p2, p1}, Lgu;->j(Liq;Ljava/lang/Object;)Liq;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lgu;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Lgu;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :pswitch_0
    check-cast p1, Lzq;

    .line 24
    .line 25
    check-cast p2, Liq;

    .line 26
    .line 27
    invoke-virtual {p0, p2, p1}, Lgu;->j(Liq;Ljava/lang/Object;)Liq;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lgu;

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Lgu;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    throw p0

    .line 38
    :pswitch_1
    check-cast p1, Lxo0;

    .line 39
    .line 40
    check-cast p2, Liq;

    .line 41
    .line 42
    invoke-virtual {p0, p2, p1}, Lgu;->j(Liq;Ljava/lang/Object;)Liq;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Lgu;

    .line 47
    .line 48
    invoke-virtual {p0, v1}, Lgu;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    return-object v1

    .line 52
    :pswitch_2
    check-cast p1, Lr91;

    .line 53
    .line 54
    check-cast p2, Liq;

    .line 55
    .line 56
    invoke-virtual {p0, p2, p1}, Lgu;->j(Liq;Ljava/lang/Object;)Liq;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Lgu;

    .line 61
    .line 62
    invoke-virtual {p0, v1}, Lgu;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0

    .line 67
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final j(Liq;Ljava/lang/Object;)Liq;
    .locals 2

    .line 1
    iget v0, p0, Lgu;->n:I

    .line 2
    .line 3
    iget-object p0, p0, Lgu;->p:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    new-instance v0, Lgu;

    .line 9
    .line 10
    check-cast p0, Ljava/util/Set;

    .line 11
    .line 12
    const/4 v1, 0x3

    .line 13
    invoke-direct {v0, p0, p1, v1}, Lgu;-><init>(Ljava/lang/Object;Liq;I)V

    .line 14
    .line 15
    .line 16
    iput-object p2, v0, Lgu;->o:Ljava/lang/Object;

    .line 17
    .line 18
    return-object v0

    .line 19
    :pswitch_0
    new-instance v0, Lgu;

    .line 20
    .line 21
    check-cast p0, Lkm0;

    .line 22
    .line 23
    const/4 v1, 0x2

    .line 24
    invoke-direct {v0, p0, p1, v1}, Lgu;-><init>(Ljava/lang/Object;Liq;I)V

    .line 25
    .line 26
    .line 27
    iput-object p2, v0, Lgu;->o:Ljava/lang/Object;

    .line 28
    .line 29
    return-object v0

    .line 30
    :pswitch_1
    new-instance v0, Lgu;

    .line 31
    .line 32
    check-cast p0, Lr80;

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-direct {v0, p0, p1, v1}, Lgu;-><init>(Ljava/lang/Object;Liq;I)V

    .line 36
    .line 37
    .line 38
    iput-object p2, v0, Lgu;->o:Ljava/lang/Object;

    .line 39
    .line 40
    return-object v0

    .line 41
    :pswitch_2
    new-instance v0, Lgu;

    .line 42
    .line 43
    check-cast p0, Lr91;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-direct {v0, p0, p1, v1}, Lgu;-><init>(Ljava/lang/Object;Liq;I)V

    .line 47
    .line 48
    .line 49
    iput-object p2, v0, Lgu;->o:Ljava/lang/Object;

    .line 50
    .line 51
    return-object v0

    .line 52
    nop

    .line 53
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, Lgu;->n:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    iget-object v3, p0, Lgu;->p:Ljava/lang/Object;

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lgu;->o:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Lxo0;

    .line 16
    .line 17
    invoke-virtual {p0}, Lxo0;->a()Ljava/util/Map;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance p1, Ljava/util/ArrayList;

    .line 26
    .line 27
    const/16 v0, 0xa

    .line 28
    .line 29
    invoke-static {p0, v0}, Ldl;->w(Ljava/lang/Iterable;I)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 34
    .line 35
    .line 36
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lnu0;

    .line 51
    .line 52
    iget-object v0, v0, Lnu0;->a:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    check-cast v3, Ljava/util/Set;

    .line 59
    .line 60
    sget-object p0, Li71;->a:Ljava/util/LinkedHashSet;

    .line 61
    .line 62
    if-ne v3, p0, :cond_1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_3

    .line 70
    .line 71
    :cond_2
    move v1, v2

    .line 72
    goto :goto_1

    .line 73
    :cond_3
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    :cond_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_2

    .line 82
    .line 83
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_4

    .line 94
    .line 95
    :goto_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0

    .line 100
    :pswitch_0
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Lgu;->o:Ljava/lang/Object;

    .line 104
    .line 105
    check-cast p0, Lzq;

    .line 106
    .line 107
    const/4 p0, 0x0

    .line 108
    throw p0

    .line 109
    :pswitch_1
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    iget-object p0, p0, Lgu;->o:Ljava/lang/Object;

    .line 113
    .line 114
    check-cast p0, Lxo0;

    .line 115
    .line 116
    check-cast v3, Lr80;

    .line 117
    .line 118
    invoke-interface {v3, p0}, Lr80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    sget-object p0, Lwe1;->a:Lwe1;

    .line 122
    .line 123
    return-object p0

    .line 124
    :pswitch_2
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    iget-object p0, p0, Lgu;->o:Ljava/lang/Object;

    .line 128
    .line 129
    check-cast p0, Lr91;

    .line 130
    .line 131
    instance-of p1, p0, Lpt;

    .line 132
    .line 133
    if-eqz p1, :cond_5

    .line 134
    .line 135
    iget p0, p0, Lr91;->a:I

    .line 136
    .line 137
    check-cast v3, Lr91;

    .line 138
    .line 139
    iget p1, v3, Lr91;->a:I

    .line 140
    .line 141
    if-gt p0, p1, :cond_5

    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_5
    move v1, v2

    .line 145
    :goto_2
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    return-object p0

    .line 150
    nop

    .line 151
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
