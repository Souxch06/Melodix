.class public final Lb60;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ls50;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ls50;

.field public final synthetic l:Ljava/io/Serializable;


# direct methods
.method public constructor <init>(Lfu;Ls50;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lb60;->j:I

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lb60;->l:Ljava/io/Serializable;

    iput-object p2, p0, Lb60;->k:Ls50;

    return-void
.end method

.method public constructor <init>(Ls50;Lhz0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lb60;->j:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lb60;->k:Ls50;

    .line 8
    .line 9
    iput-object p2, p0, Lb60;->l:Ljava/io/Serializable;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final h(Ljava/lang/Object;Liq;)Ljava/lang/Object;
    .locals 9

    .line 1
    iget v0, p0, Lb60;->j:I

    .line 2
    .line 3
    sget-object v1, Lwe1;->a:Lwe1;

    .line 4
    .line 5
    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 6
    .line 7
    sget-object v3, Lar;->j:Lar;

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    const/high16 v5, -0x80000000

    .line 11
    .line 12
    const/4 v6, 0x0

    .line 13
    packed-switch v0, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    instance-of v0, p2, Lf60;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    move-object v0, p2

    .line 21
    check-cast v0, Lf60;

    .line 22
    .line 23
    iget v7, v0, Lf60;->o:I

    .line 24
    .line 25
    and-int v8, v7, v5

    .line 26
    .line 27
    if-eqz v8, :cond_0

    .line 28
    .line 29
    sub-int/2addr v7, v5

    .line 30
    iput v7, v0, Lf60;->o:I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    new-instance v0, Lf60;

    .line 34
    .line 35
    invoke-direct {v0, p0, p2}, Lf60;-><init>(Lb60;Liq;)V

    .line 36
    .line 37
    .line 38
    :goto_0
    iget-object p2, v0, Lf60;->n:Ljava/lang/Object;

    .line 39
    .line 40
    iget v5, v0, Lf60;->o:I

    .line 41
    .line 42
    const/4 v7, 0x2

    .line 43
    if-eqz v5, :cond_3

    .line 44
    .line 45
    if-eq v5, v4, :cond_2

    .line 46
    .line 47
    if-ne v5, v7, :cond_1

    .line 48
    .line 49
    iget-object p0, v0, Lf60;->m:Lb60;

    .line 50
    .line 51
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    goto :goto_3

    .line 55
    :cond_1
    invoke-static {v2}, Lz0;->g(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    move-object v1, v6

    .line 59
    goto :goto_4

    .line 60
    :cond_2
    iget-object p1, v0, Lf60;->q:Ljava/lang/Object;

    .line 61
    .line 62
    iget-object p0, v0, Lf60;->m:Lb60;

    .line 63
    .line 64
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_3
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    iget-object p2, p0, Lb60;->l:Ljava/io/Serializable;

    .line 72
    .line 73
    check-cast p2, Lfu;

    .line 74
    .line 75
    iput-object p0, v0, Lf60;->m:Lb60;

    .line 76
    .line 77
    iput-object p1, v0, Lf60;->q:Ljava/lang/Object;

    .line 78
    .line 79
    iput v4, v0, Lf60;->o:I

    .line 80
    .line 81
    invoke-virtual {p2, p1, v0}, Lfu;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    if-ne p2, v3, :cond_4

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_4
    :goto_1
    check-cast p2, Ljava/lang/Boolean;

    .line 89
    .line 90
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    if-eqz p2, :cond_5

    .line 95
    .line 96
    iget-object p2, p0, Lb60;->k:Ls50;

    .line 97
    .line 98
    iput-object p0, v0, Lf60;->m:Lb60;

    .line 99
    .line 100
    iput-object v6, v0, Lf60;->q:Ljava/lang/Object;

    .line 101
    .line 102
    iput v7, v0, Lf60;->o:I

    .line 103
    .line 104
    invoke-interface {p2, p1, v0}, Ls50;->h(Ljava/lang/Object;Liq;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    if-ne p1, v3, :cond_6

    .line 109
    .line 110
    :goto_2
    move-object v1, v3

    .line 111
    goto :goto_4

    .line 112
    :cond_5
    const/4 v4, 0x0

    .line 113
    :cond_6
    :goto_3
    if-eqz v4, :cond_7

    .line 114
    .line 115
    :goto_4
    return-object v1

    .line 116
    :cond_7
    new-instance p1, Lc;

    .line 117
    .line 118
    invoke-direct {p1, p0}, Lc;-><init>(Ls50;)V

    .line 119
    .line 120
    .line 121
    throw p1

    .line 122
    :pswitch_0
    instance-of v0, p2, La60;

    .line 123
    .line 124
    if-eqz v0, :cond_8

    .line 125
    .line 126
    move-object v0, p2

    .line 127
    check-cast v0, La60;

    .line 128
    .line 129
    iget v7, v0, La60;->p:I

    .line 130
    .line 131
    and-int v8, v7, v5

    .line 132
    .line 133
    if-eqz v8, :cond_8

    .line 134
    .line 135
    sub-int/2addr v7, v5

    .line 136
    iput v7, v0, La60;->p:I

    .line 137
    .line 138
    goto :goto_5

    .line 139
    :cond_8
    new-instance v0, La60;

    .line 140
    .line 141
    invoke-direct {v0, p0, p2}, La60;-><init>(Lb60;Liq;)V

    .line 142
    .line 143
    .line 144
    :goto_5
    iget-object p2, v0, La60;->n:Ljava/lang/Object;

    .line 145
    .line 146
    iget v5, v0, La60;->p:I

    .line 147
    .line 148
    if-eqz v5, :cond_a

    .line 149
    .line 150
    if-ne v5, v4, :cond_9

    .line 151
    .line 152
    iget-object p0, v0, La60;->m:Lb60;

    .line 153
    .line 154
    :try_start_0
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 155
    .line 156
    .line 157
    goto :goto_6

    .line 158
    :catchall_0
    move-exception p1

    .line 159
    goto :goto_7

    .line 160
    :cond_9
    invoke-static {v2}, Lz0;->g(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    move-object v1, v6

    .line 164
    goto :goto_6

    .line 165
    :cond_a
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 166
    .line 167
    .line 168
    :try_start_1
    iget-object p2, p0, Lb60;->k:Ls50;

    .line 169
    .line 170
    iput-object p0, v0, La60;->m:Lb60;

    .line 171
    .line 172
    iput v4, v0, La60;->p:I

    .line 173
    .line 174
    invoke-interface {p2, p1, v0}, Ls50;->h(Ljava/lang/Object;Liq;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 178
    if-ne p0, v3, :cond_b

    .line 179
    .line 180
    move-object v1, v3

    .line 181
    :cond_b
    :goto_6
    return-object v1

    .line 182
    :goto_7
    iget-object p0, p0, Lb60;->l:Ljava/io/Serializable;

    .line 183
    .line 184
    check-cast p0, Lhz0;

    .line 185
    .line 186
    iput-object p1, p0, Lhz0;->j:Ljava/lang/Object;

    .line 187
    .line 188
    throw p1

    .line 189
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
