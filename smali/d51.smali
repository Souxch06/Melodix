.class public final Ld51;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final f:D

.field public static final synthetic g:I


# instance fields
.field public final a:Lu30;

.field public final b:Lh40;

.field public final c:Ll51;

.field public final d:Lf10;

.field public final e:Lsq;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sput-wide v0, Ld51;->f:D

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Lu30;Lh40;Ll51;Lf10;Lsq;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ld51;->a:Lu30;

    .line 20
    .line 21
    iput-object p2, p0, Ld51;->b:Lh40;

    .line 22
    .line 23
    iput-object p3, p0, Ld51;->c:Ll51;

    .line 24
    .line 25
    iput-object p4, p0, Ld51;->d:Lf10;

    .line 26
    .line 27
    iput-object p5, p0, Ld51;->e:Lsq;

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public final a(Lkq;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p1, Lc51;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lc51;

    .line 7
    .line 8
    iget v1, v0, Lc51;->p:I

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
    iput v1, v0, Lc51;->p:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lc51;

    .line 21
    .line 22
    invoke-direct {v0, p0, p1}, Lc51;-><init>(Ld51;Lkq;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p1, v0, Lc51;->n:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, Lc51;->p:I

    .line 28
    .line 29
    const/4 v2, 0x2

    .line 30
    const/4 v3, 0x1

    .line 31
    sget-object v4, Lar;->j:Lar;

    .line 32
    .line 33
    if-eqz v1, :cond_3

    .line 34
    .line 35
    if-eq v1, v3, :cond_2

    .line 36
    .line 37
    if-ne v1, v2, :cond_1

    .line 38
    .line 39
    iget-object p0, v0, Lc51;->m:Ld51;

    .line 40
    .line 41
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    goto :goto_3

    .line 45
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 46
    .line 47
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const/4 p0, 0x0

    .line 51
    return-object p0

    .line 52
    :cond_2
    iget-object p0, v0, Lc51;->m:Ld51;

    .line 53
    .line 54
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    sget-object p1, Ll50;->a:Ll50;

    .line 62
    .line 63
    iput-object p0, v0, Lc51;->m:Ld51;

    .line 64
    .line 65
    iput v3, v0, Lc51;->p:I

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Ll50;->b(Lkq;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    if-ne p1, v4, :cond_4

    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_4
    :goto_1
    check-cast p1, Ljava/util/Map;

    .line 75
    .line 76
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    if-eqz p1, :cond_5

    .line 81
    .line 82
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-eqz v1, :cond_5

    .line 87
    .line 88
    goto :goto_5

    .line 89
    :cond_5
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    :cond_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_c

    .line 98
    .line 99
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    check-cast v1, Llr;

    .line 104
    .line 105
    iget-object v1, v1, Llr;->a:Lqt;

    .line 106
    .line 107
    invoke-virtual {v1}, Lqt;->l()Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-eqz v1, :cond_6

    .line 112
    .line 113
    iget-object p1, p0, Ld51;->c:Ll51;

    .line 114
    .line 115
    iput-object p0, v0, Lc51;->m:Ld51;

    .line 116
    .line 117
    iput v2, v0, Lc51;->p:I

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Ll51;->b(Lkq;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    if-ne p1, v4, :cond_7

    .line 124
    .line 125
    :goto_2
    return-object v4

    .line 126
    :cond_7
    :goto_3
    iget-object p1, p0, Ld51;->c:Ll51;

    .line 127
    .line 128
    iget-object v0, p1, Ll51;->a:Ln61;

    .line 129
    .line 130
    invoke-interface {v0}, Ln61;->a()Ljava/lang/Boolean;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    if-eqz v0, :cond_8

    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    goto :goto_4

    .line 141
    :cond_8
    iget-object p1, p1, Ll51;->b:Ln61;

    .line 142
    .line 143
    invoke-interface {p1}, Ln61;->a()Ljava/lang/Boolean;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    if-eqz p1, :cond_9

    .line 148
    .line 149
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 150
    .line 151
    .line 152
    move-result v3

    .line 153
    :cond_9
    :goto_4
    if-nez v3, :cond_a

    .line 154
    .line 155
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 156
    .line 157
    return-object p0

    .line 158
    :cond_a
    iget-object p0, p0, Ld51;->c:Ll51;

    .line 159
    .line 160
    invoke-virtual {p0}, Ll51;->a()D

    .line 161
    .line 162
    .line 163
    move-result-wide p0

    .line 164
    sget-wide v0, Ld51;->f:D

    .line 165
    .line 166
    cmpg-double p0, v0, p0

    .line 167
    .line 168
    if-gtz p0, :cond_b

    .line 169
    .line 170
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 171
    .line 172
    return-object p0

    .line 173
    :cond_b
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 174
    .line 175
    return-object p0

    .line 176
    :cond_c
    :goto_5
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 177
    .line 178
    return-object p0
.end method
