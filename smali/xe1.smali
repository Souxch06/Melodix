.class public final Lxe1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final f:Lxe1;


# instance fields
.field public a:I

.field public b:[I

.field public c:[Ljava/lang/Object;

.field public d:I

.field public e:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lxe1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    new-array v2, v1, [I

    .line 5
    .line 6
    new-array v3, v1, [Ljava/lang/Object;

    .line 7
    .line 8
    invoke-direct {v0, v1, v2, v3, v1}, Lxe1;-><init>(I[I[Ljava/lang/Object;Z)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lxe1;->f:Lxe1;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(I[I[Ljava/lang/Object;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lxe1;->d:I

    .line 6
    .line 7
    iput p1, p0, Lxe1;->a:I

    .line 8
    .line 9
    iput-object p2, p0, Lxe1;->b:[I

    .line 10
    .line 11
    iput-object p3, p0, Lxe1;->c:[Ljava/lang/Object;

    .line 12
    .line 13
    iput-boolean p4, p0, Lxe1;->e:Z

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 6

    .line 1
    iget v0, p0, Lxe1;->d:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    move v1, v0

    .line 9
    :goto_0
    iget v2, p0, Lxe1;->a:I

    .line 10
    .line 11
    if-ge v0, v2, :cond_6

    .line 12
    .line 13
    iget-object v2, p0, Lxe1;->b:[I

    .line 14
    .line 15
    aget v2, v2, v0

    .line 16
    .line 17
    ushr-int/lit8 v3, v2, 0x3

    .line 18
    .line 19
    and-int/lit8 v2, v2, 0x7

    .line 20
    .line 21
    if-eqz v2, :cond_5

    .line 22
    .line 23
    const/4 v4, 0x1

    .line 24
    if-eq v2, v4, :cond_4

    .line 25
    .line 26
    const/4 v4, 0x2

    .line 27
    if-eq v2, v4, :cond_3

    .line 28
    .line 29
    const/4 v5, 0x3

    .line 30
    if-eq v2, v5, :cond_2

    .line 31
    .line 32
    const/4 v4, 0x5

    .line 33
    if-ne v2, v4, :cond_1

    .line 34
    .line 35
    iget-object v2, p0, Lxe1;->c:[Ljava/lang/Object;

    .line 36
    .line 37
    aget-object v2, v2, v0

    .line 38
    .line 39
    check-cast v2, Ljava/lang/Integer;

    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    invoke-static {v3}, Lxk;->c(I)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    add-int/lit8 v2, v2, 0x4

    .line 49
    .line 50
    :goto_1
    add-int/2addr v2, v1

    .line 51
    move v1, v2

    .line 52
    goto :goto_3

    .line 53
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 54
    .line 55
    new-instance v0, Lpf0;

    .line 56
    .line 57
    const-string v1, "Protocol message tag had invalid wire type."

    .line 58
    .line 59
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    .line 63
    .line 64
    .line 65
    throw p0

    .line 66
    :cond_2
    invoke-static {v3}, Lxk;->c(I)I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    mul-int/2addr v2, v4

    .line 71
    iget-object v3, p0, Lxe1;->c:[Ljava/lang/Object;

    .line 72
    .line 73
    aget-object v3, v3, v0

    .line 74
    .line 75
    check-cast v3, Lxe1;

    .line 76
    .line 77
    invoke-virtual {v3}, Lxe1;->a()I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    :goto_2
    add-int/2addr v3, v2

    .line 82
    add-int/2addr v3, v1

    .line 83
    move v1, v3

    .line 84
    goto :goto_3

    .line 85
    :cond_3
    iget-object v2, p0, Lxe1;->c:[Ljava/lang/Object;

    .line 86
    .line 87
    aget-object v2, v2, v0

    .line 88
    .line 89
    check-cast v2, Lrh;

    .line 90
    .line 91
    invoke-static {v3}, Lxk;->c(I)I

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    invoke-virtual {v2}, Lrh;->size()I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    invoke-static {v2, v2, v3, v1}, Loq;->c(IIII)I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    goto :goto_3

    .line 104
    :cond_4
    iget-object v2, p0, Lxe1;->c:[Ljava/lang/Object;

    .line 105
    .line 106
    aget-object v2, v2, v0

    .line 107
    .line 108
    check-cast v2, Ljava/lang/Long;

    .line 109
    .line 110
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 111
    .line 112
    .line 113
    invoke-static {v3}, Lxk;->c(I)I

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    add-int/lit8 v2, v2, 0x8

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_5
    iget-object v2, p0, Lxe1;->c:[Ljava/lang/Object;

    .line 121
    .line 122
    aget-object v2, v2, v0

    .line 123
    .line 124
    check-cast v2, Ljava/lang/Long;

    .line 125
    .line 126
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 127
    .line 128
    .line 129
    move-result-wide v4

    .line 130
    invoke-static {v3}, Lxk;->c(I)I

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    invoke-static {v4, v5}, Lxk;->e(J)I

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    goto :goto_2

    .line 139
    :goto_3
    add-int/lit8 v0, v0, 0x1

    .line 140
    .line 141
    goto/16 :goto_0

    .line 142
    .line 143
    :cond_6
    iput v1, p0, Lxe1;->d:I

    .line 144
    .line 145
    return v1
.end method

.method public final b(Lpa0;)V
    .locals 7

    .line 1
    iget v0, p0, Lxe1;->a:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_2

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-object v0, p1, Lpa0;->k:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Lxk;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    move v2, v1

    .line 16
    :goto_0
    iget v3, p0, Lxe1;->a:I

    .line 17
    .line 18
    if-ge v2, v3, :cond_6

    .line 19
    .line 20
    iget-object v3, p0, Lxe1;->b:[I

    .line 21
    .line 22
    aget v3, v3, v2

    .line 23
    .line 24
    iget-object v4, p0, Lxe1;->c:[Ljava/lang/Object;

    .line 25
    .line 26
    aget-object v4, v4, v2

    .line 27
    .line 28
    ushr-int/lit8 v5, v3, 0x3

    .line 29
    .line 30
    and-int/lit8 v3, v3, 0x7

    .line 31
    .line 32
    if-eqz v3, :cond_5

    .line 33
    .line 34
    const/4 v6, 0x1

    .line 35
    if-eq v3, v6, :cond_4

    .line 36
    .line 37
    const/4 v6, 0x2

    .line 38
    if-eq v3, v6, :cond_3

    .line 39
    .line 40
    const/4 v6, 0x3

    .line 41
    if-eq v3, v6, :cond_2

    .line 42
    .line 43
    const/4 v6, 0x5

    .line 44
    if-ne v3, v6, :cond_1

    .line 45
    .line 46
    check-cast v4, Ljava/lang/Integer;

    .line 47
    .line 48
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    invoke-virtual {v0, v5, v6}, Lxk;->m(II)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v3}, Lxk;->i(I)V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    new-instance p0, Ljava/lang/RuntimeException;

    .line 60
    .line 61
    new-instance p1, Lpf0;

    .line 62
    .line 63
    const-string v0, "Protocol message tag had invalid wire type."

    .line 64
    .line 65
    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 69
    .line 70
    .line 71
    throw p0

    .line 72
    :cond_2
    invoke-virtual {v0, v5, v6}, Lxk;->m(II)V

    .line 73
    .line 74
    .line 75
    check-cast v4, Lxe1;

    .line 76
    .line 77
    invoke-virtual {v4, p1}, Lxe1;->b(Lpa0;)V

    .line 78
    .line 79
    .line 80
    const/4 v3, 0x4

    .line 81
    invoke-virtual {v0, v5, v3}, Lxk;->m(II)V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_3
    check-cast v4, Lrh;

    .line 86
    .line 87
    invoke-virtual {v0, v5, v6}, Lxk;->m(II)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v4}, Lxk;->h(Lrh;)V

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_4
    check-cast v4, Ljava/lang/Long;

    .line 95
    .line 96
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 97
    .line 98
    .line 99
    move-result-wide v3

    .line 100
    invoke-virtual {v0, v5, v6}, Lxk;->m(II)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, v3, v4}, Lxk;->j(J)V

    .line 104
    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_5
    check-cast v4, Ljava/lang/Long;

    .line 108
    .line 109
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 110
    .line 111
    .line 112
    move-result-wide v3

    .line 113
    invoke-virtual {v0, v5, v1}, Lxk;->m(II)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v3, v4}, Lxk;->o(J)V

    .line 117
    .line 118
    .line 119
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_6
    :goto_2
    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    goto :goto_2

    .line 4
    :cond_0
    const/4 v0, 0x0

    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    goto :goto_3

    .line 8
    :cond_1
    instance-of v1, p1, Lxe1;

    .line 9
    .line 10
    if-nez v1, :cond_2

    .line 11
    .line 12
    goto :goto_3

    .line 13
    :cond_2
    check-cast p1, Lxe1;

    .line 14
    .line 15
    iget v1, p0, Lxe1;->a:I

    .line 16
    .line 17
    iget v2, p1, Lxe1;->a:I

    .line 18
    .line 19
    if-ne v1, v2, :cond_7

    .line 20
    .line 21
    iget-object v2, p0, Lxe1;->b:[I

    .line 22
    .line 23
    iget-object v3, p1, Lxe1;->b:[I

    .line 24
    .line 25
    move v4, v0

    .line 26
    :goto_0
    if-ge v4, v1, :cond_4

    .line 27
    .line 28
    aget v5, v2, v4

    .line 29
    .line 30
    aget v6, v3, v4

    .line 31
    .line 32
    if-eq v5, v6, :cond_3

    .line 33
    .line 34
    goto :goto_3

    .line 35
    :cond_3
    add-int/lit8 v4, v4, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_4
    iget-object v1, p0, Lxe1;->c:[Ljava/lang/Object;

    .line 39
    .line 40
    iget-object p1, p1, Lxe1;->c:[Ljava/lang/Object;

    .line 41
    .line 42
    iget p0, p0, Lxe1;->a:I

    .line 43
    .line 44
    move v2, v0

    .line 45
    :goto_1
    if-ge v2, p0, :cond_6

    .line 46
    .line 47
    aget-object v3, v1, v2

    .line 48
    .line 49
    aget-object v4, p1, v2

    .line 50
    .line 51
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-nez v3, :cond_5

    .line 56
    .line 57
    goto :goto_3

    .line 58
    :cond_5
    add-int/lit8 v2, v2, 0x1

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_6
    :goto_2
    const/4 p0, 0x1

    .line 62
    return p0

    .line 63
    :cond_7
    :goto_3
    return v0
.end method

.method public final hashCode()I
    .locals 8

    .line 1
    iget v0, p0, Lxe1;->a:I

    .line 2
    .line 3
    const/16 v1, 0x20f

    .line 4
    .line 5
    add-int/2addr v1, v0

    .line 6
    mul-int/lit8 v1, v1, 0x1f

    .line 7
    .line 8
    iget-object v2, p0, Lxe1;->b:[I

    .line 9
    .line 10
    const/16 v3, 0x11

    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    move v6, v3

    .line 14
    move v5, v4

    .line 15
    :goto_0
    if-ge v5, v0, :cond_0

    .line 16
    .line 17
    mul-int/lit8 v6, v6, 0x1f

    .line 18
    .line 19
    aget v7, v2, v5

    .line 20
    .line 21
    add-int/2addr v6, v7

    .line 22
    add-int/lit8 v5, v5, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    add-int/2addr v1, v6

    .line 26
    mul-int/lit8 v1, v1, 0x1f

    .line 27
    .line 28
    iget-object v0, p0, Lxe1;->c:[Ljava/lang/Object;

    .line 29
    .line 30
    iget p0, p0, Lxe1;->a:I

    .line 31
    .line 32
    :goto_1
    if-ge v4, p0, :cond_1

    .line 33
    .line 34
    mul-int/lit8 v3, v3, 0x1f

    .line 35
    .line 36
    aget-object v2, v0, v4

    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    add-int/2addr v3, v2

    .line 43
    add-int/lit8 v4, v4, 0x1

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    add-int/2addr v1, v3

    .line 47
    return v1
.end method
