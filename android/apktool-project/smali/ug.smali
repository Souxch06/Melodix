.class public final Lug;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ldh0;


# static fields
.field public static final a:Lug;

.field public static final b:Lzu0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lug;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lug;->a:Lug;

    .line 7
    .line 8
    new-instance v0, Lzu0;

    .line 9
    .line 10
    const-string v1, "kotlin.Boolean"

    .line 11
    .line 12
    sget-object v2, Lyu0;->j:Lyu0;

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Lzu0;-><init>(Ljava/lang/String;Lyu0;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lug;->b:Lzu0;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final b(Ll80;)Ljava/lang/Object;
    .locals 10

    .line 1
    iget-object p0, p1, Ll80;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lz91;

    .line 4
    .line 5
    invoke-virtual {p0}, Lz91;->n()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object v0, p0, Lz91;->e:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const-string v2, "EOF"

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    const/4 v4, 0x6

    .line 19
    const/4 v5, 0x0

    .line 20
    if-eq p1, v1, :cond_7

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/lang/String;->charAt(I)C

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/16 v6, 0x22

    .line 27
    .line 28
    const/4 v7, 0x1

    .line 29
    if-ne v1, v6, :cond_0

    .line 30
    .line 31
    add-int/lit8 p1, p1, 0x1

    .line 32
    .line 33
    move v1, v7

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move v1, v5

    .line 36
    :goto_0
    invoke-virtual {p0, p1}, Lz91;->m(I)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 41
    .line 42
    .line 43
    move-result v8

    .line 44
    if-ge p1, v8, :cond_6

    .line 45
    .line 46
    const/4 v8, -0x1

    .line 47
    if-eq p1, v8, :cond_6

    .line 48
    .line 49
    add-int/lit8 v8, p1, 0x1

    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ljava/lang/String;->charAt(I)C

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    or-int/lit8 p1, p1, 0x20

    .line 56
    .line 57
    const/16 v9, 0x66

    .line 58
    .line 59
    if-eq p1, v9, :cond_2

    .line 60
    .line 61
    const/16 v9, 0x74

    .line 62
    .line 63
    if-ne p1, v9, :cond_1

    .line 64
    .line 65
    const-string p1, "rue"

    .line 66
    .line 67
    invoke-virtual {p0, v8, p1}, Lz91;->c(ILjava/lang/String;)V

    .line 68
    .line 69
    .line 70
    move p1, v7

    .line 71
    goto :goto_1

    .line 72
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v0, "Expected valid boolean literal prefix, but had \'"

    .line 75
    .line 76
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Lz91;->h()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const/16 v0, 0x27

    .line 87
    .line 88
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-static {p0, p1, v5, v4}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 96
    .line 97
    .line 98
    throw v3

    .line 99
    :cond_2
    const-string p1, "alse"

    .line 100
    .line 101
    invoke-virtual {p0, v8, p1}, Lz91;->c(ILjava/lang/String;)V

    .line 102
    .line 103
    .line 104
    move p1, v5

    .line 105
    :goto_1
    if-eqz v1, :cond_5

    .line 106
    .line 107
    iget v1, p0, Lz91;->a:I

    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 110
    .line 111
    .line 112
    move-result v8

    .line 113
    if-eq v1, v8, :cond_4

    .line 114
    .line 115
    iget v1, p0, Lz91;->a:I

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-ne v0, v6, :cond_3

    .line 122
    .line 123
    iget v0, p0, Lz91;->a:I

    .line 124
    .line 125
    add-int/2addr v0, v7

    .line 126
    iput v0, p0, Lz91;->a:I

    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_3
    const-string p1, "Expected closing quotation mark"

    .line 130
    .line 131
    invoke-static {p0, p1, v5, v4}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 132
    .line 133
    .line 134
    throw v3

    .line 135
    :cond_4
    invoke-static {p0, v2, v5, v4}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 136
    .line 137
    .line 138
    throw v3

    .line 139
    :cond_5
    :goto_2
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    return-object p0

    .line 144
    :cond_6
    invoke-static {p0, v2, v5, v4}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 145
    .line 146
    .line 147
    throw v3

    .line 148
    :cond_7
    invoke-static {p0, v2, v5, v4}, Lz91;->j(Lz91;Ljava/lang/String;II)V

    .line 149
    .line 150
    .line 151
    throw v3
.end method

.method public final c(Lqt;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p2, Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    iget-boolean p2, p1, Lqt;->a:Z

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Lqt;->j(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object p1, p1, Lqt;->b:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p1, Lke2;

    .line 22
    .line 23
    iget-object p1, p1, Lke2;->k:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p1, Lf4;

    .line 26
    .line 27
    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Lf4;->h(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :goto_0
    return-void
.end method

.method public final d()Li41;
    .locals 0

    .line 1
    sget-object p0, Lug;->b:Lzu0;

    .line 2
    .line 3
    return-object p0
.end method
