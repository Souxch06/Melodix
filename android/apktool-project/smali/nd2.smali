.class public final Lnd2;
.super Led2;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final p:Lnd2;


# instance fields
.field public final o:Lqd2;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lnd2;

    .line 2
    .line 3
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    invoke-static {v2}, Led2;->a(Ljava/util/UUID;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    sget-object v4, Lpd2;->e:Lqd2;

    .line 12
    .line 13
    invoke-static {}, Lhd2;->c()Ltd2;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    const-string v1, "<skip trace>"

    .line 18
    .line 19
    invoke-direct/range {v0 .. v5}, Lnd2;-><init>(Ljava/lang/String;Ljava/util/UUID;Ljava/lang/String;Lqd2;Ltd2;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lnd2;->p:Lnd2;

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/UUID;Ljava/lang/String;Lqd2;Ltd2;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p5}, Led2;-><init>(Ljava/lang/String;Ljava/util/UUID;Ljava/lang/String;Ltd2;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p4, Lqd2;->c:Z

    .line 5
    .line 6
    invoke-static {p1}, Las;->b(Z)V

    .line 7
    .line 8
    .line 9
    iput-object p4, p0, Lnd2;->o:Lqd2;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final g()Lqd2;
    .locals 8

    .line 1
    invoke-virtual {p0}, Led2;->h()Lqd2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lnd2;->o:Lqd2;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    sget-object v1, Lpd2;->e:Lqd2;

    .line 11
    .line 12
    if-ne p0, v1, :cond_0

    .line 13
    .line 14
    goto/16 :goto_4

    .line 15
    .line 16
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    if-ne v0, v1, :cond_1

    .line 20
    .line 21
    move-object v0, p0

    .line 22
    goto/16 :goto_4

    .line 23
    .line 24
    :cond_1
    const/4 v2, 0x2

    .line 25
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {v2, p0}, Lbe0;->o(I[Ljava/lang/Object;)Lbe0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    move-object v0, v1

    .line 40
    goto/16 :goto_4

    .line 41
    .line 42
    :cond_2
    invoke-interface {p0}, Ljava/util/Set;->size()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    const/4 v1, 0x1

    .line 47
    if-ne v0, v1, :cond_3

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    move-object v0, p0

    .line 58
    check-cast v0, Lqd2;

    .line 59
    .line 60
    goto/16 :goto_4

    .line 61
    .line 62
    :cond_3
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const/4 v2, 0x0

    .line 67
    move v3, v2

    .line 68
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    if-eqz v4, :cond_5

    .line 73
    .line 74
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    check-cast v4, Lqd2;

    .line 79
    .line 80
    :cond_4
    iget-object v5, v4, Lqd2;->b:Lu71;

    .line 81
    .line 82
    iget v5, v5, Lu71;->l:I

    .line 83
    .line 84
    add-int/2addr v3, v5

    .line 85
    iget-object v4, v4, Lqd2;->a:Lqd2;

    .line 86
    .line 87
    if-nez v4, :cond_4

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_5
    if-nez v3, :cond_6

    .line 91
    .line 92
    sget-object v0, Lpd2;->e:Lqd2;

    .line 93
    .line 94
    goto :goto_4

    .line 95
    :cond_6
    new-instance v0, Lu71;

    .line 96
    .line 97
    invoke-direct {v0, v3}, Lu71;-><init>(I)V

    .line 98
    .line 99
    .line 100
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    if-eqz v3, :cond_a

    .line 109
    .line 110
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    check-cast v3, Lqd2;

    .line 115
    .line 116
    :cond_7
    move v4, v2

    .line 117
    :goto_2
    iget-object v5, v3, Lqd2;->b:Lu71;

    .line 118
    .line 119
    iget v6, v5, Lu71;->l:I

    .line 120
    .line 121
    if-ge v4, v6, :cond_9

    .line 122
    .line 123
    invoke-virtual {v5, v4}, Lu71;->g(I)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v6

    .line 127
    check-cast v6, Lod2;

    .line 128
    .line 129
    invoke-virtual {v5, v4}, Lu71;->i(I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v7

    .line 133
    invoke-virtual {v0, v6, v7}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v6

    .line 137
    if-nez v6, :cond_8

    .line 138
    .line 139
    move v6, v1

    .line 140
    goto :goto_3

    .line 141
    :cond_8
    move v6, v2

    .line 142
    :goto_3
    invoke-virtual {v5, v4}, Lu71;->g(I)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    const-string v7, "Duplicate bindings: %s"

    .line 147
    .line 148
    invoke-static {v6, v7, v5}, Las;->c(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    add-int/lit8 v4, v4, 0x1

    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_9
    iget-object v3, v3, Lqd2;->a:Lqd2;

    .line 155
    .line 156
    if-nez v3, :cond_7

    .line 157
    .line 158
    goto :goto_1

    .line 159
    :cond_a
    new-instance p0, Lpd2;

    .line 160
    .line 161
    const/4 v1, 0x0

    .line 162
    invoke-direct {p0, v1, v0}, Lqd2;-><init>(Lqd2;Lu71;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0}, Lqd2;->a()Lqd2;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    :goto_4
    return-object v0
.end method

.method public final h()Lqd2;
    .locals 0

    .line 1
    sget-object p0, Lpd2;->e:Lqd2;

    .line 2
    .line 3
    return-object p0
.end method
