.class public final Ld60;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ls50;


# instance fields
.field public final synthetic j:I

.field public final k:Ljava/lang/Object;

.field public final l:Ljava/lang/Object;

.field public final m:Lcb1;


# direct methods
.method public constructor <init>(Lez0;Ls50;Lgu;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Ld60;->j:I

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld60;->k:Ljava/lang/Object;

    iput-object p2, p0, Ld60;->l:Ljava/lang/Object;

    iput-object p3, p0, Ld60;->m:Lcb1;

    return-void
.end method

.method public constructor <init>(Ls50;Lsq;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Ld60;->j:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, Ld60;->k:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-static {p2}, Lbh;->D(Lsq;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iput-object p2, p0, Ld60;->l:Ljava/lang/Object;

    .line 14
    .line 15
    new-instance p2, Loj;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    const/16 v1, 0xe

    .line 19
    .line 20
    invoke-direct {p2, p1, v0, v1}, Loj;-><init>(Ljava/lang/Object;Liq;I)V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Ld60;->m:Lcb1;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final h(Ljava/lang/Object;Liq;)Ljava/lang/Object;
    .locals 11

    .line 1
    iget v0, p0, Ld60;->j:I

    .line 2
    .line 3
    sget-object v1, Lwe1;->a:Lwe1;

    .line 4
    .line 5
    sget-object v2, Lar;->j:Lar;

    .line 6
    .line 7
    iget-object v3, p0, Ld60;->m:Lcb1;

    .line 8
    .line 9
    iget-object v4, p0, Ld60;->l:Ljava/lang/Object;

    .line 10
    .line 11
    iget-object v5, p0, Ld60;->k:Ljava/lang/Object;

    .line 12
    .line 13
    packed-switch v0, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    check-cast v5, Lsq;

    .line 17
    .line 18
    check-cast v3, Loj;

    .line 19
    .line 20
    invoke-static {v5, p1, v4, v3, p2}, Ldl1;->r(Lsq;Ljava/lang/Object;Ljava/lang/Object;Lf90;Liq;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    if-ne p0, v2, :cond_0

    .line 25
    .line 26
    move-object v1, p0

    .line 27
    :cond_0
    return-object v1

    .line 28
    :pswitch_0
    instance-of v0, p2, Lc60;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    move-object v0, p2

    .line 33
    check-cast v0, Lc60;

    .line 34
    .line 35
    iget v6, v0, Lc60;->q:I

    .line 36
    .line 37
    const/high16 v7, -0x80000000

    .line 38
    .line 39
    and-int v8, v6, v7

    .line 40
    .line 41
    if-eqz v8, :cond_1

    .line 42
    .line 43
    sub-int/2addr v6, v7

    .line 44
    iput v6, v0, Lc60;->q:I

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    new-instance v0, Lc60;

    .line 48
    .line 49
    invoke-direct {v0, p0, p2}, Lc60;-><init>(Ld60;Liq;)V

    .line 50
    .line 51
    .line 52
    :goto_0
    iget-object p2, v0, Lc60;->o:Ljava/lang/Object;

    .line 53
    .line 54
    iget v6, v0, Lc60;->q:I

    .line 55
    .line 56
    const/4 v7, 0x0

    .line 57
    const/4 v8, 0x3

    .line 58
    const/4 v9, 0x2

    .line 59
    const/4 v10, 0x1

    .line 60
    if-eqz v6, :cond_5

    .line 61
    .line 62
    if-eq v6, v10, :cond_2

    .line 63
    .line 64
    if-eq v6, v9, :cond_4

    .line 65
    .line 66
    if-ne v6, v8, :cond_3

    .line 67
    .line 68
    :cond_2
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    goto :goto_3

    .line 72
    :cond_3
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 73
    .line 74
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    move-object v1, v7

    .line 78
    goto :goto_3

    .line 79
    :cond_4
    iget-object p1, v0, Lc60;->n:Ljava/lang/Object;

    .line 80
    .line 81
    iget-object p0, v0, Lc60;->m:Ld60;

    .line 82
    .line 83
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_5
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    check-cast v5, Lez0;

    .line 91
    .line 92
    iget-boolean p2, v5, Lez0;->j:Z

    .line 93
    .line 94
    if-eqz p2, :cond_6

    .line 95
    .line 96
    check-cast v4, Ls50;

    .line 97
    .line 98
    iput v10, v0, Lc60;->q:I

    .line 99
    .line 100
    invoke-interface {v4, p1, v0}, Ls50;->h(Ljava/lang/Object;Liq;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    if-ne p0, v2, :cond_8

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_6
    check-cast v3, Lgu;

    .line 108
    .line 109
    iput-object p0, v0, Lc60;->m:Ld60;

    .line 110
    .line 111
    iput-object p1, v0, Lc60;->n:Ljava/lang/Object;

    .line 112
    .line 113
    iput v9, v0, Lc60;->q:I

    .line 114
    .line 115
    invoke-virtual {v3, p1, v0}, Lgu;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    if-ne p2, v2, :cond_7

    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_7
    :goto_1
    check-cast p2, Ljava/lang/Boolean;

    .line 123
    .line 124
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 125
    .line 126
    .line 127
    move-result p2

    .line 128
    if-nez p2, :cond_8

    .line 129
    .line 130
    iget-object p2, p0, Ld60;->k:Ljava/lang/Object;

    .line 131
    .line 132
    check-cast p2, Lez0;

    .line 133
    .line 134
    iput-boolean v10, p2, Lez0;->j:Z

    .line 135
    .line 136
    iget-object p0, p0, Ld60;->l:Ljava/lang/Object;

    .line 137
    .line 138
    check-cast p0, Ls50;

    .line 139
    .line 140
    iput-object v7, v0, Lc60;->m:Ld60;

    .line 141
    .line 142
    iput-object v7, v0, Lc60;->n:Ljava/lang/Object;

    .line 143
    .line 144
    iput v8, v0, Lc60;->q:I

    .line 145
    .line 146
    invoke-interface {p0, p1, v0}, Ls50;->h(Ljava/lang/Object;Liq;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    if-ne p0, v2, :cond_8

    .line 151
    .line 152
    :goto_2
    move-object v1, v2

    .line 153
    :cond_8
    :goto_3
    return-object v1

    .line 154
    nop

    .line 155
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
