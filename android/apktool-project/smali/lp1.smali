.class public abstract Llp1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public final j:Lnp1;

.field public k:Lnp1;


# direct methods
.method public constructor <init>(Lnp1;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Llp1;->j:Lnp1;

    .line 5
    .line 6
    invoke-virtual {p1}, Lnp1;->e()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Lnp1;->g()Lnp1;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Llp1;->k:Lnp1;

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string p0, "Default instance must be immutable."

    .line 20
    .line 21
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    throw p0
.end method

.method public static a(ILjava/util/List;)V
    .locals 3

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sub-int/2addr v0, p0

    .line 6
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    new-instance v2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    add-int/lit8 v1, v1, 0x1a

    .line 17
    .line 18
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 19
    .line 20
    .line 21
    const-string v1, "Element at index "

    .line 22
    .line 23
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v0, " is null."

    .line 30
    .line 31
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    :goto_0
    add-int/lit8 v1, v1, -0x1

    .line 43
    .line 44
    if-lt v1, p0, :cond_0

    .line 45
    .line 46
    invoke-interface {p1, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    .line 51
    .line 52
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    throw p0
.end method

.method public static b(Ljava/lang/Iterable;Ljava/util/List;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    instance-of v0, p0, Lrq1;

    .line 5
    .line 6
    if-nez v0, :cond_9

    .line 7
    .line 8
    instance-of v0, p0, Ljava/util/Collection;

    .line 9
    .line 10
    if-eqz v0, :cond_4

    .line 11
    .line 12
    move-object v0, p0

    .line 13
    check-cast v0, Ljava/util/Collection;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    instance-of v1, p1, Ljava/util/ArrayList;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    move-object v1, p1

    .line 24
    check-cast v1, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    add-int/2addr v2, v0

    .line 31
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->ensureCapacity(I)V

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    instance-of v1, p1, Ltq1;

    .line 36
    .line 37
    if-eqz v1, :cond_4

    .line 38
    .line 39
    move-object v1, p1

    .line 40
    check-cast v1, Ltq1;

    .line 41
    .line 42
    iget v2, v1, Ltq1;->l:I

    .line 43
    .line 44
    add-int/2addr v2, v0

    .line 45
    iget-object v0, v1, Ltq1;->k:[Ljava/lang/Object;

    .line 46
    .line 47
    array-length v0, v0

    .line 48
    if-gt v2, v0, :cond_1

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    const/16 v3, 0xa

    .line 52
    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    :goto_0
    if-ge v0, v2, :cond_2

    .line 56
    .line 57
    mul-int/lit8 v0, v0, 0x3

    .line 58
    .line 59
    div-int/lit8 v0, v0, 0x2

    .line 60
    .line 61
    add-int/lit8 v0, v0, 0x1

    .line 62
    .line 63
    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    goto :goto_0

    .line 68
    :cond_2
    iget-object v2, v1, Ltq1;->k:[Ljava/lang/Object;

    .line 69
    .line 70
    invoke-static {v2, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, v1, Ltq1;->k:[Ljava/lang/Object;

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_3
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    new-array v0, v0, [Ljava/lang/Object;

    .line 82
    .line 83
    iput-object v0, v1, Ltq1;->k:[Ljava/lang/Object;

    .line 84
    .line 85
    :cond_4
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    instance-of v1, p0, Ljava/util/List;

    .line 90
    .line 91
    const/4 v2, 0x0

    .line 92
    if-eqz v1, :cond_6

    .line 93
    .line 94
    instance-of v1, p0, Ljava/util/RandomAccess;

    .line 95
    .line 96
    if-eqz v1, :cond_6

    .line 97
    .line 98
    check-cast p0, Ljava/util/List;

    .line 99
    .line 100
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    const/4 v3, 0x0

    .line 105
    :goto_2
    if-ge v3, v1, :cond_8

    .line 106
    .line 107
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    if-eqz v4, :cond_5

    .line 112
    .line 113
    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    add-int/lit8 v3, v3, 0x1

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_5
    invoke-static {v0, p1}, Llp1;->a(ILjava/util/List;)V

    .line 120
    .line 121
    .line 122
    throw v2

    .line 123
    :cond_6
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    if-eqz v1, :cond_8

    .line 132
    .line 133
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    if-eqz v1, :cond_7

    .line 138
    .line 139
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    goto :goto_3

    .line 143
    :cond_7
    invoke-static {v0, p1}, Llp1;->a(ILjava/util/List;)V

    .line 144
    .line 145
    .line 146
    throw v2

    .line 147
    :cond_8
    return-void

    .line 148
    :cond_9
    check-cast p0, Ljava/util/Collection;

    .line 149
    .line 150
    invoke-interface {p1, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 151
    .line 152
    .line 153
    return-void
.end method


# virtual methods
.method public final c()V
    .locals 4

    .line 1
    iget-object v0, p0, Llp1;->k:Lnp1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lnp1;->e()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Llp1;->j:Lnp1;

    .line 10
    .line 11
    invoke-virtual {v0}, Lnp1;->g()Lnp1;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Llp1;->k:Lnp1;

    .line 16
    .line 17
    sget-object v2, Lsq1;->c:Lsq1;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v2, v3}, Lsq1;->a(Ljava/lang/Class;)Lvq1;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-interface {v2, v0, v1}, Lvq1;->e(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Llp1;->k:Lnp1;

    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final bridge synthetic clone()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Llp1;->d()Llp1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final d()Llp1;
    .locals 4

    .line 1
    iget-object v0, p0, Llp1;->j:Lnp1;

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    invoke-virtual {v0, v1}, Lnp1;->q(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Llp1;

    .line 9
    .line 10
    iget-object v1, p0, Llp1;->k:Lnp1;

    .line 11
    .line 12
    invoke-virtual {v1}, Lnp1;->e()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object v2, p0, Llp1;->k:Lnp1;

    .line 17
    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    sget-object v1, Lsq1;->c:Lsq1;

    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v1, v3}, Lsq1;->a(Ljava/lang/Class;)Lvq1;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {v1, v2}, Lvq1;->i(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2}, Lnp1;->f()V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Llp1;->k:Lnp1;

    .line 41
    .line 42
    :goto_0
    iput-object v2, v0, Llp1;->k:Lnp1;

    .line 43
    .line 44
    return-object v0
.end method

.method public final e()Lnp1;
    .locals 3

    .line 1
    iget-object v0, p0, Llp1;->k:Lnp1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lnp1;->e()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Llp1;->k:Lnp1;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    sget-object v0, Lsq1;->c:Lsq1;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v0, v2}, Lsq1;->a(Ljava/lang/Class;)Lvq1;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0, v1}, Lvq1;->i(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Lnp1;->f()V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Llp1;->k:Lnp1;

    .line 32
    .line 33
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    invoke-static {v1, p0}, Lnp1;->o(Lnp1;Z)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    return-object v1

    .line 44
    :cond_1
    new-instance p0, Lzq1;

    .line 45
    .line 46
    invoke-direct {p0}, Lzq1;-><init>()V

    .line 47
    .line 48
    .line 49
    throw p0
.end method

.method public final f(Lnp1;)V
    .locals 4

    .line 1
    iget-object v0, p0, Llp1;->j:Lnp1;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lnp1;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    iget-object v1, p0, Llp1;->k:Lnp1;

    .line 10
    .line 11
    invoke-virtual {v1}, Lnp1;->e()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lnp1;->g()Lnp1;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Llp1;->k:Lnp1;

    .line 22
    .line 23
    sget-object v2, Lsq1;->c:Lsq1;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v2, v3}, Lsq1;->a(Ljava/lang/Class;)Lvq1;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-interface {v2, v0, v1}, Lvq1;->e(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Llp1;->k:Lnp1;

    .line 37
    .line 38
    :cond_0
    iget-object p0, p0, Llp1;->k:Lnp1;

    .line 39
    .line 40
    sget-object v0, Lsq1;->c:Lsq1;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lsq1;->a(Ljava/lang/Class;)Lvq1;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {v0, p0, p1}, Lvq1;->e(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public final g([BILgp1;)V
    .locals 8

    .line 1
    iget-object v0, p0, Llp1;->k:Lnp1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lnp1;->e()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Llp1;->j:Lnp1;

    .line 10
    .line 11
    invoke-virtual {v0}, Lnp1;->g()Lnp1;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Llp1;->k:Lnp1;

    .line 16
    .line 17
    sget-object v2, Lsq1;->c:Lsq1;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v2, v3}, Lsq1;->a(Ljava/lang/Class;)Lvq1;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-interface {v2, v0, v1}, Lvq1;->e(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Llp1;->k:Lnp1;

    .line 31
    .line 32
    :cond_0
    :try_start_0
    sget-object v0, Lsq1;->c:Lsq1;

    .line 33
    .line 34
    iget-object v1, p0, Llp1;->k:Lnp1;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lsq1;->a(Ljava/lang/Class;)Lvq1;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iget-object v3, p0, Llp1;->k:Lnp1;

    .line 45
    .line 46
    new-instance v7, Lto1;

    .line 47
    .line 48
    invoke-direct {v7, p3}, Lto1;-><init>(Lgp1;)V

    .line 49
    .line 50
    .line 51
    const/4 v5, 0x0

    .line 52
    move-object v4, p1

    .line 53
    move v6, p2

    .line 54
    invoke-interface/range {v2 .. v7}, Lvq1;->j(Ljava/lang/Object;[BIILto1;)V
    :try_end_0
    .catch Laq1; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :catch_0
    move-exception v0

    .line 59
    move-object p0, v0

    .line 60
    const-string p1, "Reading from byte array should not throw IOException."

    .line 61
    .line 62
    invoke-static {p1, p0}, Lo40;->p(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :catch_1
    const-string p0, "While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length."

    .line 67
    .line 68
    invoke-static {p0}, Lwd1;->f(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :catch_2
    move-exception v0

    .line 73
    move-object p0, v0

    .line 74
    throw p0
.end method
