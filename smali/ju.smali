.class public final Lju;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ls50;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lju;->j:I

    .line 2
    .line 3
    iput-object p2, p0, Lju;->k:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final h(Ljava/lang/Object;Liq;)Ljava/lang/Object;
    .locals 8

    .line 1
    iget v0, p0, Lju;->j:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    sget-object v2, Lwe1;->a:Lwe1;

    .line 5
    .line 6
    sget-object v3, Lar;->j:Lar;

    .line 7
    .line 8
    iget-object v4, p0, Lju;->k:Ljava/lang/Object;

    .line 9
    .line 10
    packed-switch v0, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    check-cast p1, Lu41;

    .line 14
    .line 15
    check-cast v4, Lq71;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    iput-object p1, v4, Lq71;->h:Lu41;

    .line 21
    .line 22
    iget-boolean p0, v4, Lq71;->j:Z

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    iput-boolean p0, v4, Lq71;->j:Z

    .line 28
    .line 29
    invoke-virtual {v4}, Lq71;->b()V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p0, p1, Lu41;->a:Ly41;

    .line 33
    .line 34
    iget-object p0, p0, Ly41;->a:Ljava/lang/String;

    .line 35
    .line 36
    sget-object p1, Ln71;->j:Ln71;

    .line 37
    .line 38
    invoke-virtual {v4, p0, p1, p2}, Lq71;->e(Ljava/lang/String;Ln71;Liq;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    if-ne p0, v3, :cond_1

    .line 43
    .line 44
    move-object v2, p0

    .line 45
    :cond_1
    return-object v2

    .line 46
    :pswitch_0
    check-cast p1, Lwe1;

    .line 47
    .line 48
    check-cast v4, Lwu;

    .line 49
    .line 50
    iget-object p0, v4, Lwu;->h:Lbv1;

    .line 51
    .line 52
    invoke-virtual {p0}, Lbv1;->n()Lr91;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    instance-of p0, p0, Lp30;

    .line 57
    .line 58
    if-nez p0, :cond_2

    .line 59
    .line 60
    invoke-virtual {v4, v1, p2}, Lwu;->g(ZLiq;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    if-ne p0, v3, :cond_2

    .line 65
    .line 66
    move-object v2, p0

    .line 67
    :cond_2
    return-object v2

    .line 68
    :pswitch_1
    instance-of v0, p2, Liu;

    .line 69
    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    move-object v0, p2

    .line 73
    check-cast v0, Liu;

    .line 74
    .line 75
    iget v5, v0, Liu;->n:I

    .line 76
    .line 77
    const/high16 v6, -0x80000000

    .line 78
    .line 79
    and-int v7, v5, v6

    .line 80
    .line 81
    if-eqz v7, :cond_3

    .line 82
    .line 83
    sub-int/2addr v5, v6

    .line 84
    iput v5, v0, Liu;->n:I

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    new-instance v0, Liu;

    .line 88
    .line 89
    invoke-direct {v0, p0, p2}, Liu;-><init>(Lju;Liq;)V

    .line 90
    .line 91
    .line 92
    :goto_0
    iget-object p0, v0, Liu;->m:Ljava/lang/Object;

    .line 93
    .line 94
    iget p2, v0, Liu;->n:I

    .line 95
    .line 96
    const/4 v5, 0x0

    .line 97
    if-eqz p2, :cond_5

    .line 98
    .line 99
    if-ne p2, v1, :cond_4

    .line 100
    .line 101
    invoke-static {p0}, Lk42;->n(Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    goto :goto_3

    .line 105
    :cond_4
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 106
    .line 107
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    :goto_1
    move-object v2, v5

    .line 111
    goto :goto_3

    .line 112
    :cond_5
    invoke-static {p0}, Lk42;->n(Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    check-cast v4, Ls50;

    .line 116
    .line 117
    check-cast p1, Lr91;

    .line 118
    .line 119
    instance-of p0, p1, Lqx0;

    .line 120
    .line 121
    if-nez p0, :cond_a

    .line 122
    .line 123
    instance-of p0, p1, Lpt;

    .line 124
    .line 125
    if-eqz p0, :cond_6

    .line 126
    .line 127
    check-cast p1, Lpt;

    .line 128
    .line 129
    iget-object p0, p1, Lpt;->b:Ljava/lang/Object;

    .line 130
    .line 131
    iput v1, v0, Liu;->n:I

    .line 132
    .line 133
    invoke-interface {v4, p0, v0}, Ls50;->h(Ljava/lang/Object;Liq;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    if-ne p0, v3, :cond_8

    .line 138
    .line 139
    move-object v2, v3

    .line 140
    goto :goto_3

    .line 141
    :cond_6
    instance-of p0, p1, Lp30;

    .line 142
    .line 143
    if-eqz p0, :cond_7

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :cond_7
    instance-of v1, p1, Lqe1;

    .line 147
    .line 148
    :goto_2
    if-eqz v1, :cond_9

    .line 149
    .line 150
    const-string p0, "This is a bug in DataStore. Please file a bug at: https://issuetracker.google.com/issues/new?component=907884&template=1466542"

    .line 151
    .line 152
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_8
    :goto_3
    return-object v2

    .line 157
    :cond_9
    new-instance p0, Lrl;

    .line 158
    .line 159
    invoke-direct {p0}, Lrl;-><init>()V

    .line 160
    .line 161
    .line 162
    throw p0

    .line 163
    :cond_a
    check-cast p1, Lqx0;

    .line 164
    .line 165
    iget-object p0, p1, Lqx0;->b:Ljava/lang/Throwable;

    .line 166
    .line 167
    throw p0

    .line 168
    nop

    .line 169
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
