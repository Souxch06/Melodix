.class public final Lwk;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lap1;)V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lwk;->c:I

    iput-object p1, p0, Lwk;->d:Ljava/lang/Object;

    iput-object p0, p1, Lap1;->c:Lwk;

    return-void
.end method

.method public constructor <init>(Lvk;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lwk;->c:I

    .line 6
    .line 7
    sget-object v0, Llf0;->a:Ljava/nio/charset/Charset;

    .line 8
    .line 9
    iput-object p1, p0, Lwk;->d:Ljava/lang/Object;

    .line 10
    .line 11
    iput-object p0, p1, Lvk;->b:Ljava/lang/Object;

    .line 12
    .line 13
    return-void
.end method

.method public static final V(I)V
    .locals 0

    .line 1
    and-int/lit8 p0, p0, 0x3

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "Failed to parse the message."

    .line 7
    .line 8
    invoke-static {p0}, Lwd1;->f(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static final W(I)V
    .locals 0

    .line 1
    and-int/lit8 p0, p0, 0x7

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "Failed to parse the message."

    .line 7
    .line 8
    invoke-static {p0}, Lwd1;->f(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public A(Lyp1;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lap1;

    .line 4
    .line 5
    instance-of v1, p1, Ldq1;

    .line 6
    .line 7
    iget v2, p0, Lwk;->a:I

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    if-eqz v1, :cond_4

    .line 11
    .line 12
    move-object v1, p1

    .line 13
    check-cast v1, Ldq1;

    .line 14
    .line 15
    and-int/lit8 p1, v2, 0x7

    .line 16
    .line 17
    if-eqz p1, :cond_2

    .line 18
    .line 19
    if-ne p1, v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Lap1;->A()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {v0}, Lap1;->e()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    add-int/2addr v2, p1

    .line 30
    :cond_0
    invoke-virtual {v0}, Lap1;->r()J

    .line 31
    .line 32
    .line 33
    move-result-wide v3

    .line 34
    invoke-virtual {v1, v3, v4}, Ldq1;->e(J)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lap1;->e()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-lt p1, v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0, v2}, Lwk;->U(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Lwd1;->a()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-virtual {v0}, Lap1;->r()J

    .line 52
    .line 53
    .line 54
    move-result-wide v2

    .line 55
    invoke-virtual {v1, v2, v3}, Ldq1;->e(J)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Lap1;->d()Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_3
    invoke-virtual {v0}, Lap1;->l()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iget v2, p0, Lwk;->a:I

    .line 70
    .line 71
    if-eq p1, v2, :cond_2

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    and-int/lit8 v1, v2, 0x7

    .line 75
    .line 76
    if-eqz v1, :cond_7

    .line 77
    .line 78
    if-ne v1, v3, :cond_6

    .line 79
    .line 80
    invoke-virtual {v0}, Lap1;->A()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {v0}, Lap1;->e()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    add-int/2addr v2, v1

    .line 89
    :cond_5
    invoke-virtual {v0}, Lap1;->r()J

    .line 90
    .line 91
    .line 92
    move-result-wide v3

    .line 93
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Lap1;->e()I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-lt v1, v2, :cond_5

    .line 105
    .line 106
    invoke-virtual {p0, v2}, Lwk;->U(I)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_6
    invoke-static {}, Lwd1;->a()V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_7
    invoke-virtual {v0}, Lap1;->r()J

    .line 115
    .line 116
    .line 117
    move-result-wide v1

    .line 118
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0}, Lap1;->d()Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-nez v1, :cond_8

    .line 130
    .line 131
    invoke-virtual {v0}, Lap1;->l()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    iget v2, p0, Lwk;->a:I

    .line 136
    .line 137
    if-eq v1, v2, :cond_7

    .line 138
    .line 139
    move p1, v1

    .line 140
    :goto_0
    iput p1, p0, Lwk;->c:I

    .line 141
    .line 142
    :cond_8
    :goto_1
    return-void
.end method

.method public B(Lyp1;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lap1;

    .line 4
    .line 5
    instance-of v1, p1, Lop1;

    .line 6
    .line 7
    iget v2, p0, Lwk;->a:I

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    if-eqz v1, :cond_4

    .line 11
    .line 12
    move-object v1, p1

    .line 13
    check-cast v1, Lop1;

    .line 14
    .line 15
    and-int/lit8 p1, v2, 0x7

    .line 16
    .line 17
    if-eqz p1, :cond_2

    .line 18
    .line 19
    if-ne p1, v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Lap1;->A()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {v0}, Lap1;->e()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    add-int/2addr v2, p1

    .line 30
    :cond_0
    invoke-virtual {v0}, Lap1;->s()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-virtual {v1, p1}, Lop1;->e(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lap1;->e()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-lt p1, v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0, v2}, Lwk;->U(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Lwd1;->a()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-virtual {v0}, Lap1;->s()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-virtual {v1, p1}, Lop1;->e(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Lap1;->d()Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_3
    invoke-virtual {v0}, Lap1;->l()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iget v2, p0, Lwk;->a:I

    .line 70
    .line 71
    if-eq p1, v2, :cond_2

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    and-int/lit8 v1, v2, 0x7

    .line 75
    .line 76
    if-eqz v1, :cond_7

    .line 77
    .line 78
    if-ne v1, v3, :cond_6

    .line 79
    .line 80
    invoke-virtual {v0}, Lap1;->A()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {v0}, Lap1;->e()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    add-int/2addr v2, v1

    .line 89
    :cond_5
    invoke-virtual {v0}, Lap1;->s()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Lap1;->e()I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-lt v1, v2, :cond_5

    .line 105
    .line 106
    invoke-virtual {p0, v2}, Lwk;->U(I)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_6
    invoke-static {}, Lwd1;->a()V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_7
    invoke-virtual {v0}, Lap1;->s()I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0}, Lap1;->d()Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-nez v1, :cond_8

    .line 130
    .line 131
    invoke-virtual {v0}, Lap1;->l()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    iget v2, p0, Lwk;->a:I

    .line 136
    .line 137
    if-eq v1, v2, :cond_7

    .line 138
    .line 139
    move p1, v1

    .line 140
    :goto_0
    iput p1, p0, Lwk;->c:I

    .line 141
    .line 142
    :cond_8
    :goto_1
    return-void
.end method

.method public C(Lyp1;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lap1;

    .line 4
    .line 5
    instance-of v1, p1, Ldq1;

    .line 6
    .line 7
    iget v2, p0, Lwk;->a:I

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    const/4 v4, 0x1

    .line 11
    if-eqz v1, :cond_4

    .line 12
    .line 13
    move-object v1, p1

    .line 14
    check-cast v1, Ldq1;

    .line 15
    .line 16
    and-int/lit8 p1, v2, 0x7

    .line 17
    .line 18
    if-eq p1, v4, :cond_2

    .line 19
    .line 20
    if-ne p1, v3, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Lap1;->A()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-static {p0}, Lwk;->W(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lap1;->e()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    add-int/2addr p1, p0

    .line 34
    :cond_0
    invoke-virtual {v0}, Lap1;->t()J

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    invoke-virtual {v1, v2, v3}, Ldq1;->e(J)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Lap1;->e()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-lt p0, p1, :cond_0

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    invoke-static {}, Lwd1;->a()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-virtual {v0}, Lap1;->t()J

    .line 53
    .line 54
    .line 55
    move-result-wide v2

    .line 56
    invoke-virtual {v1, v2, v3}, Ldq1;->e(J)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Lap1;->d()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_3

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_3
    invoke-virtual {v0}, Lap1;->l()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    iget v2, p0, Lwk;->a:I

    .line 71
    .line 72
    if-eq p1, v2, :cond_2

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    and-int/lit8 v1, v2, 0x7

    .line 76
    .line 77
    if-eq v1, v4, :cond_7

    .line 78
    .line 79
    if-ne v1, v3, :cond_6

    .line 80
    .line 81
    invoke-virtual {v0}, Lap1;->A()I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    invoke-static {p0}, Lwk;->W(I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Lap1;->e()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    add-int/2addr v1, p0

    .line 93
    :cond_5
    invoke-virtual {v0}, Lap1;->t()J

    .line 94
    .line 95
    .line 96
    move-result-wide v2

    .line 97
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0}, Lap1;->e()I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-lt p0, v1, :cond_5

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_6
    invoke-static {}, Lwd1;->a()V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_7
    invoke-virtual {v0}, Lap1;->t()J

    .line 116
    .line 117
    .line 118
    move-result-wide v1

    .line 119
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0}, Lap1;->d()Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-nez v1, :cond_8

    .line 131
    .line 132
    invoke-virtual {v0}, Lap1;->l()I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    iget v2, p0, Lwk;->a:I

    .line 137
    .line 138
    if-eq v1, v2, :cond_7

    .line 139
    .line 140
    move p1, v1

    .line 141
    :goto_0
    iput p1, p0, Lwk;->c:I

    .line 142
    .line 143
    :cond_8
    :goto_1
    return-void
.end method

.method public D(Lyp1;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lap1;

    .line 4
    .line 5
    instance-of v1, p1, Lop1;

    .line 6
    .line 7
    iget v2, p0, Lwk;->a:I

    .line 8
    .line 9
    const/4 v3, 0x5

    .line 10
    const/4 v4, 0x2

    .line 11
    if-eqz v1, :cond_5

    .line 12
    .line 13
    move-object v1, p1

    .line 14
    check-cast v1, Lop1;

    .line 15
    .line 16
    and-int/lit8 p1, v2, 0x7

    .line 17
    .line 18
    if-eq p1, v4, :cond_3

    .line 19
    .line 20
    if-ne p1, v3, :cond_2

    .line 21
    .line 22
    :cond_0
    invoke-virtual {v0}, Lap1;->u()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {v1, p1}, Lop1;->e(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lap1;->d()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    invoke-virtual {v0}, Lap1;->l()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iget v2, p0, Lwk;->a:I

    .line 41
    .line 42
    if-eq p1, v2, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    invoke-static {}, Lwd1;->a()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    invoke-virtual {v0}, Lap1;->A()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    invoke-static {p0}, Lwk;->V(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Lap1;->e()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    add-int v5, p1, p0

    .line 61
    .line 62
    :cond_4
    invoke-virtual {v0}, Lap1;->u()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-virtual {v1, p0}, Lop1;->e(I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Lap1;->e()I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-lt p0, v5, :cond_4

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_5
    and-int/lit8 v1, v2, 0x7

    .line 77
    .line 78
    if-eq v1, v4, :cond_8

    .line 79
    .line 80
    if-ne v1, v3, :cond_7

    .line 81
    .line 82
    :cond_6
    invoke-virtual {v0}, Lap1;->u()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Lap1;->d()Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-nez v1, :cond_a

    .line 98
    .line 99
    invoke-virtual {v0}, Lap1;->l()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    iget v2, p0, Lwk;->a:I

    .line 104
    .line 105
    if-eq v1, v2, :cond_6

    .line 106
    .line 107
    move p1, v1

    .line 108
    :goto_0
    iput p1, p0, Lwk;->c:I

    .line 109
    .line 110
    return-void

    .line 111
    :cond_7
    invoke-static {}, Lwd1;->a()V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_8
    invoke-virtual {v0}, Lap1;->A()I

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    invoke-static {p0}, Lwk;->V(I)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0}, Lap1;->e()I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    add-int/2addr v1, p0

    .line 127
    :cond_9
    invoke-virtual {v0}, Lap1;->u()I

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0}, Lap1;->e()I

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    if-lt p0, v1, :cond_9

    .line 143
    .line 144
    :cond_a
    :goto_1
    return-void
.end method

.method public E(Lyp1;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lap1;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    if-ne v1, v2, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Lap1;->A()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0}, Lap1;->e()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    add-int/2addr v2, v1

    .line 23
    :cond_0
    invoke-virtual {v0}, Lap1;->v()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Lap1;->e()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-lt v1, v2, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0, v2}, Lwk;->U(I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    invoke-static {}, Lwd1;->a()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    invoke-virtual {v0}, Lap1;->v()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Lap1;->d()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_3

    .line 64
    .line 65
    invoke-virtual {v0}, Lap1;->l()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    iget v2, p0, Lwk;->a:I

    .line 70
    .line 71
    if-eq v1, v2, :cond_2

    .line 72
    .line 73
    iput v1, p0, Lwk;->c:I

    .line 74
    .line 75
    :cond_3
    return-void
.end method

.method public F(Lyp1;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lap1;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    if-ne v1, v2, :cond_3

    .line 11
    .line 12
    :cond_0
    if-eqz p2, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, v2}, Lwk;->Q(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Lap1;->x()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-virtual {p0, v2}, Lwk;->Q(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Lap1;->w()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    :goto_0
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Lap1;->d()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    invoke-virtual {v0}, Lap1;->l()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    iget v3, p0, Lwk;->a:I

    .line 44
    .line 45
    if-eq v1, v3, :cond_0

    .line 46
    .line 47
    iput v1, p0, Lwk;->c:I

    .line 48
    .line 49
    return-void

    .line 50
    :cond_3
    invoke-static {}, Lwd1;->a()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public G(Lyp1;Lvq1;Lgp1;)V
    .locals 3

    .line 1
    iget v0, p0, Lwk;->a:I

    .line 2
    .line 3
    and-int/lit8 v1, v0, 0x7

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-ne v1, v2, :cond_3

    .line 7
    .line 8
    :cond_0
    invoke-interface {p2}, Lvq1;->a()Lnp1;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {p0, v1, p2, p3}, Lwk;->R(Ljava/lang/Object;Lvq1;Lgp1;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p2, v1}, Lvq1;->i(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lwk;->d:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v1, Lap1;

    .line 24
    .line 25
    invoke-virtual {v1}, Lap1;->d()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_2

    .line 30
    .line 31
    iget v2, p0, Lwk;->c:I

    .line 32
    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {v1}, Lap1;->l()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eq v1, v0, :cond_0

    .line 41
    .line 42
    iput v1, p0, Lwk;->c:I

    .line 43
    .line 44
    :cond_2
    :goto_0
    return-void

    .line 45
    :cond_3
    invoke-static {}, Lwd1;->a()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public H(Lyp1;Lvq1;Lgp1;)V
    .locals 3

    .line 1
    iget v0, p0, Lwk;->a:I

    .line 2
    .line 3
    and-int/lit8 v1, v0, 0x7

    .line 4
    .line 5
    const/4 v2, 0x3

    .line 6
    if-ne v1, v2, :cond_3

    .line 7
    .line 8
    :cond_0
    invoke-interface {p2}, Lvq1;->a()Lnp1;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {p0, v1, p2, p3}, Lwk;->S(Ljava/lang/Object;Lvq1;Lgp1;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p2, v1}, Lvq1;->i(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lwk;->d:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v1, Lap1;

    .line 24
    .line 25
    invoke-virtual {v1}, Lap1;->d()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_2

    .line 30
    .line 31
    iget v2, p0, Lwk;->c:I

    .line 32
    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {v1}, Lap1;->l()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eq v1, v0, :cond_0

    .line 41
    .line 42
    iput v1, p0, Lwk;->c:I

    .line 43
    .line 44
    :cond_2
    :goto_0
    return-void

    .line 45
    :cond_3
    invoke-static {}, Lwd1;->a()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public I(Lyp1;)V
    .locals 2

    .line 1
    iget v0, p0, Lwk;->a:I

    .line 2
    .line 3
    and-int/lit8 v0, v0, 0x7

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne v0, v1, :cond_2

    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Lwk;->Y()Lxo1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Lap1;

    .line 18
    .line 19
    invoke-virtual {v0}, Lap1;->d()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-virtual {v0}, Lap1;->l()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget v1, p0, Lwk;->a:I

    .line 31
    .line 32
    if-eq v0, v1, :cond_0

    .line 33
    .line 34
    iput v0, p0, Lwk;->c:I

    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    invoke-static {}, Lwd1;->a()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public J(Lyp1;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lap1;

    .line 4
    .line 5
    instance-of v1, p1, Lop1;

    .line 6
    .line 7
    iget v2, p0, Lwk;->a:I

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    if-eqz v1, :cond_4

    .line 11
    .line 12
    move-object v1, p1

    .line 13
    check-cast v1, Lop1;

    .line 14
    .line 15
    and-int/lit8 p1, v2, 0x7

    .line 16
    .line 17
    if-eqz p1, :cond_2

    .line 18
    .line 19
    if-ne p1, v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Lap1;->A()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {v0}, Lap1;->e()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    add-int/2addr v2, p1

    .line 30
    :cond_0
    invoke-virtual {v0}, Lap1;->A()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-virtual {v1, p1}, Lop1;->e(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lap1;->e()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-lt p1, v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0, v2}, Lwk;->U(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Lwd1;->a()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-virtual {v0}, Lap1;->A()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-virtual {v1, p1}, Lop1;->e(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Lap1;->d()Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_3
    invoke-virtual {v0}, Lap1;->l()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iget v2, p0, Lwk;->a:I

    .line 70
    .line 71
    if-eq p1, v2, :cond_2

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    and-int/lit8 v1, v2, 0x7

    .line 75
    .line 76
    if-eqz v1, :cond_7

    .line 77
    .line 78
    if-ne v1, v3, :cond_6

    .line 79
    .line 80
    invoke-virtual {v0}, Lap1;->A()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {v0}, Lap1;->e()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    add-int/2addr v2, v1

    .line 89
    :cond_5
    invoke-virtual {v0}, Lap1;->A()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Lap1;->e()I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-lt v1, v2, :cond_5

    .line 105
    .line 106
    invoke-virtual {p0, v2}, Lwk;->U(I)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_6
    invoke-static {}, Lwd1;->a()V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_7
    invoke-virtual {v0}, Lap1;->A()I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0}, Lap1;->d()Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-nez v1, :cond_8

    .line 130
    .line 131
    invoke-virtual {v0}, Lap1;->l()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    iget v2, p0, Lwk;->a:I

    .line 136
    .line 137
    if-eq v1, v2, :cond_7

    .line 138
    .line 139
    move p1, v1

    .line 140
    :goto_0
    iput p1, p0, Lwk;->c:I

    .line 141
    .line 142
    :cond_8
    :goto_1
    return-void
.end method

.method public K(Lyp1;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lap1;

    .line 4
    .line 5
    instance-of v1, p1, Lop1;

    .line 6
    .line 7
    iget v2, p0, Lwk;->a:I

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    if-eqz v1, :cond_4

    .line 11
    .line 12
    move-object v1, p1

    .line 13
    check-cast v1, Lop1;

    .line 14
    .line 15
    and-int/lit8 p1, v2, 0x7

    .line 16
    .line 17
    if-eqz p1, :cond_2

    .line 18
    .line 19
    if-ne p1, v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Lap1;->A()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {v0}, Lap1;->e()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    add-int/2addr v2, p1

    .line 30
    :cond_0
    invoke-virtual {v0}, Lap1;->B()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-virtual {v1, p1}, Lop1;->e(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lap1;->e()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-lt p1, v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0, v2}, Lwk;->U(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Lwd1;->a()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-virtual {v0}, Lap1;->B()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-virtual {v1, p1}, Lop1;->e(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Lap1;->d()Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_3
    invoke-virtual {v0}, Lap1;->l()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iget v2, p0, Lwk;->a:I

    .line 70
    .line 71
    if-eq p1, v2, :cond_2

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    and-int/lit8 v1, v2, 0x7

    .line 75
    .line 76
    if-eqz v1, :cond_7

    .line 77
    .line 78
    if-ne v1, v3, :cond_6

    .line 79
    .line 80
    invoke-virtual {v0}, Lap1;->A()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {v0}, Lap1;->e()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    add-int/2addr v2, v1

    .line 89
    :cond_5
    invoke-virtual {v0}, Lap1;->B()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Lap1;->e()I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-lt v1, v2, :cond_5

    .line 105
    .line 106
    invoke-virtual {p0, v2}, Lwk;->U(I)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_6
    invoke-static {}, Lwd1;->a()V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_7
    invoke-virtual {v0}, Lap1;->B()I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0}, Lap1;->d()Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-nez v1, :cond_8

    .line 130
    .line 131
    invoke-virtual {v0}, Lap1;->l()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    iget v2, p0, Lwk;->a:I

    .line 136
    .line 137
    if-eq v1, v2, :cond_7

    .line 138
    .line 139
    move p1, v1

    .line 140
    :goto_0
    iput p1, p0, Lwk;->c:I

    .line 141
    .line 142
    :cond_8
    :goto_1
    return-void
.end method

.method public L(Lyp1;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lap1;

    .line 4
    .line 5
    instance-of v1, p1, Lop1;

    .line 6
    .line 7
    iget v2, p0, Lwk;->a:I

    .line 8
    .line 9
    const/4 v3, 0x5

    .line 10
    const/4 v4, 0x2

    .line 11
    if-eqz v1, :cond_5

    .line 12
    .line 13
    move-object v1, p1

    .line 14
    check-cast v1, Lop1;

    .line 15
    .line 16
    and-int/lit8 p1, v2, 0x7

    .line 17
    .line 18
    if-eq p1, v4, :cond_3

    .line 19
    .line 20
    if-ne p1, v3, :cond_2

    .line 21
    .line 22
    :cond_0
    invoke-virtual {v0}, Lap1;->C()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {v1, p1}, Lop1;->e(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lap1;->d()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    invoke-virtual {v0}, Lap1;->l()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iget v2, p0, Lwk;->a:I

    .line 41
    .line 42
    if-eq p1, v2, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    invoke-static {}, Lwd1;->a()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    invoke-virtual {v0}, Lap1;->A()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    invoke-static {p0}, Lwk;->V(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Lap1;->e()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    add-int v5, p1, p0

    .line 61
    .line 62
    :cond_4
    invoke-virtual {v0}, Lap1;->C()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-virtual {v1, p0}, Lop1;->e(I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Lap1;->e()I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-lt p0, v5, :cond_4

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_5
    and-int/lit8 v1, v2, 0x7

    .line 77
    .line 78
    if-eq v1, v4, :cond_8

    .line 79
    .line 80
    if-ne v1, v3, :cond_7

    .line 81
    .line 82
    :cond_6
    invoke-virtual {v0}, Lap1;->C()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Lap1;->d()Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-nez v1, :cond_a

    .line 98
    .line 99
    invoke-virtual {v0}, Lap1;->l()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    iget v2, p0, Lwk;->a:I

    .line 104
    .line 105
    if-eq v1, v2, :cond_6

    .line 106
    .line 107
    move p1, v1

    .line 108
    :goto_0
    iput p1, p0, Lwk;->c:I

    .line 109
    .line 110
    return-void

    .line 111
    :cond_7
    invoke-static {}, Lwd1;->a()V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_8
    invoke-virtual {v0}, Lap1;->A()I

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    invoke-static {p0}, Lwk;->V(I)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0}, Lap1;->e()I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    add-int/2addr v1, p0

    .line 127
    :cond_9
    invoke-virtual {v0}, Lap1;->C()I

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0}, Lap1;->e()I

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    if-lt p0, v1, :cond_9

    .line 143
    .line 144
    :cond_a
    :goto_1
    return-void
.end method

.method public M(Lyp1;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lap1;

    .line 4
    .line 5
    instance-of v1, p1, Ldq1;

    .line 6
    .line 7
    iget v2, p0, Lwk;->a:I

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    const/4 v4, 0x1

    .line 11
    if-eqz v1, :cond_4

    .line 12
    .line 13
    move-object v1, p1

    .line 14
    check-cast v1, Ldq1;

    .line 15
    .line 16
    and-int/lit8 p1, v2, 0x7

    .line 17
    .line 18
    if-eq p1, v4, :cond_2

    .line 19
    .line 20
    if-ne p1, v3, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Lap1;->A()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-static {p0}, Lwk;->W(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lap1;->e()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    add-int/2addr p1, p0

    .line 34
    :cond_0
    invoke-virtual {v0}, Lap1;->D()J

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    invoke-virtual {v1, v2, v3}, Ldq1;->e(J)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Lap1;->e()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-lt p0, p1, :cond_0

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    invoke-static {}, Lwd1;->a()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-virtual {v0}, Lap1;->D()J

    .line 53
    .line 54
    .line 55
    move-result-wide v2

    .line 56
    invoke-virtual {v1, v2, v3}, Ldq1;->e(J)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Lap1;->d()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_3

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_3
    invoke-virtual {v0}, Lap1;->l()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    iget v2, p0, Lwk;->a:I

    .line 71
    .line 72
    if-eq p1, v2, :cond_2

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    and-int/lit8 v1, v2, 0x7

    .line 76
    .line 77
    if-eq v1, v4, :cond_7

    .line 78
    .line 79
    if-ne v1, v3, :cond_6

    .line 80
    .line 81
    invoke-virtual {v0}, Lap1;->A()I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    invoke-static {p0}, Lwk;->W(I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Lap1;->e()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    add-int/2addr v1, p0

    .line 93
    :cond_5
    invoke-virtual {v0}, Lap1;->D()J

    .line 94
    .line 95
    .line 96
    move-result-wide v2

    .line 97
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0}, Lap1;->e()I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-lt p0, v1, :cond_5

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_6
    invoke-static {}, Lwd1;->a()V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_7
    invoke-virtual {v0}, Lap1;->D()J

    .line 116
    .line 117
    .line 118
    move-result-wide v1

    .line 119
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0}, Lap1;->d()Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-nez v1, :cond_8

    .line 131
    .line 132
    invoke-virtual {v0}, Lap1;->l()I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    iget v2, p0, Lwk;->a:I

    .line 137
    .line 138
    if-eq v1, v2, :cond_7

    .line 139
    .line 140
    move p1, v1

    .line 141
    :goto_0
    iput p1, p0, Lwk;->c:I

    .line 142
    .line 143
    :cond_8
    :goto_1
    return-void
.end method

.method public N(Lyp1;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lap1;

    .line 4
    .line 5
    instance-of v1, p1, Lop1;

    .line 6
    .line 7
    iget v2, p0, Lwk;->a:I

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    if-eqz v1, :cond_4

    .line 11
    .line 12
    move-object v1, p1

    .line 13
    check-cast v1, Lop1;

    .line 14
    .line 15
    and-int/lit8 p1, v2, 0x7

    .line 16
    .line 17
    if-eqz p1, :cond_2

    .line 18
    .line 19
    if-ne p1, v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Lap1;->A()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {v0}, Lap1;->e()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    add-int/2addr v2, p1

    .line 30
    :cond_0
    invoke-virtual {v0}, Lap1;->E()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-virtual {v1, p1}, Lop1;->e(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lap1;->e()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-lt p1, v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0, v2}, Lwk;->U(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Lwd1;->a()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-virtual {v0}, Lap1;->E()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-virtual {v1, p1}, Lop1;->e(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Lap1;->d()Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_3
    invoke-virtual {v0}, Lap1;->l()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iget v2, p0, Lwk;->a:I

    .line 70
    .line 71
    if-eq p1, v2, :cond_2

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    and-int/lit8 v1, v2, 0x7

    .line 75
    .line 76
    if-eqz v1, :cond_7

    .line 77
    .line 78
    if-ne v1, v3, :cond_6

    .line 79
    .line 80
    invoke-virtual {v0}, Lap1;->A()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {v0}, Lap1;->e()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    add-int/2addr v2, v1

    .line 89
    :cond_5
    invoke-virtual {v0}, Lap1;->E()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Lap1;->e()I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-lt v1, v2, :cond_5

    .line 105
    .line 106
    invoke-virtual {p0, v2}, Lwk;->U(I)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_6
    invoke-static {}, Lwd1;->a()V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_7
    invoke-virtual {v0}, Lap1;->E()I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0}, Lap1;->d()Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-nez v1, :cond_8

    .line 130
    .line 131
    invoke-virtual {v0}, Lap1;->l()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    iget v2, p0, Lwk;->a:I

    .line 136
    .line 137
    if-eq v1, v2, :cond_7

    .line 138
    .line 139
    move p1, v1

    .line 140
    :goto_0
    iput p1, p0, Lwk;->c:I

    .line 141
    .line 142
    :cond_8
    :goto_1
    return-void
.end method

.method public O(Lyp1;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lap1;

    .line 4
    .line 5
    instance-of v1, p1, Ldq1;

    .line 6
    .line 7
    iget v2, p0, Lwk;->a:I

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    if-eqz v1, :cond_4

    .line 11
    .line 12
    move-object v1, p1

    .line 13
    check-cast v1, Ldq1;

    .line 14
    .line 15
    and-int/lit8 p1, v2, 0x7

    .line 16
    .line 17
    if-eqz p1, :cond_2

    .line 18
    .line 19
    if-ne p1, v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Lap1;->A()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {v0}, Lap1;->e()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    add-int/2addr v2, p1

    .line 30
    :cond_0
    invoke-virtual {v0}, Lap1;->F()J

    .line 31
    .line 32
    .line 33
    move-result-wide v3

    .line 34
    invoke-virtual {v1, v3, v4}, Ldq1;->e(J)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lap1;->e()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-lt p1, v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0, v2}, Lwk;->U(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Lwd1;->a()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-virtual {v0}, Lap1;->F()J

    .line 52
    .line 53
    .line 54
    move-result-wide v2

    .line 55
    invoke-virtual {v1, v2, v3}, Ldq1;->e(J)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Lap1;->d()Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_3
    invoke-virtual {v0}, Lap1;->l()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iget v2, p0, Lwk;->a:I

    .line 70
    .line 71
    if-eq p1, v2, :cond_2

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    and-int/lit8 v1, v2, 0x7

    .line 75
    .line 76
    if-eqz v1, :cond_7

    .line 77
    .line 78
    if-ne v1, v3, :cond_6

    .line 79
    .line 80
    invoke-virtual {v0}, Lap1;->A()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {v0}, Lap1;->e()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    add-int/2addr v2, v1

    .line 89
    :cond_5
    invoke-virtual {v0}, Lap1;->F()J

    .line 90
    .line 91
    .line 92
    move-result-wide v3

    .line 93
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Lap1;->e()I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-lt v1, v2, :cond_5

    .line 105
    .line 106
    invoke-virtual {p0, v2}, Lwk;->U(I)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_6
    invoke-static {}, Lwd1;->a()V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_7
    invoke-virtual {v0}, Lap1;->F()J

    .line 115
    .line 116
    .line 117
    move-result-wide v1

    .line 118
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0}, Lap1;->d()Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-nez v1, :cond_8

    .line 130
    .line 131
    invoke-virtual {v0}, Lap1;->l()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    iget v2, p0, Lwk;->a:I

    .line 136
    .line 137
    if-eq v1, v2, :cond_7

    .line 138
    .line 139
    move p1, v1

    .line 140
    :goto_0
    iput p1, p0, Lwk;->c:I

    .line 141
    .line 142
    :cond_8
    :goto_1
    return-void
.end method

.method public P(Lfq1;Lc9;Lgp1;)V
    .locals 11

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Lwk;->Q(I)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lwk;->d:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Lap1;

    .line 8
    .line 9
    invoke-virtual {v1}, Lap1;->A()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {v1, v2}, Lap1;->a(I)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    iget-object v3, p2, Lc9;->m:Ljava/lang/Object;

    .line 18
    .line 19
    const-string v4, ""

    .line 20
    .line 21
    move-object v5, v3

    .line 22
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lwk;->X()I

    .line 23
    .line 24
    .line 25
    move-result v6

    .line 26
    const v7, 0x7fffffff

    .line 27
    .line 28
    .line 29
    if-eq v6, v7, :cond_9

    .line 30
    .line 31
    invoke-virtual {v1}, Lap1;->d()Z

    .line 32
    .line 33
    .line 34
    move-result v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    if-eqz v7, :cond_0

    .line 36
    .line 37
    goto :goto_5

    .line 38
    :cond_0
    const/4 v7, 0x1

    .line 39
    const/4 v8, 0x0

    .line 40
    const-string v9, "Unable to parse map entry."

    .line 41
    .line 42
    if-eq v6, v7, :cond_5

    .line 43
    .line 44
    if-eq v6, v0, :cond_4

    .line 45
    .line 46
    :try_start_1
    invoke-virtual {v1}, Lap1;->d()Z

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    if-nez v6, :cond_2

    .line 51
    .line 52
    iget v6, p0, Lwk;->a:I

    .line 53
    .line 54
    iget v7, p0, Lwk;->b:I

    .line 55
    .line 56
    if-ne v6, v7, :cond_1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    invoke-virtual {v1, v6}, Lap1;->n(I)Z

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    goto :goto_2

    .line 64
    :cond_2
    :goto_1
    move v6, v8

    .line 65
    :goto_2
    if-eqz v6, :cond_3

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    new-instance v6, Laq1;

    .line 69
    .line 70
    invoke-direct {v6, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    throw v6

    .line 74
    :catchall_0
    move-exception p0

    .line 75
    goto :goto_6

    .line 76
    :catch_0
    move-exception v6

    .line 77
    goto :goto_3

    .line 78
    :cond_4
    iget-object v6, p2, Lc9;->l:Ljava/lang/Object;

    .line 79
    .line 80
    check-cast v6, Lhr1;

    .line 81
    .line 82
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    move-result-object v7

    .line 86
    invoke-virtual {p0, v6, v7, p3}, Lwk;->T(Lhr1;Ljava/lang/Class;Lgp1;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    goto :goto_0

    .line 91
    :cond_5
    iget-object v6, p2, Lc9;->k:Ljava/lang/Object;

    .line 92
    .line 93
    check-cast v6, Lhr1;

    .line 94
    .line 95
    const/4 v7, 0x0

    .line 96
    invoke-virtual {p0, v6, v7, v7}, Lwk;->T(Lhr1;Ljava/lang/Class;Lgp1;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v4
    :try_end_1
    .catch Lzp1; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    goto :goto_0

    .line 101
    :goto_3
    :try_start_2
    invoke-virtual {v1}, Lap1;->d()Z

    .line 102
    .line 103
    .line 104
    move-result v7

    .line 105
    if-nez v7, :cond_7

    .line 106
    .line 107
    iget v7, p0, Lwk;->a:I

    .line 108
    .line 109
    iget v10, p0, Lwk;->b:I

    .line 110
    .line 111
    if-ne v7, v10, :cond_6

    .line 112
    .line 113
    goto :goto_4

    .line 114
    :cond_6
    invoke-virtual {v1, v7}, Lap1;->n(I)Z

    .line 115
    .line 116
    .line 117
    move-result v8

    .line 118
    :cond_7
    :goto_4
    if-eqz v8, :cond_8

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_8
    new-instance p0, Laq1;

    .line 122
    .line 123
    invoke-direct {p0, v9, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 124
    .line 125
    .line 126
    throw p0

    .line 127
    :cond_9
    :goto_5
    invoke-virtual {p1, v4, v5}, Lfq1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 128
    .line 129
    .line 130
    invoke-virtual {v1, v2}, Lap1;->b(I)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :goto_6
    invoke-virtual {v1, v2}, Lap1;->b(I)V

    .line 135
    .line 136
    .line 137
    throw p0
.end method

.method public Q(I)V
    .locals 0

    .line 1
    iget p0, p0, Lwk;->a:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x7

    .line 4
    .line 5
    if-ne p0, p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Lwd1;->a()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public R(Ljava/lang/Object;Lvq1;Lgp1;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lap1;

    .line 4
    .line 5
    invoke-virtual {v0}, Lap1;->A()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget v2, v0, Lap1;->a:I

    .line 10
    .line 11
    iget v3, v0, Lap1;->b:I

    .line 12
    .line 13
    add-int/2addr v2, v3

    .line 14
    const/16 v3, 0x64

    .line 15
    .line 16
    if-ge v2, v3, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lap1;->a(I)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iget v2, v0, Lap1;->a:I

    .line 23
    .line 24
    add-int/lit8 v2, v2, 0x1

    .line 25
    .line 26
    iput v2, v0, Lap1;->a:I

    .line 27
    .line 28
    invoke-interface {p2, p1, p0, p3}, Lvq1;->d(Ljava/lang/Object;Lwk;Lgp1;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    invoke-virtual {v0, p0}, Lap1;->m(I)V

    .line 33
    .line 34
    .line 35
    iget p0, v0, Lap1;->a:I

    .line 36
    .line 37
    add-int/lit8 p0, p0, -0x1

    .line 38
    .line 39
    iput p0, v0, Lap1;->a:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lap1;->b(I)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    const-string p0, "Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit."

    .line 46
    .line 47
    invoke-static {p0}, Lwd1;->f(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public S(Ljava/lang/Object;Lvq1;Lgp1;)V
    .locals 2

    .line 1
    iget v0, p0, Lwk;->b:I

    .line 2
    .line 3
    iget v1, p0, Lwk;->a:I

    .line 4
    .line 5
    ushr-int/lit8 v1, v1, 0x3

    .line 6
    .line 7
    shl-int/lit8 v1, v1, 0x3

    .line 8
    .line 9
    or-int/lit8 v1, v1, 0x4

    .line 10
    .line 11
    iput v1, p0, Lwk;->b:I

    .line 12
    .line 13
    :try_start_0
    invoke-interface {p2, p1, p0, p3}, Lvq1;->d(Ljava/lang/Object;Lwk;Lgp1;)V

    .line 14
    .line 15
    .line 16
    iget p1, p0, Lwk;->a:I

    .line 17
    .line 18
    iget p2, p0, Lwk;->b:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    if-ne p1, p2, :cond_0

    .line 21
    .line 22
    iput v0, p0, Lwk;->b:I

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    :try_start_1
    new-instance p1, Laq1;

    .line 26
    .line 27
    const-string p2, "Failed to parse the message."

    .line 28
    .line 29
    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    :catchall_0
    move-exception p1

    .line 34
    iput v0, p0, Lwk;->b:I

    .line 35
    .line 36
    throw p1
.end method

.method public T(Lhr1;Ljava/lang/Class;Lgp1;)Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lap1;

    .line 4
    .line 5
    sget-object v1, Lhr1;->l:Lhr1;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v1, 0x2

    .line 12
    const/4 v2, 0x5

    .line 13
    const/4 v3, 0x1

    .line 14
    const/4 v4, 0x0

    .line 15
    packed-switch p1, :pswitch_data_0

    .line 16
    .line 17
    .line 18
    :pswitch_0
    const-string p0, "unsupported field type."

    .line 19
    .line 20
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0

    .line 25
    :pswitch_1
    invoke-virtual {p0, v4}, Lwk;->Q(I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Lap1;->F()J

    .line 29
    .line 30
    .line 31
    move-result-wide p0

    .line 32
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :pswitch_2
    invoke-virtual {p0, v4}, Lwk;->Q(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Lap1;->E()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :pswitch_3
    invoke-virtual {p0, v3}, Lwk;->Q(I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Lap1;->D()J

    .line 53
    .line 54
    .line 55
    move-result-wide p0

    .line 56
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :pswitch_4
    invoke-virtual {p0, v2}, Lwk;->Q(I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Lap1;->C()I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0

    .line 73
    :pswitch_5
    invoke-virtual {p0, v4}, Lwk;->Q(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Lap1;->B()I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0

    .line 85
    :pswitch_6
    invoke-virtual {p0, v4}, Lwk;->Q(I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Lap1;->A()I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0

    .line 97
    :pswitch_7
    invoke-virtual {p0}, Lwk;->Y()Lxo1;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0

    .line 102
    :pswitch_8
    invoke-virtual {p0, v1}, Lwk;->Q(I)V

    .line 103
    .line 104
    .line 105
    sget-object p1, Lsq1;->c:Lsq1;

    .line 106
    .line 107
    invoke-virtual {p1, p2}, Lsq1;->a(Ljava/lang/Class;)Lvq1;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-interface {p1}, Lvq1;->a()Lnp1;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    invoke-virtual {p0, p2, p1, p3}, Lwk;->R(Ljava/lang/Object;Lvq1;Lgp1;)V

    .line 116
    .line 117
    .line 118
    invoke-interface {p1, p2}, Lvq1;->i(Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    return-object p2

    .line 122
    :pswitch_9
    invoke-virtual {p0, v1}, Lwk;->Q(I)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0}, Lap1;->x()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    return-object p0

    .line 130
    :pswitch_a
    invoke-virtual {p0, v4}, Lwk;->Q(I)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0}, Lap1;->v()Z

    .line 134
    .line 135
    .line 136
    move-result p0

    .line 137
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    return-object p0

    .line 142
    :pswitch_b
    invoke-virtual {p0, v2}, Lwk;->Q(I)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Lap1;->u()I

    .line 146
    .line 147
    .line 148
    move-result p0

    .line 149
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    return-object p0

    .line 154
    :pswitch_c
    invoke-virtual {p0, v3}, Lwk;->Q(I)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0}, Lap1;->t()J

    .line 158
    .line 159
    .line 160
    move-result-wide p0

    .line 161
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    return-object p0

    .line 166
    :pswitch_d
    invoke-virtual {p0, v4}, Lwk;->Q(I)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0}, Lap1;->s()I

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    return-object p0

    .line 178
    :pswitch_e
    invoke-virtual {p0, v4}, Lwk;->Q(I)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v0}, Lap1;->q()J

    .line 182
    .line 183
    .line 184
    move-result-wide p0

    .line 185
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    return-object p0

    .line 190
    :pswitch_f
    invoke-virtual {p0, v4}, Lwk;->Q(I)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v0}, Lap1;->r()J

    .line 194
    .line 195
    .line 196
    move-result-wide p0

    .line 197
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    return-object p0

    .line 202
    :pswitch_10
    invoke-virtual {p0, v2}, Lwk;->Q(I)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0}, Lap1;->p()F

    .line 206
    .line 207
    .line 208
    move-result p0

    .line 209
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    return-object p0

    .line 214
    :pswitch_11
    invoke-virtual {p0, v3}, Lwk;->Q(I)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0}, Lap1;->o()D

    .line 218
    .line 219
    .line 220
    move-result-wide p0

    .line 221
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    return-object p0

    .line 226
    nop

    .line 227
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public U(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lap1;

    .line 4
    .line 5
    invoke-virtual {p0}, Lap1;->e()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ne p0, p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string p0, "While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length."

    .line 13
    .line 14
    invoke-static {p0}, Lwd1;->f(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public X()I
    .locals 2

    .line 1
    iget v0, p0, Lwk;->c:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput v0, p0, Lwk;->a:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput v1, p0, Lwk;->c:I

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Lap1;

    .line 14
    .line 15
    invoke-virtual {v0}, Lap1;->l()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lwk;->a:I

    .line 20
    .line 21
    :goto_0
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget p0, p0, Lwk;->b:I

    .line 24
    .line 25
    if-ne v0, p0, :cond_1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    ushr-int/lit8 p0, v0, 0x3

    .line 29
    .line 30
    return p0

    .line 31
    :cond_2
    :goto_1
    const p0, 0x7fffffff

    .line 32
    .line 33
    .line 34
    return p0
.end method

.method public Y()Lxo1;
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Lwk;->Q(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lwk;->d:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lap1;

    .line 8
    .line 9
    invoke-virtual {p0}, Lap1;->y()Lwo1;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public Z(Lyp1;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lap1;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eq v1, v2, :cond_2

    .line 11
    .line 12
    const/4 p0, 0x2

    .line 13
    if-ne v1, p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Lap1;->A()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Lwk;->W(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Lap1;->e()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    add-int/2addr v1, p0

    .line 27
    :cond_0
    invoke-virtual {v0}, Lap1;->o()D

    .line 28
    .line 29
    .line 30
    move-result-wide v2

    .line 31
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Lap1;->e()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-lt p0, v1, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-static {}, Lwd1;->a()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    invoke-virtual {v0}, Lap1;->o()D

    .line 50
    .line 51
    .line 52
    move-result-wide v1

    .line 53
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Lap1;->d()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_3

    .line 65
    .line 66
    invoke-virtual {v0}, Lap1;->l()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    iget v2, p0, Lwk;->a:I

    .line 71
    .line 72
    if-eq v1, v2, :cond_2

    .line 73
    .line 74
    iput v1, p0, Lwk;->c:I

    .line 75
    .line 76
    :cond_3
    :goto_0
    return-void
.end method

.method public a(II)V
    .locals 5

    .line 1
    if-ltz p1, :cond_3

    .line 2
    .line 3
    if-ltz p2, :cond_2

    .line 4
    .line 5
    iget v0, p0, Lwk;->c:I

    .line 6
    .line 7
    mul-int/lit8 v1, v0, 0x2

    .line 8
    .line 9
    iget-object v2, p0, Lwk;->d:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v2, [I

    .line 12
    .line 13
    const/4 v3, 0x4

    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    new-array v0, v3, [I

    .line 17
    .line 18
    iput-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 19
    .line 20
    const/4 v2, -0x1

    .line 21
    invoke-static {v0, v2}, Ljava/util/Arrays;->fill([II)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    array-length v4, v2

    .line 26
    if-lt v1, v4, :cond_1

    .line 27
    .line 28
    mul-int/2addr v0, v3

    .line 29
    new-array v0, v0, [I

    .line 30
    .line 31
    iput-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 32
    .line 33
    array-length v3, v2

    .line 34
    const/4 v4, 0x0

    .line 35
    invoke-static {v2, v4, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 36
    .line 37
    .line 38
    :cond_1
    :goto_0
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v0, [I

    .line 41
    .line 42
    aput p1, v0, v1

    .line 43
    .line 44
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    aput p2, v0, v1

    .line 47
    .line 48
    iget p1, p0, Lwk;->c:I

    .line 49
    .line 50
    add-int/lit8 p1, p1, 0x1

    .line 51
    .line 52
    iput p1, p0, Lwk;->c:I

    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    const-string p0, "Pixel distance must be non-negative"

    .line 56
    .line 57
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    const-string p0, "Layout positions must be non-negative"

    .line 62
    .line 63
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public a0(Lyp1;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lap1;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    if-eq v1, v2, :cond_2

    .line 11
    .line 12
    const/4 v2, 0x5

    .line 13
    if-ne v1, v2, :cond_1

    .line 14
    .line 15
    :cond_0
    invoke-virtual {v0}, Lap1;->p()F

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Lap1;->d()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_4

    .line 31
    .line 32
    invoke-virtual {v0}, Lap1;->l()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iget v2, p0, Lwk;->a:I

    .line 37
    .line 38
    if-eq v1, v2, :cond_0

    .line 39
    .line 40
    iput v1, p0, Lwk;->c:I

    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    invoke-static {}, Lwd1;->a()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    invoke-virtual {v0}, Lap1;->A()I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    invoke-static {p0}, Lwk;->V(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Lap1;->e()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    add-int/2addr v1, p0

    .line 59
    :cond_3
    invoke-virtual {v0}, Lap1;->p()F

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Lap1;->e()I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-lt p0, v1, :cond_3

    .line 75
    .line 76
    :cond_4
    return-void
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView;Z)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lwk;->c:I

    .line 3
    .line 4
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, [I

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 15
    .line 16
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 17
    .line 18
    if-eqz v1, :cond_3

    .line 19
    .line 20
    if-eqz v0, :cond_3

    .line 21
    .line 22
    iget-boolean v1, v0, Lpy0;->h:Z

    .line 23
    .line 24
    if-eqz v1, :cond_3

    .line 25
    .line 26
    if-eqz p2, :cond_1

    .line 27
    .line 28
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView;->m:Ls3;

    .line 29
    .line 30
    invoke-virtual {v1}, Ls3;->k()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_2

    .line 35
    .line 36
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 37
    .line 38
    check-cast v1, Lhu0;

    .line 39
    .line 40
    iget-object v1, v1, Lhu0;->e:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {v0, v1, p0}, Lpy0;->h(ILwk;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->I()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_2

    .line 55
    .line 56
    iget v1, p0, Lwk;->a:I

    .line 57
    .line 58
    iget v2, p0, Lwk;->b:I

    .line 59
    .line 60
    iget-object v3, p1, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 61
    .line 62
    invoke-virtual {v0, v1, v2, v3, p0}, Lpy0;->g(IILzy0;Lwk;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    :goto_0
    iget p0, p0, Lwk;->c:I

    .line 66
    .line 67
    iget v1, v0, Lpy0;->i:I

    .line 68
    .line 69
    if-le p0, v1, :cond_3

    .line 70
    .line 71
    iput p0, v0, Lpy0;->i:I

    .line 72
    .line 73
    iput-boolean p2, v0, Lpy0;->j:Z

    .line 74
    .line 75
    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 76
    .line 77
    invoke-virtual {p0}, Lvy0;->k()V

    .line 78
    .line 79
    .line 80
    :cond_3
    return-void
.end method

.method public b0(Lyp1;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lap1;

    .line 4
    .line 5
    instance-of v1, p1, Ldq1;

    .line 6
    .line 7
    iget v2, p0, Lwk;->a:I

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    if-eqz v1, :cond_4

    .line 11
    .line 12
    move-object v1, p1

    .line 13
    check-cast v1, Ldq1;

    .line 14
    .line 15
    and-int/lit8 p1, v2, 0x7

    .line 16
    .line 17
    if-eqz p1, :cond_2

    .line 18
    .line 19
    if-ne p1, v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Lap1;->A()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {v0}, Lap1;->e()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    add-int/2addr v2, p1

    .line 30
    :cond_0
    invoke-virtual {v0}, Lap1;->q()J

    .line 31
    .line 32
    .line 33
    move-result-wide v3

    .line 34
    invoke-virtual {v1, v3, v4}, Ldq1;->e(J)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lap1;->e()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-lt p1, v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0, v2}, Lwk;->U(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Lwd1;->a()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-virtual {v0}, Lap1;->q()J

    .line 52
    .line 53
    .line 54
    move-result-wide v2

    .line 55
    invoke-virtual {v1, v2, v3}, Ldq1;->e(J)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Lap1;->d()Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_3
    invoke-virtual {v0}, Lap1;->l()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iget v2, p0, Lwk;->a:I

    .line 70
    .line 71
    if-eq p1, v2, :cond_2

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    and-int/lit8 v1, v2, 0x7

    .line 75
    .line 76
    if-eqz v1, :cond_7

    .line 77
    .line 78
    if-ne v1, v3, :cond_6

    .line 79
    .line 80
    invoke-virtual {v0}, Lap1;->A()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {v0}, Lap1;->e()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    add-int/2addr v2, v1

    .line 89
    :cond_5
    invoke-virtual {v0}, Lap1;->q()J

    .line 90
    .line 91
    .line 92
    move-result-wide v3

    .line 93
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Lap1;->e()I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-lt v1, v2, :cond_5

    .line 105
    .line 106
    invoke-virtual {p0, v2}, Lwk;->U(I)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_6
    invoke-static {}, Lwd1;->a()V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_7
    invoke-virtual {v0}, Lap1;->q()J

    .line 115
    .line 116
    .line 117
    move-result-wide v1

    .line 118
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0}, Lap1;->d()Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-nez v1, :cond_8

    .line 130
    .line 131
    invoke-virtual {v0}, Lap1;->l()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    iget v2, p0, Lwk;->a:I

    .line 136
    .line 137
    if-eq v1, v2, :cond_7

    .line 138
    .line 139
    move p1, v1

    .line 140
    :goto_0
    iput p1, p0, Lwk;->c:I

    .line 141
    .line 142
    :cond_8
    :goto_1
    return-void
.end method

.method public c()I
    .locals 2

    .line 1
    iget v0, p0, Lwk;->c:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput v0, p0, Lwk;->a:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput v1, p0, Lwk;->c:I

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Lvk;

    .line 14
    .line 15
    invoke-virtual {v0}, Lvk;->u()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lwk;->a:I

    .line 20
    .line 21
    :goto_0
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget p0, p0, Lwk;->b:I

    .line 24
    .line 25
    if-ne v0, p0, :cond_1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    ushr-int/lit8 p0, v0, 0x3

    .line 29
    .line 30
    return p0

    .line 31
    :cond_2
    :goto_1
    const p0, 0x7fffffff

    .line 32
    .line 33
    .line 34
    return p0
.end method

.method public d(Ljava/lang/Object;Lc31;Lf20;)V
    .locals 2

    .line 1
    iget v0, p0, Lwk;->b:I

    .line 2
    .line 3
    iget v1, p0, Lwk;->a:I

    .line 4
    .line 5
    ushr-int/lit8 v1, v1, 0x3

    .line 6
    .line 7
    shl-int/lit8 v1, v1, 0x3

    .line 8
    .line 9
    or-int/lit8 v1, v1, 0x4

    .line 10
    .line 11
    iput v1, p0, Lwk;->b:I

    .line 12
    .line 13
    :try_start_0
    invoke-interface {p2, p1, p0, p3}, Lc31;->i(Ljava/lang/Object;Lwk;Lf20;)V

    .line 14
    .line 15
    .line 16
    iget p1, p0, Lwk;->a:I

    .line 17
    .line 18
    iget p2, p0, Lwk;->b:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    if-ne p1, p2, :cond_0

    .line 21
    .line 22
    iput v0, p0, Lwk;->b:I

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    :try_start_1
    new-instance p1, Lsf0;

    .line 26
    .line 27
    const-string p2, "Failed to parse the message."

    .line 28
    .line 29
    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    :catchall_0
    move-exception p1

    .line 34
    iput v0, p0, Lwk;->b:I

    .line 35
    .line 36
    throw p1
.end method

.method public e(Ljava/lang/Object;Lc31;Lf20;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    invoke-virtual {v0}, Lvk;->v()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget v2, v0, Lvk;->a:I

    .line 10
    .line 11
    const/16 v3, 0x64

    .line 12
    .line 13
    if-ge v2, v3, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lvk;->e(I)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget v2, v0, Lvk;->a:I

    .line 20
    .line 21
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    iput v2, v0, Lvk;->a:I

    .line 24
    .line 25
    invoke-interface {p2, p1, p0, p3}, Lc31;->i(Ljava/lang/Object;Lwk;Lf20;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    invoke-virtual {v0, p0}, Lvk;->a(I)V

    .line 30
    .line 31
    .line 32
    iget p0, v0, Lvk;->a:I

    .line 33
    .line 34
    add-int/lit8 p0, p0, -0x1

    .line 35
    .line 36
    iput p0, v0, Lvk;->a:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lvk;->d(I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    new-instance p0, Lsf0;

    .line 43
    .line 44
    const-string p1, "Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit."

    .line 45
    .line 46
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    throw p0
.end method

.method public f(Ljf0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    if-ne v1, v2, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Lvk;->v()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0}, Lvk;->b()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    add-int/2addr v2, v1

    .line 23
    :cond_0
    invoke-virtual {v0}, Lvk;->f()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    move-object v3, p1

    .line 32
    check-cast v3, Lfw0;

    .line 33
    .line 34
    invoke-virtual {v3, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lvk;->b()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-lt v1, v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0, v2}, Lwk;->x(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Lsf0;->b()Lqf0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    throw p0

    .line 52
    :cond_2
    invoke-virtual {v0}, Lvk;->f()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    move-object v2, p1

    .line 61
    check-cast v2, Lfw0;

    .line 62
    .line 63
    invoke-virtual {v2, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Lvk;->c()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    invoke-virtual {v0}, Lvk;->u()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    iget v2, p0, Lwk;->a:I

    .line 78
    .line 79
    if-eq v1, v2, :cond_2

    .line 80
    .line 81
    iput v1, p0, Lwk;->c:I

    .line 82
    .line 83
    return-void
.end method

.method public g()Lsh;
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Lwk;->y(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lwk;->d:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lvk;

    .line 8
    .line 9
    invoke-virtual {p0}, Lvk;->g()Lsh;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public h(Ljf0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    if-ne v1, v2, :cond_2

    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Lwk;->g()Lsh;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    move-object v2, p1

    .line 17
    check-cast v2, Lfw0;

    .line 18
    .line 19
    invoke-virtual {v2, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Lvk;->c()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-virtual {v0}, Lvk;->u()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iget v2, p0, Lwk;->a:I

    .line 34
    .line 35
    if-eq v1, v2, :cond_0

    .line 36
    .line 37
    iput v1, p0, Lwk;->c:I

    .line 38
    .line 39
    return-void

    .line 40
    :cond_2
    invoke-static {}, Lsf0;->b()Lqf0;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    throw p0
.end method

.method public i(Ljf0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eq v1, v2, :cond_3

    .line 11
    .line 12
    const/4 p0, 0x2

    .line 13
    if-ne v1, p0, :cond_2

    .line 14
    .line 15
    invoke-virtual {v0}, Lvk;->v()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    and-int/lit8 v1, p0, 0x7

    .line 20
    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Lvk;->b()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    add-int/2addr v1, p0

    .line 28
    :cond_0
    invoke-virtual {v0}, Lvk;->h()D

    .line 29
    .line 30
    .line 31
    move-result-wide v2

    .line 32
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    move-object v2, p1

    .line 37
    check-cast v2, Lfw0;

    .line 38
    .line 39
    invoke-virtual {v2, p0}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Lvk;->b()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-lt p0, v1, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    new-instance p0, Lsf0;

    .line 50
    .line 51
    const-string p1, "Failed to parse the message."

    .line 52
    .line 53
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    throw p0

    .line 57
    :cond_2
    invoke-static {}, Lsf0;->b()Lqf0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    throw p0

    .line 62
    :cond_3
    invoke-virtual {v0}, Lvk;->h()D

    .line 63
    .line 64
    .line 65
    move-result-wide v1

    .line 66
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    move-object v2, p1

    .line 71
    check-cast v2, Lfw0;

    .line 72
    .line 73
    invoke-virtual {v2, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Lvk;->c()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_4

    .line 81
    .line 82
    :goto_0
    return-void

    .line 83
    :cond_4
    invoke-virtual {v0}, Lvk;->u()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    iget v2, p0, Lwk;->a:I

    .line 88
    .line 89
    if-eq v1, v2, :cond_3

    .line 90
    .line 91
    iput v1, p0, Lwk;->c:I

    .line 92
    .line 93
    return-void
.end method

.method public j(Ljf0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    if-ne v1, v2, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Lvk;->v()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0}, Lvk;->b()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    add-int/2addr v2, v1

    .line 23
    :cond_0
    invoke-virtual {v0}, Lvk;->i()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    move-object v3, p1

    .line 32
    check-cast v3, Lfw0;

    .line 33
    .line 34
    invoke-virtual {v3, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lvk;->b()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-lt v1, v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0, v2}, Lwk;->x(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Lsf0;->b()Lqf0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    throw p0

    .line 52
    :cond_2
    invoke-virtual {v0}, Lvk;->i()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    move-object v2, p1

    .line 61
    check-cast v2, Lfw0;

    .line 62
    .line 63
    invoke-virtual {v2, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Lvk;->c()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    invoke-virtual {v0}, Lvk;->u()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    iget v2, p0, Lwk;->a:I

    .line 78
    .line 79
    if-eq v1, v2, :cond_2

    .line 80
    .line 81
    iput v1, p0, Lwk;->c:I

    .line 82
    .line 83
    return-void
.end method

.method public k(Lwk1;Ljava/lang/Class;Lf20;)Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v1, 0x2

    .line 10
    const/4 v2, 0x5

    .line 11
    const/4 v3, 0x1

    .line 12
    const/4 v4, 0x0

    .line 13
    packed-switch p1, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    :pswitch_0
    const-string p0, "unsupported field type."

    .line 17
    .line 18
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return-object p0

    .line 23
    :pswitch_1
    invoke-virtual {p0, v4}, Lwk;->y(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Lvk;->r()J

    .line 27
    .line 28
    .line 29
    move-result-wide p0

    .line 30
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :pswitch_2
    invoke-virtual {p0, v4}, Lwk;->y(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Lvk;->q()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :pswitch_3
    invoke-virtual {p0, v3}, Lwk;->y(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Lvk;->p()J

    .line 51
    .line 52
    .line 53
    move-result-wide p0

    .line 54
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :pswitch_4
    invoke-virtual {p0, v2}, Lwk;->y(I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Lvk;->o()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0

    .line 71
    :pswitch_5
    invoke-virtual {p0, v4}, Lwk;->y(I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Lvk;->i()I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0

    .line 83
    :pswitch_6
    invoke-virtual {p0, v4}, Lwk;->y(I)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Lvk;->v()I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0

    .line 95
    :pswitch_7
    invoke-virtual {p0}, Lwk;->g()Lsh;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0

    .line 100
    :pswitch_8
    invoke-virtual {p0, v1}, Lwk;->y(I)V

    .line 101
    .line 102
    .line 103
    sget-object p1, Ldw0;->c:Ldw0;

    .line 104
    .line 105
    invoke-virtual {p1, p2}, Ldw0;->a(Ljava/lang/Class;)Lc31;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-interface {p1}, Lc31;->d()Lja0;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    invoke-virtual {p0, p2, p1, p3}, Lwk;->e(Ljava/lang/Object;Lc31;Lf20;)V

    .line 114
    .line 115
    .line 116
    invoke-interface {p1, p2}, Lc31;->b(Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    return-object p2

    .line 120
    :pswitch_9
    invoke-virtual {p0, v1}, Lwk;->y(I)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0}, Lvk;->t()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    return-object p0

    .line 128
    :pswitch_a
    invoke-virtual {p0, v4}, Lwk;->y(I)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0}, Lvk;->f()Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    return-object p0

    .line 140
    :pswitch_b
    invoke-virtual {p0, v2}, Lwk;->y(I)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0}, Lvk;->j()I

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    return-object p0

    .line 152
    :pswitch_c
    invoke-virtual {p0, v3}, Lwk;->y(I)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v0}, Lvk;->k()J

    .line 156
    .line 157
    .line 158
    move-result-wide p0

    .line 159
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    return-object p0

    .line 164
    :pswitch_d
    invoke-virtual {p0, v4}, Lwk;->y(I)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0}, Lvk;->m()I

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    return-object p0

    .line 176
    :pswitch_e
    invoke-virtual {p0, v4}, Lwk;->y(I)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v0}, Lvk;->w()J

    .line 180
    .line 181
    .line 182
    move-result-wide p0

    .line 183
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    return-object p0

    .line 188
    :pswitch_f
    invoke-virtual {p0, v4}, Lwk;->y(I)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v0}, Lvk;->n()J

    .line 192
    .line 193
    .line 194
    move-result-wide p0

    .line 195
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    return-object p0

    .line 200
    :pswitch_10
    invoke-virtual {p0, v2}, Lwk;->y(I)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v0}, Lvk;->l()F

    .line 204
    .line 205
    .line 206
    move-result p0

    .line 207
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    return-object p0

    .line 212
    :pswitch_11
    invoke-virtual {p0, v3}, Lwk;->y(I)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v0}, Lvk;->h()D

    .line 216
    .line 217
    .line 218
    move-result-wide p0

    .line 219
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    return-object p0

    .line 224
    nop

    .line 225
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public l(Ljf0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    if-eq v1, v2, :cond_3

    .line 11
    .line 12
    const/4 v2, 0x5

    .line 13
    if-ne v1, v2, :cond_2

    .line 14
    .line 15
    :cond_0
    invoke-virtual {v0}, Lvk;->j()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    move-object v2, p1

    .line 24
    check-cast v2, Lfw0;

    .line 25
    .line 26
    invoke-virtual {v2, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lvk;->c()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {v0}, Lvk;->u()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iget v2, p0, Lwk;->a:I

    .line 41
    .line 42
    if-eq v1, v2, :cond_0

    .line 43
    .line 44
    iput v1, p0, Lwk;->c:I

    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    invoke-static {}, Lsf0;->b()Lqf0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    throw p0

    .line 52
    :cond_3
    invoke-virtual {v0}, Lvk;->v()I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    and-int/lit8 v1, p0, 0x3

    .line 57
    .line 58
    if-nez v1, :cond_5

    .line 59
    .line 60
    invoke-virtual {v0}, Lvk;->b()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    add-int/2addr v1, p0

    .line 65
    :cond_4
    invoke-virtual {v0}, Lvk;->j()I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    move-object v2, p1

    .line 74
    check-cast v2, Lfw0;

    .line 75
    .line 76
    invoke-virtual {v2, p0}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Lvk;->b()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-lt p0, v1, :cond_4

    .line 84
    .line 85
    :goto_0
    return-void

    .line 86
    :cond_5
    new-instance p0, Lsf0;

    .line 87
    .line 88
    const-string p1, "Failed to parse the message."

    .line 89
    .line 90
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    throw p0
.end method

.method public m(Ljf0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eq v1, v2, :cond_3

    .line 11
    .line 12
    const/4 p0, 0x2

    .line 13
    if-ne v1, p0, :cond_2

    .line 14
    .line 15
    invoke-virtual {v0}, Lvk;->v()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    and-int/lit8 v1, p0, 0x7

    .line 20
    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Lvk;->b()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    add-int/2addr v1, p0

    .line 28
    :cond_0
    invoke-virtual {v0}, Lvk;->k()J

    .line 29
    .line 30
    .line 31
    move-result-wide v2

    .line 32
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    move-object v2, p1

    .line 37
    check-cast v2, Lfw0;

    .line 38
    .line 39
    invoke-virtual {v2, p0}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Lvk;->b()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-lt p0, v1, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    new-instance p0, Lsf0;

    .line 50
    .line 51
    const-string p1, "Failed to parse the message."

    .line 52
    .line 53
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    throw p0

    .line 57
    :cond_2
    invoke-static {}, Lsf0;->b()Lqf0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    throw p0

    .line 62
    :cond_3
    invoke-virtual {v0}, Lvk;->k()J

    .line 63
    .line 64
    .line 65
    move-result-wide v1

    .line 66
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    move-object v2, p1

    .line 71
    check-cast v2, Lfw0;

    .line 72
    .line 73
    invoke-virtual {v2, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Lvk;->c()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_4

    .line 81
    .line 82
    :goto_0
    return-void

    .line 83
    :cond_4
    invoke-virtual {v0}, Lvk;->u()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    iget v2, p0, Lwk;->a:I

    .line 88
    .line 89
    if-eq v1, v2, :cond_3

    .line 90
    .line 91
    iput v1, p0, Lwk;->c:I

    .line 92
    .line 93
    return-void
.end method

.method public n(Ljf0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    if-eq v1, v2, :cond_3

    .line 11
    .line 12
    const/4 v2, 0x5

    .line 13
    if-ne v1, v2, :cond_2

    .line 14
    .line 15
    :cond_0
    invoke-virtual {v0}, Lvk;->l()F

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    move-object v2, p1

    .line 24
    check-cast v2, Lfw0;

    .line 25
    .line 26
    invoke-virtual {v2, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lvk;->c()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {v0}, Lvk;->u()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iget v2, p0, Lwk;->a:I

    .line 41
    .line 42
    if-eq v1, v2, :cond_0

    .line 43
    .line 44
    iput v1, p0, Lwk;->c:I

    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    invoke-static {}, Lsf0;->b()Lqf0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    throw p0

    .line 52
    :cond_3
    invoke-virtual {v0}, Lvk;->v()I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    and-int/lit8 v1, p0, 0x3

    .line 57
    .line 58
    if-nez v1, :cond_5

    .line 59
    .line 60
    invoke-virtual {v0}, Lvk;->b()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    add-int/2addr v1, p0

    .line 65
    :cond_4
    invoke-virtual {v0}, Lvk;->l()F

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    move-object v2, p1

    .line 74
    check-cast v2, Lfw0;

    .line 75
    .line 76
    invoke-virtual {v2, p0}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Lvk;->b()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-lt p0, v1, :cond_4

    .line 84
    .line 85
    :goto_0
    return-void

    .line 86
    :cond_5
    new-instance p0, Lsf0;

    .line 87
    .line 88
    const-string p1, "Failed to parse the message."

    .line 89
    .line 90
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    throw p0
.end method

.method public o(Ljf0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    if-ne v1, v2, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Lvk;->v()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0}, Lvk;->b()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    add-int/2addr v2, v1

    .line 23
    :cond_0
    invoke-virtual {v0}, Lvk;->m()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    move-object v3, p1

    .line 32
    check-cast v3, Lfw0;

    .line 33
    .line 34
    invoke-virtual {v3, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lvk;->b()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-lt v1, v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0, v2}, Lwk;->x(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Lsf0;->b()Lqf0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    throw p0

    .line 52
    :cond_2
    invoke-virtual {v0}, Lvk;->m()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    move-object v2, p1

    .line 61
    check-cast v2, Lfw0;

    .line 62
    .line 63
    invoke-virtual {v2, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Lvk;->c()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    invoke-virtual {v0}, Lvk;->u()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    iget v2, p0, Lwk;->a:I

    .line 78
    .line 79
    if-eq v1, v2, :cond_2

    .line 80
    .line 81
    iput v1, p0, Lwk;->c:I

    .line 82
    .line 83
    return-void
.end method

.method public p(Ljf0;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    if-ne v1, v2, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Lvk;->v()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0}, Lvk;->b()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    add-int/2addr v2, v1

    .line 23
    :cond_0
    invoke-virtual {v0}, Lvk;->n()J

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    move-object v3, p1

    .line 32
    check-cast v3, Lfw0;

    .line 33
    .line 34
    invoke-virtual {v3, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lvk;->b()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-lt v1, v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0, v2}, Lwk;->x(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Lsf0;->b()Lqf0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    throw p0

    .line 52
    :cond_2
    invoke-virtual {v0}, Lvk;->n()J

    .line 53
    .line 54
    .line 55
    move-result-wide v1

    .line 56
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    move-object v2, p1

    .line 61
    check-cast v2, Lfw0;

    .line 62
    .line 63
    invoke-virtual {v2, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Lvk;->c()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    invoke-virtual {v0}, Lvk;->u()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    iget v2, p0, Lwk;->a:I

    .line 78
    .line 79
    if-eq v1, v2, :cond_2

    .line 80
    .line 81
    iput v1, p0, Lwk;->c:I

    .line 82
    .line 83
    return-void
.end method

.method public q(Ljf0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    if-eq v1, v2, :cond_3

    .line 11
    .line 12
    const/4 v2, 0x5

    .line 13
    if-ne v1, v2, :cond_2

    .line 14
    .line 15
    :cond_0
    invoke-virtual {v0}, Lvk;->o()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    move-object v2, p1

    .line 24
    check-cast v2, Lfw0;

    .line 25
    .line 26
    invoke-virtual {v2, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lvk;->c()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {v0}, Lvk;->u()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iget v2, p0, Lwk;->a:I

    .line 41
    .line 42
    if-eq v1, v2, :cond_0

    .line 43
    .line 44
    iput v1, p0, Lwk;->c:I

    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    invoke-static {}, Lsf0;->b()Lqf0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    throw p0

    .line 52
    :cond_3
    invoke-virtual {v0}, Lvk;->v()I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    and-int/lit8 v1, p0, 0x3

    .line 57
    .line 58
    if-nez v1, :cond_5

    .line 59
    .line 60
    invoke-virtual {v0}, Lvk;->b()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    add-int/2addr v1, p0

    .line 65
    :cond_4
    invoke-virtual {v0}, Lvk;->o()I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    move-object v2, p1

    .line 74
    check-cast v2, Lfw0;

    .line 75
    .line 76
    invoke-virtual {v2, p0}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Lvk;->b()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-lt p0, v1, :cond_4

    .line 84
    .line 85
    :goto_0
    return-void

    .line 86
    :cond_5
    new-instance p0, Lsf0;

    .line 87
    .line 88
    const-string p1, "Failed to parse the message."

    .line 89
    .line 90
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    throw p0
.end method

.method public r(Ljf0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eq v1, v2, :cond_3

    .line 11
    .line 12
    const/4 p0, 0x2

    .line 13
    if-ne v1, p0, :cond_2

    .line 14
    .line 15
    invoke-virtual {v0}, Lvk;->v()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    and-int/lit8 v1, p0, 0x7

    .line 20
    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Lvk;->b()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    add-int/2addr v1, p0

    .line 28
    :cond_0
    invoke-virtual {v0}, Lvk;->p()J

    .line 29
    .line 30
    .line 31
    move-result-wide v2

    .line 32
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    move-object v2, p1

    .line 37
    check-cast v2, Lfw0;

    .line 38
    .line 39
    invoke-virtual {v2, p0}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Lvk;->b()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-lt p0, v1, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    new-instance p0, Lsf0;

    .line 50
    .line 51
    const-string p1, "Failed to parse the message."

    .line 52
    .line 53
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    throw p0

    .line 57
    :cond_2
    invoke-static {}, Lsf0;->b()Lqf0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    throw p0

    .line 62
    :cond_3
    invoke-virtual {v0}, Lvk;->p()J

    .line 63
    .line 64
    .line 65
    move-result-wide v1

    .line 66
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    move-object v2, p1

    .line 71
    check-cast v2, Lfw0;

    .line 72
    .line 73
    invoke-virtual {v2, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Lvk;->c()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_4

    .line 81
    .line 82
    :goto_0
    return-void

    .line 83
    :cond_4
    invoke-virtual {v0}, Lvk;->u()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    iget v2, p0, Lwk;->a:I

    .line 88
    .line 89
    if-eq v1, v2, :cond_3

    .line 90
    .line 91
    iput v1, p0, Lwk;->c:I

    .line 92
    .line 93
    return-void
.end method

.method public s(Ljf0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    if-ne v1, v2, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Lvk;->v()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0}, Lvk;->b()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    add-int/2addr v2, v1

    .line 23
    :cond_0
    invoke-virtual {v0}, Lvk;->q()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    move-object v3, p1

    .line 32
    check-cast v3, Lfw0;

    .line 33
    .line 34
    invoke-virtual {v3, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lvk;->b()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-lt v1, v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0, v2}, Lwk;->x(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Lsf0;->b()Lqf0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    throw p0

    .line 52
    :cond_2
    invoke-virtual {v0}, Lvk;->q()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    move-object v2, p1

    .line 61
    check-cast v2, Lfw0;

    .line 62
    .line 63
    invoke-virtual {v2, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Lvk;->c()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    invoke-virtual {v0}, Lvk;->u()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    iget v2, p0, Lwk;->a:I

    .line 78
    .line 79
    if-eq v1, v2, :cond_2

    .line 80
    .line 81
    iput v1, p0, Lwk;->c:I

    .line 82
    .line 83
    return-void
.end method

.method public t(Ljf0;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    if-ne v1, v2, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Lvk;->v()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0}, Lvk;->b()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    add-int/2addr v2, v1

    .line 23
    :cond_0
    invoke-virtual {v0}, Lvk;->r()J

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    move-object v3, p1

    .line 32
    check-cast v3, Lfw0;

    .line 33
    .line 34
    invoke-virtual {v3, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lvk;->b()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-lt v1, v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0, v2}, Lwk;->x(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Lsf0;->b()Lqf0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    throw p0

    .line 52
    :cond_2
    invoke-virtual {v0}, Lvk;->r()J

    .line 53
    .line 54
    .line 55
    move-result-wide v1

    .line 56
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    move-object v2, p1

    .line 61
    check-cast v2, Lfw0;

    .line 62
    .line 63
    invoke-virtual {v2, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Lvk;->c()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    invoke-virtual {v0}, Lvk;->u()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    iget v2, p0, Lwk;->a:I

    .line 78
    .line 79
    if-eq v1, v2, :cond_2

    .line 80
    .line 81
    iput v1, p0, Lwk;->c:I

    .line 82
    .line 83
    return-void
.end method

.method public u(Ljf0;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    if-ne v1, v2, :cond_3

    .line 11
    .line 12
    :cond_0
    if-eqz p2, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, v2}, Lwk;->y(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Lvk;->t()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-virtual {p0, v2}, Lwk;->y(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Lvk;->s()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    :goto_0
    move-object v3, p1

    .line 30
    check-cast v3, Lfw0;

    .line 31
    .line 32
    invoke-virtual {v3, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Lvk;->c()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    invoke-virtual {v0}, Lvk;->u()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    iget v3, p0, Lwk;->a:I

    .line 47
    .line 48
    if-eq v1, v3, :cond_0

    .line 49
    .line 50
    iput v1, p0, Lwk;->c:I

    .line 51
    .line 52
    return-void

    .line 53
    :cond_3
    invoke-static {}, Lsf0;->b()Lqf0;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    throw p0
.end method

.method public v(Ljf0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    if-ne v1, v2, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Lvk;->v()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0}, Lvk;->b()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    add-int/2addr v2, v1

    .line 23
    :cond_0
    invoke-virtual {v0}, Lvk;->v()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    move-object v3, p1

    .line 32
    check-cast v3, Lfw0;

    .line 33
    .line 34
    invoke-virtual {v3, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lvk;->b()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-lt v1, v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0, v2}, Lwk;->x(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Lsf0;->b()Lqf0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    throw p0

    .line 52
    :cond_2
    invoke-virtual {v0}, Lvk;->v()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    move-object v2, p1

    .line 61
    check-cast v2, Lfw0;

    .line 62
    .line 63
    invoke-virtual {v2, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Lvk;->c()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    invoke-virtual {v0}, Lvk;->u()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    iget v2, p0, Lwk;->a:I

    .line 78
    .line 79
    if-eq v1, v2, :cond_2

    .line 80
    .line 81
    iput v1, p0, Lwk;->c:I

    .line 82
    .line 83
    return-void
.end method

.method public w(Ljf0;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    iget v1, p0, Lwk;->a:I

    .line 6
    .line 7
    and-int/lit8 v1, v1, 0x7

    .line 8
    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    if-ne v1, v2, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Lvk;->v()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0}, Lvk;->b()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    add-int/2addr v2, v1

    .line 23
    :cond_0
    invoke-virtual {v0}, Lvk;->w()J

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    move-object v3, p1

    .line 32
    check-cast v3, Lfw0;

    .line 33
    .line 34
    invoke-virtual {v3, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lvk;->b()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-lt v1, v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0, v2}, Lwk;->x(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Lsf0;->b()Lqf0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    throw p0

    .line 52
    :cond_2
    invoke-virtual {v0}, Lvk;->w()J

    .line 53
    .line 54
    .line 55
    move-result-wide v1

    .line 56
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    move-object v2, p1

    .line 61
    check-cast v2, Lfw0;

    .line 62
    .line 63
    invoke-virtual {v2, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Lvk;->c()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    invoke-virtual {v0}, Lvk;->u()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    iget v2, p0, Lwk;->a:I

    .line 78
    .line 79
    if-eq v1, v2, :cond_2

    .line 80
    .line 81
    iput v1, p0, Lwk;->c:I

    .line 82
    .line 83
    return-void
.end method

.method public x(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lvk;

    .line 4
    .line 5
    invoke-virtual {p0}, Lvk;->b()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ne p0, p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {}, Lsf0;->e()Lsf0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    throw p0
.end method

.method public y(I)V
    .locals 0

    .line 1
    iget p0, p0, Lwk;->a:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x7

    .line 4
    .line 5
    if-ne p0, p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Lsf0;->b()Lqf0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    throw p0
.end method

.method public z()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvk;

    .line 4
    .line 5
    invoke-virtual {v0}, Lvk;->c()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    iget v1, p0, Lwk;->a:I

    .line 12
    .line 13
    iget p0, p0, Lwk;->b:I

    .line 14
    .line 15
    if-ne v1, p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {v0, v1}, Lvk;->x(I)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method
