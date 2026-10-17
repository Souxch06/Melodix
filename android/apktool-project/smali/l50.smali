.class public final Ll50;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Ll50;

.field public static final b:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll50;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll50;->a:Ll50;

    .line 7
    .line 8
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Ll50;->b:Ljava/util/Map;

    .line 18
    .line 19
    return-void
.end method

.method public static a(Lh51;)Lj50;
    .locals 2

    .line 1
    sget-object v0, Ll50;->b:Ljava/util/Map;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    check-cast v0, Lj50;

    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    const-string v0, "Cannot get dependency "

    .line 16
    .line 17
    const-string v1, ". Dependencies should be added at class load time."

    .line 18
    .line 19
    invoke-static {v0, p0, v1}, Lo40;->l(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method


# virtual methods
.method public final b(Lkq;)Ljava/lang/Object;
    .locals 8

    .line 1
    instance-of v0, p1, Lk50;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lk50;

    .line 7
    .line 8
    iget v1, v0, Lk50;->u:I

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
    iput v1, v0, Lk50;->u:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lk50;

    .line 21
    .line 22
    invoke-direct {v0, p0, p1}, Lk50;-><init>(Ll50;Lkq;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p0, v0, Lk50;->s:Ljava/lang/Object;

    .line 26
    .line 27
    iget p1, v0, Lk50;->u:I

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    const/4 v2, 0x0

    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    if-ne p1, v1, :cond_1

    .line 34
    .line 35
    iget-object p1, v0, Lk50;->r:Ljava/lang/Object;

    .line 36
    .line 37
    iget-object v3, v0, Lk50;->q:Ljava/util/Map;

    .line 38
    .line 39
    iget-object v4, v0, Lk50;->p:Lzo0;

    .line 40
    .line 41
    iget-object v5, v0, Lk50;->o:Lh51;

    .line 42
    .line 43
    iget-object v6, v0, Lk50;->n:Ljava/util/Iterator;

    .line 44
    .line 45
    iget-object v7, v0, Lk50;->m:Ljava/util/Map;

    .line 46
    .line 47
    invoke-static {p0}, Lk42;->n(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 52
    .line 53
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-object v2

    .line 57
    :cond_2
    invoke-static {p0}, Lk42;->n(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    sget-object p0, Ll50;->b:Ljava/util/Map;

    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    .line 64
    .line 65
    new-instance p1, Ljava/util/LinkedHashMap;

    .line 66
    .line 67
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    invoke-static {v3}, Lsl0;->I(I)I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    invoke-direct {p1, v3}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 76
    .line 77
    .line 78
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    move-object v6, p0

    .line 87
    move-object v3, p1

    .line 88
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    if-eqz p0, :cond_5

    .line 93
    .line 94
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    check-cast p0, Ljava/util/Map$Entry;

    .line 99
    .line 100
    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    move-object v5, v4

    .line 109
    check-cast v5, Lh51;

    .line 110
    .line 111
    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    check-cast p0, Lj50;

    .line 116
    .line 117
    iget-object v4, p0, Lj50;->a:Lzo0;

    .line 118
    .line 119
    iput-object v3, v0, Lk50;->m:Ljava/util/Map;

    .line 120
    .line 121
    iput-object v6, v0, Lk50;->n:Ljava/util/Iterator;

    .line 122
    .line 123
    iput-object v5, v0, Lk50;->o:Lh51;

    .line 124
    .line 125
    iput-object v4, v0, Lk50;->p:Lzo0;

    .line 126
    .line 127
    iput-object v3, v0, Lk50;->q:Ljava/util/Map;

    .line 128
    .line 129
    iput-object p1, v0, Lk50;->r:Ljava/lang/Object;

    .line 130
    .line 131
    iput v1, v0, Lk50;->u:I

    .line 132
    .line 133
    invoke-virtual {v4, v0}, Lzo0;->d(Lkq;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    sget-object v7, Lar;->j:Lar;

    .line 138
    .line 139
    if-ne p0, v7, :cond_3

    .line 140
    .line 141
    return-object v7

    .line 142
    :cond_3
    move-object v7, v3

    .line 143
    :goto_2
    :try_start_0
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 144
    .line 145
    .line 146
    invoke-static {v5}, Ll50;->a(Lh51;)Lj50;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    iget-object p0, p0, Lj50;->b:Llr;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 151
    .line 152
    if-eqz p0, :cond_4

    .line 153
    .line 154
    invoke-virtual {v4, v2}, Lzo0;->f(Ljava/lang/Object;)V

    .line 155
    .line 156
    .line 157
    invoke-interface {v3, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-object v3, v7

    .line 161
    goto :goto_1

    .line 162
    :cond_4
    :try_start_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 163
    .line 164
    new-instance p1, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    const-string v0, "Subscriber "

    .line 167
    .line 168
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string v0, " has not been registered."

    .line 175
    .line 176
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 187
    :catchall_0
    move-exception p0

    .line 188
    invoke-virtual {v4, v2}, Lzo0;->f(Ljava/lang/Object;)V

    .line 189
    .line 190
    .line 191
    throw p0

    .line 192
    :cond_5
    return-object v3
.end method
