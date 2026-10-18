.class public final Lvi0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ldh0;


# instance fields
.field public final a:Ldh0;

.field public final b:Lui0;


# direct methods
.method public constructor <init>(Ldh0;)V
    .locals 2

    .line 1
    sget-object v0, Lba1;->a:Lba1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lvi0;->a:Ldh0;

    .line 7
    .line 8
    new-instance v0, Lui0;

    .line 9
    .line 10
    sget-object v1, Lba1;->b:Lzu0;

    .line 11
    .line 12
    invoke-interface {p1}, Ldh0;->d()Li41;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-direct {v0, v1, p1}, Lui0;-><init>(Li41;Li41;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lvi0;->b:Lui0;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public b(Ll80;)Ljava/lang/Object;
    .locals 9

    .line 1
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/AbstractMap;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    mul-int/lit8 v1, v1, 0x2

    .line 11
    .line 12
    invoke-interface {p0}, Ldh0;->d()Li41;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {p1, v2}, Ll80;->a(Li41;)Ll80;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :goto_0
    invoke-interface {p0}, Ldh0;->d()Li41;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {p1, v2}, Ll80;->b(Li41;)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    const/4 v3, -0x1

    .line 29
    if-eq v2, v3, :cond_2

    .line 30
    .line 31
    add-int/2addr v2, v1

    .line 32
    move-object v3, v0

    .line 33
    check-cast v3, Ljava/util/Map;

    .line 34
    .line 35
    sget-object v4, Lba1;->a:Lba1;

    .line 36
    .line 37
    iget-object v5, p0, Lvi0;->b:Lui0;

    .line 38
    .line 39
    const/4 v6, 0x0

    .line 40
    invoke-virtual {p1, v5, v2, v4, v6}, Ll80;->i(Li41;ILdh0;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {p1, v5}, Ll80;->b(Li41;)I

    .line 45
    .line 46
    .line 47
    move-result v7

    .line 48
    add-int/lit8 v8, v2, 0x1

    .line 49
    .line 50
    if-ne v7, v8, :cond_1

    .line 51
    .line 52
    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    iget-object v8, p0, Lvi0;->a:Ldh0;

    .line 57
    .line 58
    if-eqz v2, :cond_0

    .line 59
    .line 60
    invoke-interface {v8}, Ldh0;->d()Li41;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-interface {v2}, Li41;->c()Las;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    instance-of v2, v2, Lyu0;

    .line 69
    .line 70
    if-nez v2, :cond_0

    .line 71
    .line 72
    invoke-static {v3, v4}, Lsl0;->H(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {p1, v5, v7, v8, v2}, Ll80;->i(Li41;ILdh0;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    goto :goto_1

    .line 81
    :cond_0
    invoke-virtual {p1, v5, v7, v8, v6}, Ll80;->i(Li41;ILdh0;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    :goto_1
    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    const-string v3, "Value must follow key in a map, index for key: "

    .line 90
    .line 91
    const-string v4, ", returned index for value: "

    .line 92
    .line 93
    invoke-static {v2, v7, v3, v4}, Loq;->e(IILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-static {v2}, Lz0;->b(Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_2
    invoke-interface {p0}, Ldh0;->d()Li41;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p1, p0}, Ll80;->m(Li41;)V

    .line 106
    .line 107
    .line 108
    return-object v0
.end method

.method public final c(Lqt;Ljava/lang/Object;)V
    .locals 6

    .line 1
    move-object v0, p2

    .line 2
    check-cast v0, Ljava/util/Map;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lvi0;->b:Lui0;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lqt;->a(Li41;)Lqt;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p2, Ljava/util/Map;

    .line 17
    .line 18
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    const/4 v1, 0x0

    .line 30
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Ljava/util/Map$Entry;

    .line 41
    .line 42
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    add-int/lit8 v4, v1, 0x1

    .line 51
    .line 52
    sget-object v5, Lba1;->a:Lba1;

    .line 53
    .line 54
    invoke-virtual {p1, v0, v1, v5, v3}, Lqt;->h(Li41;ILdh0;Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    add-int/lit8 v1, v1, 0x2

    .line 58
    .line 59
    iget-object v3, p0, Lvi0;->a:Ldh0;

    .line 60
    .line 61
    invoke-virtual {p1, v0, v4, v3, v2}, Lqt;->h(Li41;ILdh0;Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    invoke-virtual {p1, v0}, Lqt;->k(Li41;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final d()Li41;
    .locals 0

    .line 1
    iget-object p0, p0, Lvi0;->b:Lui0;

    .line 2
    .line 3
    return-object p0
.end method
