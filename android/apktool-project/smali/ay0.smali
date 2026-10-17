.class public final Lay0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Lwx0;

.field public final b:Ljava/util/ArrayList;

.field public final c:I

.field public final d:Lai;

.field public final e:Lm01;

.field public f:I


# direct methods
.method public constructor <init>(Lwx0;Ljava/util/ArrayList;ILai;Lm01;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lay0;->a:Lwx0;

    .line 5
    .line 6
    iput-object p2, p0, Lay0;->b:Ljava/util/ArrayList;

    .line 7
    .line 8
    iput p3, p0, Lay0;->c:I

    .line 9
    .line 10
    iput-object p4, p0, Lay0;->d:Lai;

    .line 11
    .line 12
    iput-object p5, p0, Lay0;->e:Lm01;

    .line 13
    .line 14
    return-void
.end method

.method public static a(Lay0;ILai;Lm01;I)Lay0;
    .locals 6

    .line 1
    and-int/lit8 v0, p4, 0x1

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p1, p0, Lay0;->c:I

    .line 6
    .line 7
    :cond_0
    move v3, p1

    .line 8
    and-int/lit8 p1, p4, 0x2

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget-object p2, p0, Lay0;->d:Lai;

    .line 13
    .line 14
    :cond_1
    move-object v4, p2

    .line 15
    and-int/lit8 p1, p4, 0x4

    .line 16
    .line 17
    if-eqz p1, :cond_2

    .line 18
    .line 19
    iget-object p3, p0, Lay0;->e:Lm01;

    .line 20
    .line 21
    :cond_2
    move-object v5, p3

    .line 22
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    new-instance v0, Lay0;

    .line 26
    .line 27
    iget-object v1, p0, Lay0;->a:Lwx0;

    .line 28
    .line 29
    iget-object v2, p0, Lay0;->b:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct/range {v0 .. v5}, Lay0;-><init>(Lwx0;Ljava/util/ArrayList;ILai;Lm01;)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method


# virtual methods
.method public final b(Lm01;)Lf11;
    .locals 11

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lay0;->b:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    iget v3, p0, Lay0;->c:I

    .line 12
    .line 13
    if-ge v3, v1, :cond_7

    .line 14
    .line 15
    iget v1, p0, Lay0;->f:I

    .line 16
    .line 17
    const/4 v4, 0x1

    .line 18
    add-int/2addr v1, v4

    .line 19
    iput v1, p0, Lay0;->f:I

    .line 20
    .line 21
    const-string v1, " must call proceed() exactly once"

    .line 22
    .line 23
    iget-object v5, p0, Lay0;->d:Lai;

    .line 24
    .line 25
    const-string v6, "network interceptor "

    .line 26
    .line 27
    if-eqz v5, :cond_2

    .line 28
    .line 29
    iget-object v7, v5, Lai;->c:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v7, Lp10;

    .line 32
    .line 33
    iget-object v8, p1, Lm01;->a:Led0;

    .line 34
    .line 35
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    iget-object v7, v7, Lp10;->b:Lt3;

    .line 42
    .line 43
    iget-object v7, v7, Lt3;->f:Led0;

    .line 44
    .line 45
    iget v9, v8, Led0;->e:I

    .line 46
    .line 47
    iget v10, v7, Led0;->e:I

    .line 48
    .line 49
    if-ne v9, v10, :cond_1

    .line 50
    .line 51
    iget-object v8, v8, Led0;->d:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v7, v7, Led0;->d:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v8, v7}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    if-eqz v7, :cond_1

    .line 60
    .line 61
    iget v7, p0, Lay0;->f:I

    .line 62
    .line 63
    if-ne v7, v4, :cond_0

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    sub-int/2addr v3, v4

    .line 67
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {v6, p0, v1}, Lo40;->r(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    return-object v2

    .line 75
    :cond_1
    sub-int/2addr v3, v4

    .line 76
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string p1, " must retain the same host and port"

    .line 81
    .line 82
    invoke-static {v6, p0, p1}, Lo40;->r(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    return-object v2

    .line 86
    :cond_2
    :goto_0
    add-int/lit8 v7, v3, 0x1

    .line 87
    .line 88
    const/16 v8, 0x3a

    .line 89
    .line 90
    invoke-static {p0, v7, v2, p1, v8}, Lay0;->a(Lay0;ILai;Lm01;I)Lay0;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    check-cast p1, Lff0;

    .line 99
    .line 100
    invoke-interface {p1, p0}, Lff0;->a(Lay0;)Lf11;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    const-string v8, "interceptor "

    .line 105
    .line 106
    if-eqz v3, :cond_6

    .line 107
    .line 108
    if-eqz v5, :cond_4

    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-ge v7, v0, :cond_4

    .line 115
    .line 116
    iget p0, p0, Lay0;->f:I

    .line 117
    .line 118
    if-ne p0, v4, :cond_3

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_3
    invoke-static {v6, p1, v1}, Lo40;->r(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    return-object v2

    .line 125
    :cond_4
    :goto_1
    iget-object p0, v3, Lf11;->p:Lh11;

    .line 126
    .line 127
    if-eqz p0, :cond_5

    .line 128
    .line 129
    return-object v3

    .line 130
    :cond_5
    const-string p0, " returned a response with no body"

    .line 131
    .line 132
    invoke-static {v8, p1, p0}, Lo40;->r(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    return-object v2

    .line 136
    :cond_6
    new-instance p0, Ljava/lang/NullPointerException;

    .line 137
    .line 138
    new-instance v0, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    invoke-direct {v0, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    const-string p1, " returned null"

    .line 147
    .line 148
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    throw p0

    .line 159
    :cond_7
    const-string p0, "Check failed."

    .line 160
    .line 161
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    return-object v2
.end method
