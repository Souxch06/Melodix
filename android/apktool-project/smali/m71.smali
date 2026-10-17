.class public final Lm71;
.super Lcb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lf90;


# instance fields
.field public final synthetic n:I

.field public o:I

.field public final synthetic p:Lq71;


# direct methods
.method public synthetic constructor <init>(Lq71;Liq;I)V
    .locals 0

    .line 1
    iput p3, p0, Lm71;->n:I

    .line 2
    .line 3
    iput-object p1, p0, Lm71;->p:Lq71;

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
    iget v0, p0, Lm71;->n:I

    .line 2
    .line 3
    sget-object v1, Lwe1;->a:Lwe1;

    .line 4
    .line 5
    check-cast p1, Lzq;

    .line 6
    .line 7
    check-cast p2, Liq;

    .line 8
    .line 9
    packed-switch v0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p2, p1}, Lm71;->j(Liq;Ljava/lang/Object;)Liq;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lm71;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Lm71;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :pswitch_0
    invoke-virtual {p0, p2, p1}, Lm71;->j(Liq;Ljava/lang/Object;)Liq;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lm71;

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Lm71;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    nop

    .line 35
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final j(Liq;Ljava/lang/Object;)Liq;
    .locals 1

    .line 1
    iget p2, p0, Lm71;->n:I

    .line 2
    .line 3
    iget-object p0, p0, Lm71;->p:Lq71;

    .line 4
    .line 5
    packed-switch p2, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    new-instance p2, Lm71;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-direct {p2, p0, p1, v0}, Lm71;-><init>(Lq71;Liq;I)V

    .line 12
    .line 13
    .line 14
    return-object p2

    .line 15
    :pswitch_0
    new-instance p2, Lm71;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-direct {p2, p0, p1, v0}, Lm71;-><init>(Lq71;Liq;I)V

    .line 19
    .line 20
    .line 21
    return-object p2

    .line 22
    nop

    .line 23
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    iget v0, p0, Lm71;->n:I

    .line 2
    .line 3
    sget-object v1, Lwe1;->a:Lwe1;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    .line 7
    .line 8
    sget-object v4, Lar;->j:Lar;

    .line 9
    .line 10
    iget-object v5, p0, Lm71;->p:Lq71;

    .line 11
    .line 12
    const/4 v6, 0x1

    .line 13
    const/4 v7, 0x0

    .line 14
    packed-switch v0, :pswitch_data_0

    .line 15
    .line 16
    .line 17
    iget v0, p0, Lm71;->o:I

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    if-ne v0, v6, :cond_0

    .line 22
    .line 23
    :try_start_0
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    goto :goto_1

    .line 27
    :catch_0
    move-exception p0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {v3}, Lz0;->g(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    move-object v1, v7

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :try_start_1
    iget-object p1, v5, Lq71;->e:Lyt;

    .line 38
    .line 39
    new-instance v0, Lo71;

    .line 40
    .line 41
    invoke-direct {v0, v5, v7, v2}, Lo71;-><init>(Lq71;Liq;I)V

    .line 42
    .line 43
    .line 44
    iput v6, p0, Lm71;->o:I

    .line 45
    .line 46
    invoke-interface {p1, v0, p0}, Lyt;->a(Lf90;Lkq;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 50
    if-ne p0, v4, :cond_2

    .line 51
    .line 52
    move-object v1, v4

    .line 53
    goto :goto_1

    .line 54
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    iget-object p0, v5, Lq71;->h:Lu41;

    .line 58
    .line 59
    if-eqz p0, :cond_3

    .line 60
    .line 61
    iget-object p1, v5, Lq71;->d:Lkc1;

    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    .line 65
    .line 66
    invoke-static {}, Lkc1;->a()Ljc1;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    const/4 v0, 0x5

    .line 71
    invoke-static {p0, v7, p1, v7, v0}, Lu41;->a(Lu41;Ly41;Ljc1;Ljava/util/Map;I)Lu41;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    iput-object p0, v5, Lq71;->h:Lu41;

    .line 76
    .line 77
    :cond_2
    :goto_1
    return-object v1

    .line 78
    :cond_3
    const-string p0, "localSessionData"

    .line 79
    .line 80
    invoke-static {p0}, Ldl1;->p(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    throw v7

    .line 84
    :pswitch_0
    iget v0, p0, Lm71;->o:I

    .line 85
    .line 86
    if-eqz v0, :cond_5

    .line 87
    .line 88
    if-ne v0, v6, :cond_4

    .line 89
    .line 90
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_4
    invoke-static {v3}, Lz0;->g(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    move-object v1, v7

    .line 98
    goto :goto_2

    .line 99
    :cond_5
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    iget-object p1, v5, Lq71;->e:Lyt;

    .line 103
    .line 104
    invoke-interface {p1}, Lyt;->getData()Lr50;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    new-instance v0, Ll71;

    .line 109
    .line 110
    invoke-direct {v0, v5, v7}, Ll71;-><init>(Lq71;Liq;)V

    .line 111
    .line 112
    .line 113
    new-instance v3, Ls7;

    .line 114
    .line 115
    const/16 v7, 0x16

    .line 116
    .line 117
    invoke-direct {v3, p1, v0, v7, v2}, Ls7;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 118
    .line 119
    .line 120
    new-instance p1, Lju;

    .line 121
    .line 122
    const/4 v0, 0x2

    .line 123
    invoke-direct {p1, v0, v5}, Lju;-><init>(ILjava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    iput v6, p0, Lm71;->o:I

    .line 127
    .line 128
    invoke-virtual {v3, p1, p0}, Ls7;->q(Ls50;Lkq;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    if-ne p0, v4, :cond_6

    .line 133
    .line 134
    move-object v1, v4

    .line 135
    :cond_6
    :goto_2
    return-object v1

    .line 136
    nop

    .line 137
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
