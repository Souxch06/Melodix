.class public final Lnq1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lvq1;


# static fields
.field public static final k:[I

.field public static final l:Lsun/misc/Unsafe;


# instance fields
.field public final a:[I

.field public final b:[Ljava/lang/Object;

.field public final c:I

.field public final d:I

.field public final e:Lqo1;

.field public final f:Z

.field public final g:[I

.field public final h:I

.field public final i:I

.field public final j:Ltb0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    sput-object v0, Lnq1;->k:[I

    .line 5
    .line 6
    invoke-static {}, Ler1;->k()Lsun/misc/Unsafe;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lnq1;->l:Lsun/misc/Unsafe;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>([I[Ljava/lang/Object;IILqo1;[IIILtb0;Lmz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lnq1;->a:[I

    .line 5
    .line 6
    iput-object p2, p0, Lnq1;->b:[Ljava/lang/Object;

    .line 7
    .line 8
    iput p3, p0, Lnq1;->c:I

    .line 9
    .line 10
    iput p4, p0, Lnq1;->d:I

    .line 11
    .line 12
    instance-of p1, p5, Lnp1;

    .line 13
    .line 14
    iput-boolean p1, p0, Lnq1;->f:Z

    .line 15
    .line 16
    iput-object p6, p0, Lnq1;->g:[I

    .line 17
    .line 18
    iput p7, p0, Lnq1;->h:I

    .line 19
    .line 20
    iput p8, p0, Lnq1;->i:I

    .line 21
    .line 22
    iput-object p9, p0, Lnq1;->j:Ltb0;

    .line 23
    .line 24
    iput-object p5, p0, Lnq1;->e:Lqo1;

    .line 25
    .line 26
    return-void
.end method

.method public static l(I)I
    .locals 0

    .line 1
    ushr-int/lit8 p0, p0, 0x14

    .line 2
    .line 3
    and-int/lit16 p0, p0, 0xff

    .line 4
    .line 5
    return p0
.end method

.method public static m(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p0, Lnp1;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    check-cast p0, Lnp1;

    .line 10
    .line 11
    invoke-virtual {p0}, Lnp1;->e()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_1
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public static n(Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lnq1;->m(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string v0, "Mutating immutable message: "

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static o(JLjava/lang/Object;)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static p(JLjava/lang/Object;)J
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Long;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method public static final x([BIILhr1;Ljava/lang/Class;Lto1;)I
    .locals 6

    .line 1
    sget-object v0, Lhr1;->l:Lhr1;

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    packed-switch p3, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    :pswitch_0
    new-instance p0, Ljava/lang/RuntimeException;

    .line 11
    .line 12
    const-string p1, "unsupported field type."

    .line 13
    .line 14
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    throw p0

    .line 18
    :pswitch_1
    invoke-static {p0, p1, p5}, Les0;->r([BILto1;)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    iget-wide p1, p5, Lto1;->b:J

    .line 23
    .line 24
    invoke-static {p1, p2}, Lap1;->k(J)J

    .line 25
    .line 26
    .line 27
    move-result-wide p1

    .line 28
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p5, Lto1;->c:Ljava/lang/Object;

    .line 33
    .line 34
    return p0

    .line 35
    :pswitch_2
    invoke-static {p0, p1, p5}, Les0;->o([BILto1;)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    iget p1, p5, Lto1;->a:I

    .line 40
    .line 41
    invoke-static {p1}, Lap1;->j(I)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p5, Lto1;->c:Ljava/lang/Object;

    .line 50
    .line 51
    return p0

    .line 52
    :pswitch_3
    invoke-static {p0, p1, p5}, Les0;->v([BILto1;)I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    return p0

    .line 57
    :pswitch_4
    sget-object p3, Lsq1;->c:Lsq1;

    .line 58
    .line 59
    invoke-virtual {p3, p4}, Lsq1;->a(Ljava/lang/Class;)Lvq1;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-interface {v1}, Lvq1;->a()Lnp1;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    move-object v2, p0

    .line 68
    move v3, p1

    .line 69
    move v4, p2

    .line 70
    move-object v5, p5

    .line 71
    invoke-static/range {v0 .. v5}, Les0;->w(Ljava/lang/Object;Lvq1;[BIILto1;)I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    invoke-interface {v1, v0}, Lvq1;->i(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    iput-object v0, v5, Lto1;->c:Ljava/lang/Object;

    .line 79
    .line 80
    return p0

    .line 81
    :pswitch_5
    move-object v2, p0

    .line 82
    move v3, p1

    .line 83
    move-object v5, p5

    .line 84
    invoke-static {v2, v3, v5}, Les0;->u([BILto1;)I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    return p0

    .line 89
    :pswitch_6
    move-object v2, p0

    .line 90
    move v3, p1

    .line 91
    move-object v5, p5

    .line 92
    invoke-static {v2, v3, v5}, Les0;->r([BILto1;)I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    iget-wide p1, v5, Lto1;->b:J

    .line 97
    .line 98
    const-wide/16 p3, 0x0

    .line 99
    .line 100
    cmp-long p1, p1, p3

    .line 101
    .line 102
    if-eqz p1, :cond_0

    .line 103
    .line 104
    const/4 p1, 0x1

    .line 105
    goto :goto_0

    .line 106
    :cond_0
    const/4 p1, 0x0

    .line 107
    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iput-object p1, v5, Lto1;->c:Ljava/lang/Object;

    .line 112
    .line 113
    return p0

    .line 114
    :pswitch_7
    move-object v2, p0

    .line 115
    move v3, p1

    .line 116
    move-object v5, p5

    .line 117
    add-int/lit8 p1, v3, 0x4

    .line 118
    .line 119
    invoke-static {v3, v2}, Les0;->s(I[B)I

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    iput-object p0, v5, Lto1;->c:Ljava/lang/Object;

    .line 128
    .line 129
    return p1

    .line 130
    :pswitch_8
    move-object v2, p0

    .line 131
    move v3, p1

    .line 132
    move-object v5, p5

    .line 133
    add-int/lit8 p1, v3, 0x8

    .line 134
    .line 135
    invoke-static {v3, v2}, Les0;->t(I[B)J

    .line 136
    .line 137
    .line 138
    move-result-wide p2

    .line 139
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    iput-object p0, v5, Lto1;->c:Ljava/lang/Object;

    .line 144
    .line 145
    return p1

    .line 146
    :pswitch_9
    move-object v2, p0

    .line 147
    move v3, p1

    .line 148
    move-object v5, p5

    .line 149
    invoke-static {v2, v3, v5}, Les0;->o([BILto1;)I

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    iget p1, v5, Lto1;->a:I

    .line 154
    .line 155
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    iput-object p1, v5, Lto1;->c:Ljava/lang/Object;

    .line 160
    .line 161
    return p0

    .line 162
    :pswitch_a
    move-object v2, p0

    .line 163
    move v3, p1

    .line 164
    move-object v5, p5

    .line 165
    invoke-static {v2, v3, v5}, Les0;->r([BILto1;)I

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    iget-wide p1, v5, Lto1;->b:J

    .line 170
    .line 171
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    iput-object p1, v5, Lto1;->c:Ljava/lang/Object;

    .line 176
    .line 177
    return p0

    .line 178
    :pswitch_b
    move-object v2, p0

    .line 179
    move v3, p1

    .line 180
    move-object v5, p5

    .line 181
    add-int/lit8 p1, v3, 0x4

    .line 182
    .line 183
    invoke-static {v3, v2}, Les0;->s(I[B)I

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    invoke-static {p0}, Ljava/lang/Float;->intBitsToFloat(I)F

    .line 188
    .line 189
    .line 190
    move-result p0

    .line 191
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    iput-object p0, v5, Lto1;->c:Ljava/lang/Object;

    .line 196
    .line 197
    return p1

    .line 198
    :pswitch_c
    move-object v2, p0

    .line 199
    move v3, p1

    .line 200
    move-object v5, p5

    .line 201
    add-int/lit8 p1, v3, 0x8

    .line 202
    .line 203
    invoke-static {v3, v2}, Les0;->t(I[B)J

    .line 204
    .line 205
    .line 206
    move-result-wide p2

    .line 207
    invoke-static {p2, p3}, Ljava/lang/Double;->longBitsToDouble(J)D

    .line 208
    .line 209
    .line 210
    move-result-wide p2

    .line 211
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    iput-object p0, v5, Lto1;->c:Ljava/lang/Object;

    .line 216
    .line 217
    return p1

    .line 218
    nop

    .line 219
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_8
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static z(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 6

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    move-exception v0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    array-length v2, v1

    .line 12
    const/4 v3, 0x0

    .line 13
    :goto_0
    if-ge v3, v2, :cond_1

    .line 14
    .line 15
    aget-object v4, v1, v3

    .line 16
    .line 17
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    if-eqz v5, :cond_0

    .line 26
    .line 27
    return-object v4

    .line 28
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    add-int/lit8 v2, v2, 0xb

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    add-int/2addr v2, v3

    .line 58
    add-int/lit8 v2, v2, 0x1d

    .line 59
    .line 60
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    new-instance v4, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    add-int/2addr v2, v3

    .line 67
    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 68
    .line 69
    .line 70
    const-string v2, "Field "

    .line 71
    .line 72
    const-string v3, " for "

    .line 73
    .line 74
    invoke-static {v4, v2, p1, v3, p0}, Loq;->r(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    const-string p0, " not found. Known fields are "

    .line 78
    .line 79
    invoke-static {v4, p0, v1}, Loq;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-static {p0, v0}, Lo40;->p(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 84
    .line 85
    .line 86
    const/4 p0, 0x0

    .line 87
    return-object p0
.end method


# virtual methods
.method public final A(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 5

    .line 1
    invoke-virtual {p0, p2, p3}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p2}, Lnq1;->k(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const v1, 0xfffff

    .line 13
    .line 14
    .line 15
    and-int/2addr v0, v1

    .line 16
    int-to-long v0, v0

    .line 17
    sget-object v2, Lnq1;->l:Lsun/misc/Unsafe;

    .line 18
    .line 19
    invoke-virtual {v2, p3, v0, v1}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    if-eqz v3, :cond_4

    .line 24
    .line 25
    invoke-virtual {p0, p2}, Lnq1;->C(I)Lvq1;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    invoke-virtual {p0, p2, p1}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-nez v4, :cond_2

    .line 34
    .line 35
    invoke-static {v3}, Lnq1;->m(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-nez v4, :cond_1

    .line 40
    .line 41
    invoke-virtual {v2, p1, v0, v1, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-interface {p3}, Lvq1;->a()Lnp1;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-interface {p3, v4, v3}, Lvq1;->e(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, p1, v0, v1, v4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :goto_0
    invoke-virtual {p0, p2, p1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    invoke-virtual {v2, p1, v0, v1}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0}, Lnq1;->m(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-nez p2, :cond_3

    .line 68
    .line 69
    invoke-interface {p3}, Lvq1;->a()Lnp1;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-interface {p3, p2, p0}, Lvq1;->e(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2, p1, v0, v1, p2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    move-object p0, p2

    .line 80
    :cond_3
    invoke-interface {p3, p0, v3}, Lvq1;->e(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 85
    .line 86
    iget-object p0, p0, Lnq1;->a:[I

    .line 87
    .line 88
    aget p0, p0, p2

    .line 89
    .line 90
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p3

    .line 98
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 99
    .line 100
    .line 101
    move-result p3

    .line 102
    add-int/lit8 p3, p3, 0x26

    .line 103
    .line 104
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    add-int/2addr p3, v0

    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {v0, p3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 112
    .line 113
    .line 114
    const-string p3, "Source subfield "

    .line 115
    .line 116
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string p0, " is present but null: "

    .line 123
    .line 124
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    throw p1
.end method

.method public final B(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lnq1;->a:[I

    .line 2
    .line 3
    aget v1, v0, p2

    .line 4
    .line 5
    invoke-virtual {p0, v1, p3, p2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0, p2}, Lnq1;->k(I)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const v3, 0xfffff

    .line 17
    .line 18
    .line 19
    and-int/2addr v2, v3

    .line 20
    int-to-long v2, v2

    .line 21
    sget-object v4, Lnq1;->l:Lsun/misc/Unsafe;

    .line 22
    .line 23
    invoke-virtual {v4, p3, v2, v3}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    if-eqz v5, :cond_4

    .line 28
    .line 29
    invoke-virtual {p0, p2}, Lnq1;->C(I)Lvq1;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    invoke-virtual {p0, v1, p1, p2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_2

    .line 38
    .line 39
    invoke-static {v5}, Lnq1;->m(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    invoke-virtual {v4, p1, v2, v3, v5}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-interface {p3}, Lvq1;->a()Lnp1;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-interface {p3, v0, v5}, Lvq1;->e(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v4, p1, v2, v3, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    :goto_0
    invoke-virtual {p0, v1, p1, p2}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    invoke-virtual {v4, p1, v2, v3}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0}, Lnq1;->m(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-nez p2, :cond_3

    .line 72
    .line 73
    invoke-interface {p3}, Lvq1;->a()Lnp1;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-interface {p3, p2, p0}, Lvq1;->e(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v4, p1, v2, v3, p2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    move-object p0, p2

    .line 84
    :cond_3
    invoke-interface {p3, p0, v5}, Lvq1;->e(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_4
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 89
    .line 90
    aget p1, v0, p2

    .line 91
    .line 92
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p3

    .line 100
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 101
    .line 102
    .line 103
    move-result p3

    .line 104
    add-int/lit8 p3, p3, 0x26

    .line 105
    .line 106
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    add-int/2addr p3, v0

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v0, p3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 114
    .line 115
    .line 116
    const-string p3, "Source subfield "

    .line 117
    .line 118
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string p1, " is present but null: "

    .line 125
    .line 126
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    throw p0
.end method

.method public final C(I)Lvq1;
    .locals 2

    .line 1
    div-int/lit8 p1, p1, 0x3

    .line 2
    .line 3
    add-int/2addr p1, p1

    .line 4
    iget-object p0, p0, Lnq1;->b:[Ljava/lang/Object;

    .line 5
    .line 6
    aget-object v0, p0, p1

    .line 7
    .line 8
    check-cast v0, Lvq1;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    add-int/lit8 v0, p1, 0x1

    .line 14
    .line 15
    sget-object v1, Lsq1;->c:Lsq1;

    .line 16
    .line 17
    aget-object v0, p0, v0

    .line 18
    .line 19
    check-cast v0, Ljava/lang/Class;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Lsq1;->a(Ljava/lang/Class;)Lvq1;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    aput-object v0, p0, p1

    .line 26
    .line 27
    return-object v0
.end method

.method public final D(I)Ljava/lang/Object;
    .locals 0

    .line 1
    div-int/lit8 p1, p1, 0x3

    .line 2
    .line 3
    iget-object p0, p0, Lnq1;->b:[Ljava/lang/Object;

    .line 4
    .line 5
    add-int/2addr p1, p1

    .line 6
    aget-object p0, p0, p1

    .line 7
    .line 8
    return-object p0
.end method

.method public final E(I)Llo1;
    .locals 0

    .line 1
    div-int/lit8 p1, p1, 0x3

    .line 2
    .line 3
    add-int/2addr p1, p1

    .line 4
    add-int/lit8 p1, p1, 0x1

    .line 5
    .line 6
    iget-object p0, p0, Lnq1;->b:[Ljava/lang/Object;

    .line 7
    .line 8
    aget-object p0, p0, p1

    .line 9
    .line 10
    check-cast p0, Llo1;

    .line 11
    .line 12
    return-object p0
.end method

.method public final F(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lnq1;->C(I)Lvq1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, p1}, Lnq1;->k(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const v2, 0xfffff

    .line 10
    .line 11
    .line 12
    and-int/2addr v1, v2

    .line 13
    invoke-virtual {p0, p1, p2}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    invoke-interface {v0}, Lvq1;->a()Lnp1;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    int-to-long p0, v1

    .line 25
    sget-object v1, Lnq1;->l:Lsun/misc/Unsafe;

    .line 26
    .line 27
    invoke-virtual {v1, p2, p0, p1}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Lnq1;->m(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_1
    invoke-interface {v0}, Lvq1;->a()Lnp1;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    invoke-interface {v0, p1, p0}, Lvq1;->e(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-object p1
.end method

.method public final G(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p2}, Lnq1;->k(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0xfffff

    .line 6
    .line 7
    .line 8
    and-int/2addr v0, v1

    .line 9
    int-to-long v0, v0

    .line 10
    sget-object v2, Lnq1;->l:Lsun/misc/Unsafe;

    .line 11
    .line 12
    invoke-virtual {v2, p1, v0, v1, p3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p2, p1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final H(ILjava/lang/Object;I)Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-virtual {p0, p3}, Lnq1;->C(I)Lvq1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    invoke-interface {v0}, Lvq1;->a()Lnp1;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-virtual {p0, p3}, Lnq1;->k(I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const p1, 0xfffff

    .line 21
    .line 22
    .line 23
    and-int/2addr p0, p1

    .line 24
    int-to-long p0, p0

    .line 25
    sget-object p3, Lnq1;->l:Lsun/misc/Unsafe;

    .line 26
    .line 27
    invoke-virtual {p3, p2, p0, p1}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Lnq1;->m(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_1
    invoke-interface {v0}, Lvq1;->a()Lnp1;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    invoke-interface {v0, p1, p0}, Lvq1;->e(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-object p1
.end method

.method public final I(Ljava/lang/Object;IILjava/lang/Object;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p3}, Lnq1;->k(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0xfffff

    .line 6
    .line 7
    .line 8
    and-int/2addr v0, v1

    .line 9
    int-to-long v0, v0

    .line 10
    sget-object v2, Lnq1;->l:Lsun/misc/Unsafe;

    .line 11
    .line 12
    invoke-virtual {v2, p1, v0, v1, p4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p2, p1, p3}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final J(Ljava/lang/Object;ILjava/lang/Object;Ltb0;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object v0, p0, Lnq1;->a:[I

    .line 2
    .line 3
    aget v0, v0, p2

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Lnq1;->k(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const v2, 0xfffff

    .line 10
    .line 11
    .line 12
    and-int/2addr v1, v2

    .line 13
    int-to-long v1, v1

    .line 14
    invoke-static {v1, v2, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {p0, p2}, Lnq1;->E(I)Llo1;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    :goto_0
    return-object p3

    .line 28
    :cond_1
    check-cast p1, Lfq1;

    .line 29
    .line 30
    invoke-virtual {p0, p2}, Lnq1;->D(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Leq1;

    .line 35
    .line 36
    iget-object p0, p0, Leq1;->a:Lc9;

    .line 37
    .line 38
    invoke-virtual {p1}, Lfq1;->entrySet()Ljava/util/Set;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    if-eqz p2, :cond_6

    .line 51
    .line 52
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    check-cast p2, Ljava/util/Map$Entry;

    .line 57
    .line 58
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Ljava/lang/Integer;

    .line 63
    .line 64
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    invoke-virtual {v1, v2}, Llo1;->a(I)Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-nez v2, :cond_2

    .line 73
    .line 74
    if-nez p3, :cond_3

    .line 75
    .line 76
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    .line 78
    .line 79
    invoke-static {p5}, Ltb0;->n(Ljava/lang/Object;)Lcr1;

    .line 80
    .line 81
    .line 82
    move-result-object p3

    .line 83
    :cond_3
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-static {p0, v2, v3}, Leq1;->b(Lc9;Ljava/lang/Object;Ljava/lang/Object;)I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    sget-object v3, Lxo1;->k:Lwo1;

    .line 96
    .line 97
    new-array v3, v2, [B

    .line 98
    .line 99
    sget-boolean v4, Lfp1;->b:Z

    .line 100
    .line 101
    new-instance v4, Lbp1;

    .line 102
    .line 103
    invoke-direct {v4, v2, v3}, Lbp1;-><init>(I[B)V

    .line 104
    .line 105
    .line 106
    :try_start_0
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    invoke-static {v4, p0, v2, p2}, Leq1;->a(Lfp1;Lc9;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    .line 116
    .line 117
    invoke-virtual {v4}, Lbp1;->x()I

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    const/4 v2, 0x0

    .line 122
    if-gtz p2, :cond_5

    .line 123
    .line 124
    invoke-virtual {v4}, Lbp1;->x()I

    .line 125
    .line 126
    .line 127
    move-result p2

    .line 128
    if-ltz p2, :cond_4

    .line 129
    .line 130
    new-instance p2, Lwo1;

    .line 131
    .line 132
    invoke-direct {p2, v3}, Lwo1;-><init>([B)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 136
    .line 137
    .line 138
    shl-int/lit8 v2, v0, 0x3

    .line 139
    .line 140
    move-object v3, p3

    .line 141
    check-cast v3, Lcr1;

    .line 142
    .line 143
    or-int/lit8 v2, v2, 0x2

    .line 144
    .line 145
    invoke-virtual {v3, v2, p2}, Lcr1;->d(ILjava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    .line 149
    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_4
    const-string p0, "Wrote more data than expected."

    .line 153
    .line 154
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    return-object v2

    .line 158
    :cond_5
    const-string p0, "Did not write as much data as expected."

    .line 159
    .line 160
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    return-object v2

    .line 164
    :catch_0
    move-exception p0

    .line 165
    new-instance p1, Ljava/lang/RuntimeException;

    .line 166
    .line 167
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 168
    .line 169
    .line 170
    throw p1

    .line 171
    :cond_6
    return-object p3
.end method

.method public final K(ILwk;Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget-object v0, p2, Lwk;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lap1;

    .line 4
    .line 5
    const/high16 v1, 0x20000000

    .line 6
    .line 7
    and-int/2addr v1, p1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v1, 0x0

    .line 13
    :goto_0
    const v2, 0xfffff

    .line 14
    .line 15
    .line 16
    and-int/2addr p1, v2

    .line 17
    int-to-long v2, p1

    .line 18
    const/4 p1, 0x2

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p2, p1}, Lwk;->Q(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Lap1;->x()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p3, v2, v3, p0}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-boolean p0, p0, Lnq1;->f:Z

    .line 33
    .line 34
    if-eqz p0, :cond_2

    .line 35
    .line 36
    invoke-virtual {p2, p1}, Lwk;->Q(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Lap1;->w()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p3, v2, v3, p0}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    invoke-virtual {p2}, Lwk;->Y()Lxo1;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p3, v2, v3, p0}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final a()Lnp1;
    .locals 0

    .line 1
    iget-object p0, p0, Lnq1;->e:Lqo1;

    .line 2
    .line 3
    check-cast p0, Lnp1;

    .line 4
    .line 5
    invoke-virtual {p0}, Lnp1;->g()Lnp1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final b(Ljava/lang/Object;Lmd1;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v6, p2

    .line 6
    .line 7
    iget-object v2, v6, Lmd1;->k:Ljava/lang/Object;

    .line 8
    .line 9
    move-object v7, v2

    .line 10
    check-cast v7, Lfp1;

    .line 11
    .line 12
    const v9, 0xfffff

    .line 13
    .line 14
    .line 15
    move v3, v9

    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v4, 0x0

    .line 18
    :goto_0
    iget-object v5, v0, Lnq1;->a:[I

    .line 19
    .line 20
    array-length v10, v5

    .line 21
    if-ge v2, v10, :cond_7

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Lnq1;->k(I)I

    .line 24
    .line 25
    .line 26
    move-result v10

    .line 27
    invoke-static {v10}, Lnq1;->l(I)I

    .line 28
    .line 29
    .line 30
    move-result v11

    .line 31
    aget v12, v5, v2

    .line 32
    .line 33
    const/16 v13, 0x11

    .line 34
    .line 35
    const/4 v14, 0x1

    .line 36
    sget-object v15, Lnq1;->l:Lsun/misc/Unsafe;

    .line 37
    .line 38
    if-gt v11, v13, :cond_2

    .line 39
    .line 40
    add-int/lit8 v13, v2, 0x2

    .line 41
    .line 42
    aget v13, v5, v13

    .line 43
    .line 44
    and-int v8, v13, v9

    .line 45
    .line 46
    if-eq v8, v3, :cond_1

    .line 47
    .line 48
    if-ne v8, v9, :cond_0

    .line 49
    .line 50
    const/4 v4, 0x0

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    int-to-long v3, v8

    .line 53
    invoke-virtual {v15, v1, v3, v4}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    move v4, v3

    .line 58
    :goto_1
    move v3, v8

    .line 59
    :cond_1
    ushr-int/lit8 v8, v13, 0x14

    .line 60
    .line 61
    shl-int v8, v14, v8

    .line 62
    .line 63
    move/from16 v17, v8

    .line 64
    .line 65
    move-object v8, v5

    .line 66
    move/from16 v5, v17

    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_2
    move-object v8, v5

    .line 70
    const/4 v5, 0x0

    .line 71
    :goto_2
    and-int/2addr v10, v9

    .line 72
    int-to-long v9, v10

    .line 73
    const/16 v16, 0x3f

    .line 74
    .line 75
    const/4 v13, 0x4

    .line 76
    const/4 v14, 0x3

    .line 77
    packed-switch v11, :pswitch_data_0

    .line 78
    .line 79
    .line 80
    :cond_3
    :goto_3
    const/4 v11, 0x0

    .line 81
    goto/16 :goto_9

    .line 82
    .line 83
    :pswitch_0
    invoke-virtual {v0, v12, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    if-eqz v5, :cond_3

    .line 88
    .line 89
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    invoke-virtual {v0, v2}, Lnq1;->C(I)Lvq1;

    .line 94
    .line 95
    .line 96
    move-result-object v8

    .line 97
    check-cast v5, Lqo1;

    .line 98
    .line 99
    invoke-virtual {v7, v12, v14}, Lfp1;->d(II)V

    .line 100
    .line 101
    .line 102
    invoke-interface {v8, v5, v6}, Lvq1;->b(Ljava/lang/Object;Lmd1;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v7, v12, v13}, Lfp1;->d(II)V

    .line 106
    .line 107
    .line 108
    goto :goto_3

    .line 109
    :pswitch_1
    invoke-virtual {v0, v12, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 110
    .line 111
    .line 112
    move-result v5

    .line 113
    if-eqz v5, :cond_3

    .line 114
    .line 115
    invoke-static {v9, v10, v1}, Lnq1;->p(JLjava/lang/Object;)J

    .line 116
    .line 117
    .line 118
    move-result-wide v8

    .line 119
    add-long v10, v8, v8

    .line 120
    .line 121
    shr-long v8, v8, v16

    .line 122
    .line 123
    xor-long/2addr v8, v10

    .line 124
    invoke-virtual {v7, v12, v8, v9}, Lfp1;->h(IJ)V

    .line 125
    .line 126
    .line 127
    goto :goto_3

    .line 128
    :pswitch_2
    invoke-virtual {v0, v12, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 129
    .line 130
    .line 131
    move-result v5

    .line 132
    if-eqz v5, :cond_3

    .line 133
    .line 134
    invoke-static {v9, v10, v1}, Lnq1;->o(JLjava/lang/Object;)I

    .line 135
    .line 136
    .line 137
    move-result v5

    .line 138
    add-int v8, v5, v5

    .line 139
    .line 140
    shr-int/lit8 v5, v5, 0x1f

    .line 141
    .line 142
    xor-int/2addr v5, v8

    .line 143
    invoke-virtual {v7, v12, v5}, Lfp1;->f(II)V

    .line 144
    .line 145
    .line 146
    goto :goto_3

    .line 147
    :pswitch_3
    invoke-virtual {v0, v12, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 148
    .line 149
    .line 150
    move-result v5

    .line 151
    if-eqz v5, :cond_3

    .line 152
    .line 153
    invoke-static {v9, v10, v1}, Lnq1;->p(JLjava/lang/Object;)J

    .line 154
    .line 155
    .line 156
    move-result-wide v8

    .line 157
    invoke-virtual {v7, v12, v8, v9}, Lfp1;->i(IJ)V

    .line 158
    .line 159
    .line 160
    goto :goto_3

    .line 161
    :pswitch_4
    invoke-virtual {v0, v12, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 162
    .line 163
    .line 164
    move-result v5

    .line 165
    if-eqz v5, :cond_3

    .line 166
    .line 167
    invoke-static {v9, v10, v1}, Lnq1;->o(JLjava/lang/Object;)I

    .line 168
    .line 169
    .line 170
    move-result v5

    .line 171
    invoke-virtual {v7, v12, v5}, Lfp1;->g(II)V

    .line 172
    .line 173
    .line 174
    goto :goto_3

    .line 175
    :pswitch_5
    invoke-virtual {v0, v12, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 176
    .line 177
    .line 178
    move-result v5

    .line 179
    if-eqz v5, :cond_3

    .line 180
    .line 181
    invoke-static {v9, v10, v1}, Lnq1;->o(JLjava/lang/Object;)I

    .line 182
    .line 183
    .line 184
    move-result v5

    .line 185
    invoke-virtual {v7, v12, v5}, Lfp1;->e(II)V

    .line 186
    .line 187
    .line 188
    goto :goto_3

    .line 189
    :pswitch_6
    invoke-virtual {v0, v12, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 190
    .line 191
    .line 192
    move-result v5

    .line 193
    if-eqz v5, :cond_3

    .line 194
    .line 195
    invoke-static {v9, v10, v1}, Lnq1;->o(JLjava/lang/Object;)I

    .line 196
    .line 197
    .line 198
    move-result v5

    .line 199
    invoke-virtual {v7, v12, v5}, Lfp1;->f(II)V

    .line 200
    .line 201
    .line 202
    goto :goto_3

    .line 203
    :pswitch_7
    invoke-virtual {v0, v12, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 204
    .line 205
    .line 206
    move-result v5

    .line 207
    if-eqz v5, :cond_3

    .line 208
    .line 209
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v5

    .line 213
    check-cast v5, Lxo1;

    .line 214
    .line 215
    invoke-virtual {v7, v12, v5}, Lfp1;->l(ILxo1;)V

    .line 216
    .line 217
    .line 218
    goto/16 :goto_3

    .line 219
    .line 220
    :pswitch_8
    invoke-virtual {v0, v12, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 221
    .line 222
    .line 223
    move-result v5

    .line 224
    if-eqz v5, :cond_3

    .line 225
    .line 226
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object v5

    .line 230
    invoke-virtual {v0, v2}, Lnq1;->C(I)Lvq1;

    .line 231
    .line 232
    .line 233
    move-result-object v8

    .line 234
    invoke-virtual {v6, v12, v5, v8}, Lmd1;->m(ILjava/lang/Object;Lvq1;)V

    .line 235
    .line 236
    .line 237
    goto/16 :goto_3

    .line 238
    .line 239
    :pswitch_9
    invoke-virtual {v0, v12, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 240
    .line 241
    .line 242
    move-result v5

    .line 243
    if-eqz v5, :cond_3

    .line 244
    .line 245
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    move-result-object v5

    .line 249
    instance-of v8, v5, Ljava/lang/String;

    .line 250
    .line 251
    if-eqz v8, :cond_4

    .line 252
    .line 253
    check-cast v5, Ljava/lang/String;

    .line 254
    .line 255
    invoke-virtual {v7, v12, v5}, Lfp1;->k(ILjava/lang/String;)V

    .line 256
    .line 257
    .line 258
    goto/16 :goto_3

    .line 259
    .line 260
    :cond_4
    check-cast v5, Lxo1;

    .line 261
    .line 262
    invoke-virtual {v7, v12, v5}, Lfp1;->l(ILxo1;)V

    .line 263
    .line 264
    .line 265
    goto/16 :goto_3

    .line 266
    .line 267
    :pswitch_a
    invoke-virtual {v0, v12, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 268
    .line 269
    .line 270
    move-result v5

    .line 271
    if-eqz v5, :cond_3

    .line 272
    .line 273
    invoke-static {v9, v10, v1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object v5

    .line 277
    check-cast v5, Ljava/lang/Boolean;

    .line 278
    .line 279
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 280
    .line 281
    .line 282
    move-result v5

    .line 283
    invoke-virtual {v7, v12, v5}, Lfp1;->j(IZ)V

    .line 284
    .line 285
    .line 286
    goto/16 :goto_3

    .line 287
    .line 288
    :pswitch_b
    invoke-virtual {v0, v12, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 289
    .line 290
    .line 291
    move-result v5

    .line 292
    if-eqz v5, :cond_3

    .line 293
    .line 294
    invoke-static {v9, v10, v1}, Lnq1;->o(JLjava/lang/Object;)I

    .line 295
    .line 296
    .line 297
    move-result v5

    .line 298
    invoke-virtual {v7, v12, v5}, Lfp1;->g(II)V

    .line 299
    .line 300
    .line 301
    goto/16 :goto_3

    .line 302
    .line 303
    :pswitch_c
    invoke-virtual {v0, v12, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 304
    .line 305
    .line 306
    move-result v5

    .line 307
    if-eqz v5, :cond_3

    .line 308
    .line 309
    invoke-static {v9, v10, v1}, Lnq1;->p(JLjava/lang/Object;)J

    .line 310
    .line 311
    .line 312
    move-result-wide v8

    .line 313
    invoke-virtual {v7, v12, v8, v9}, Lfp1;->i(IJ)V

    .line 314
    .line 315
    .line 316
    goto/16 :goto_3

    .line 317
    .line 318
    :pswitch_d
    invoke-virtual {v0, v12, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 319
    .line 320
    .line 321
    move-result v5

    .line 322
    if-eqz v5, :cond_3

    .line 323
    .line 324
    invoke-static {v9, v10, v1}, Lnq1;->o(JLjava/lang/Object;)I

    .line 325
    .line 326
    .line 327
    move-result v5

    .line 328
    invoke-virtual {v7, v12, v5}, Lfp1;->e(II)V

    .line 329
    .line 330
    .line 331
    goto/16 :goto_3

    .line 332
    .line 333
    :pswitch_e
    invoke-virtual {v0, v12, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 334
    .line 335
    .line 336
    move-result v5

    .line 337
    if-eqz v5, :cond_3

    .line 338
    .line 339
    invoke-static {v9, v10, v1}, Lnq1;->p(JLjava/lang/Object;)J

    .line 340
    .line 341
    .line 342
    move-result-wide v8

    .line 343
    invoke-virtual {v7, v12, v8, v9}, Lfp1;->h(IJ)V

    .line 344
    .line 345
    .line 346
    goto/16 :goto_3

    .line 347
    .line 348
    :pswitch_f
    invoke-virtual {v0, v12, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 349
    .line 350
    .line 351
    move-result v5

    .line 352
    if-eqz v5, :cond_3

    .line 353
    .line 354
    invoke-static {v9, v10, v1}, Lnq1;->p(JLjava/lang/Object;)J

    .line 355
    .line 356
    .line 357
    move-result-wide v8

    .line 358
    invoke-virtual {v7, v12, v8, v9}, Lfp1;->h(IJ)V

    .line 359
    .line 360
    .line 361
    goto/16 :goto_3

    .line 362
    .line 363
    :pswitch_10
    invoke-virtual {v0, v12, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 364
    .line 365
    .line 366
    move-result v5

    .line 367
    if-eqz v5, :cond_3

    .line 368
    .line 369
    invoke-static {v9, v10, v1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 370
    .line 371
    .line 372
    move-result-object v5

    .line 373
    check-cast v5, Ljava/lang/Float;

    .line 374
    .line 375
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 376
    .line 377
    .line 378
    move-result v5

    .line 379
    invoke-static {v5}, Ljava/lang/Float;->floatToRawIntBits(F)I

    .line 380
    .line 381
    .line 382
    move-result v5

    .line 383
    invoke-virtual {v7, v12, v5}, Lfp1;->g(II)V

    .line 384
    .line 385
    .line 386
    goto/16 :goto_3

    .line 387
    .line 388
    :pswitch_11
    invoke-virtual {v0, v12, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 389
    .line 390
    .line 391
    move-result v5

    .line 392
    if-eqz v5, :cond_3

    .line 393
    .line 394
    invoke-static {v9, v10, v1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 395
    .line 396
    .line 397
    move-result-object v5

    .line 398
    check-cast v5, Ljava/lang/Double;

    .line 399
    .line 400
    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    .line 401
    .line 402
    .line 403
    move-result-wide v8

    .line 404
    invoke-static {v8, v9}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    .line 405
    .line 406
    .line 407
    move-result-wide v8

    .line 408
    invoke-virtual {v7, v12, v8, v9}, Lfp1;->i(IJ)V

    .line 409
    .line 410
    .line 411
    goto/16 :goto_3

    .line 412
    .line 413
    :pswitch_12
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 414
    .line 415
    .line 416
    move-result-object v5

    .line 417
    if-eqz v5, :cond_3

    .line 418
    .line 419
    invoke-virtual {v0, v2}, Lnq1;->D(I)Ljava/lang/Object;

    .line 420
    .line 421
    .line 422
    move-result-object v8

    .line 423
    check-cast v8, Leq1;

    .line 424
    .line 425
    iget-object v8, v8, Leq1;->a:Lc9;

    .line 426
    .line 427
    check-cast v5, Lfq1;

    .line 428
    .line 429
    invoke-virtual {v5}, Lfq1;->entrySet()Ljava/util/Set;

    .line 430
    .line 431
    .line 432
    move-result-object v5

    .line 433
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 434
    .line 435
    .line 436
    move-result-object v5

    .line 437
    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 438
    .line 439
    .line 440
    move-result v9

    .line 441
    if-eqz v9, :cond_3

    .line 442
    .line 443
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 444
    .line 445
    .line 446
    move-result-object v9

    .line 447
    check-cast v9, Ljava/util/Map$Entry;

    .line 448
    .line 449
    const/4 v10, 0x2

    .line 450
    invoke-virtual {v7, v12, v10}, Lfp1;->d(II)V

    .line 451
    .line 452
    .line 453
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 454
    .line 455
    .line 456
    move-result-object v10

    .line 457
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 458
    .line 459
    .line 460
    move-result-object v11

    .line 461
    invoke-static {v8, v10, v11}, Leq1;->b(Lc9;Ljava/lang/Object;Ljava/lang/Object;)I

    .line 462
    .line 463
    .line 464
    move-result v10

    .line 465
    invoke-virtual {v7, v10}, Lfp1;->r(I)V

    .line 466
    .line 467
    .line 468
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 469
    .line 470
    .line 471
    move-result-object v10

    .line 472
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 473
    .line 474
    .line 475
    move-result-object v9

    .line 476
    invoke-static {v7, v8, v10, v9}, Leq1;->a(Lfp1;Lc9;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 477
    .line 478
    .line 479
    goto :goto_4

    .line 480
    :pswitch_13
    aget v5, v8, v2

    .line 481
    .line 482
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 483
    .line 484
    .line 485
    move-result-object v8

    .line 486
    check-cast v8, Ljava/util/List;

    .line 487
    .line 488
    invoke-virtual {v0, v2}, Lnq1;->C(I)Lvq1;

    .line 489
    .line 490
    .line 491
    move-result-object v9

    .line 492
    sget-object v10, Lwq1;->a:Ltb0;

    .line 493
    .line 494
    if-eqz v8, :cond_3

    .line 495
    .line 496
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    .line 497
    .line 498
    .line 499
    move-result v10

    .line 500
    if-nez v10, :cond_3

    .line 501
    .line 502
    const/4 v10, 0x0

    .line 503
    :goto_5
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 504
    .line 505
    .line 506
    move-result v11

    .line 507
    if-ge v10, v11, :cond_3

    .line 508
    .line 509
    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 510
    .line 511
    .line 512
    move-result-object v11

    .line 513
    check-cast v11, Lqo1;

    .line 514
    .line 515
    invoke-virtual {v7, v5, v14}, Lfp1;->d(II)V

    .line 516
    .line 517
    .line 518
    invoke-interface {v9, v11, v6}, Lvq1;->b(Ljava/lang/Object;Lmd1;)V

    .line 519
    .line 520
    .line 521
    invoke-virtual {v7, v5, v13}, Lfp1;->d(II)V

    .line 522
    .line 523
    .line 524
    add-int/lit8 v10, v10, 0x1

    .line 525
    .line 526
    goto :goto_5

    .line 527
    :pswitch_14
    aget v5, v8, v2

    .line 528
    .line 529
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 530
    .line 531
    .line 532
    move-result-object v8

    .line 533
    check-cast v8, Ljava/util/List;

    .line 534
    .line 535
    const/4 v11, 0x1

    .line 536
    invoke-static {v5, v8, v6, v11}, Lwq1;->h(ILjava/util/List;Lmd1;Z)V

    .line 537
    .line 538
    .line 539
    goto/16 :goto_3

    .line 540
    .line 541
    :pswitch_15
    const/4 v11, 0x1

    .line 542
    aget v5, v8, v2

    .line 543
    .line 544
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 545
    .line 546
    .line 547
    move-result-object v8

    .line 548
    check-cast v8, Ljava/util/List;

    .line 549
    .line 550
    invoke-static {v5, v8, v6, v11}, Lwq1;->m(ILjava/util/List;Lmd1;Z)V

    .line 551
    .line 552
    .line 553
    goto/16 :goto_3

    .line 554
    .line 555
    :pswitch_16
    const/4 v11, 0x1

    .line 556
    aget v5, v8, v2

    .line 557
    .line 558
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 559
    .line 560
    .line 561
    move-result-object v8

    .line 562
    check-cast v8, Ljava/util/List;

    .line 563
    .line 564
    invoke-static {v5, v8, v6, v11}, Lwq1;->j(ILjava/util/List;Lmd1;Z)V

    .line 565
    .line 566
    .line 567
    goto/16 :goto_3

    .line 568
    .line 569
    :pswitch_17
    const/4 v11, 0x1

    .line 570
    aget v5, v8, v2

    .line 571
    .line 572
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 573
    .line 574
    .line 575
    move-result-object v8

    .line 576
    check-cast v8, Ljava/util/List;

    .line 577
    .line 578
    invoke-static {v5, v8, v6, v11}, Lwq1;->o(ILjava/util/List;Lmd1;Z)V

    .line 579
    .line 580
    .line 581
    goto/16 :goto_3

    .line 582
    .line 583
    :pswitch_18
    const/4 v11, 0x1

    .line 584
    aget v5, v8, v2

    .line 585
    .line 586
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 587
    .line 588
    .line 589
    move-result-object v8

    .line 590
    check-cast v8, Ljava/util/List;

    .line 591
    .line 592
    invoke-static {v5, v8, v6, v11}, Lwq1;->p(ILjava/util/List;Lmd1;Z)V

    .line 593
    .line 594
    .line 595
    goto/16 :goto_3

    .line 596
    .line 597
    :pswitch_19
    const/4 v11, 0x1

    .line 598
    aget v5, v8, v2

    .line 599
    .line 600
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 601
    .line 602
    .line 603
    move-result-object v8

    .line 604
    check-cast v8, Ljava/util/List;

    .line 605
    .line 606
    invoke-static {v5, v8, v6, v11}, Lwq1;->l(ILjava/util/List;Lmd1;Z)V

    .line 607
    .line 608
    .line 609
    goto/16 :goto_3

    .line 610
    .line 611
    :pswitch_1a
    const/4 v11, 0x1

    .line 612
    aget v5, v8, v2

    .line 613
    .line 614
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 615
    .line 616
    .line 617
    move-result-object v8

    .line 618
    check-cast v8, Ljava/util/List;

    .line 619
    .line 620
    invoke-static {v5, v8, v6, v11}, Lwq1;->q(ILjava/util/List;Lmd1;Z)V

    .line 621
    .line 622
    .line 623
    goto/16 :goto_3

    .line 624
    .line 625
    :pswitch_1b
    const/4 v11, 0x1

    .line 626
    aget v5, v8, v2

    .line 627
    .line 628
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 629
    .line 630
    .line 631
    move-result-object v8

    .line 632
    check-cast v8, Ljava/util/List;

    .line 633
    .line 634
    invoke-static {v5, v8, v6, v11}, Lwq1;->n(ILjava/util/List;Lmd1;Z)V

    .line 635
    .line 636
    .line 637
    goto/16 :goto_3

    .line 638
    .line 639
    :pswitch_1c
    const/4 v11, 0x1

    .line 640
    aget v5, v8, v2

    .line 641
    .line 642
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 643
    .line 644
    .line 645
    move-result-object v8

    .line 646
    check-cast v8, Ljava/util/List;

    .line 647
    .line 648
    invoke-static {v5, v8, v6, v11}, Lwq1;->i(ILjava/util/List;Lmd1;Z)V

    .line 649
    .line 650
    .line 651
    goto/16 :goto_3

    .line 652
    .line 653
    :pswitch_1d
    const/4 v11, 0x1

    .line 654
    aget v5, v8, v2

    .line 655
    .line 656
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 657
    .line 658
    .line 659
    move-result-object v8

    .line 660
    check-cast v8, Ljava/util/List;

    .line 661
    .line 662
    invoke-static {v5, v8, v6, v11}, Lwq1;->k(ILjava/util/List;Lmd1;Z)V

    .line 663
    .line 664
    .line 665
    goto/16 :goto_3

    .line 666
    .line 667
    :pswitch_1e
    const/4 v11, 0x1

    .line 668
    aget v5, v8, v2

    .line 669
    .line 670
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 671
    .line 672
    .line 673
    move-result-object v8

    .line 674
    check-cast v8, Ljava/util/List;

    .line 675
    .line 676
    invoke-static {v5, v8, v6, v11}, Lwq1;->g(ILjava/util/List;Lmd1;Z)V

    .line 677
    .line 678
    .line 679
    goto/16 :goto_3

    .line 680
    .line 681
    :pswitch_1f
    const/4 v11, 0x1

    .line 682
    aget v5, v8, v2

    .line 683
    .line 684
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 685
    .line 686
    .line 687
    move-result-object v8

    .line 688
    check-cast v8, Ljava/util/List;

    .line 689
    .line 690
    invoke-static {v5, v8, v6, v11}, Lwq1;->f(ILjava/util/List;Lmd1;Z)V

    .line 691
    .line 692
    .line 693
    goto/16 :goto_3

    .line 694
    .line 695
    :pswitch_20
    const/4 v11, 0x1

    .line 696
    aget v5, v8, v2

    .line 697
    .line 698
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 699
    .line 700
    .line 701
    move-result-object v8

    .line 702
    check-cast v8, Ljava/util/List;

    .line 703
    .line 704
    invoke-static {v5, v8, v6, v11}, Lwq1;->e(ILjava/util/List;Lmd1;Z)V

    .line 705
    .line 706
    .line 707
    goto/16 :goto_3

    .line 708
    .line 709
    :pswitch_21
    const/4 v11, 0x1

    .line 710
    aget v5, v8, v2

    .line 711
    .line 712
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 713
    .line 714
    .line 715
    move-result-object v8

    .line 716
    check-cast v8, Ljava/util/List;

    .line 717
    .line 718
    invoke-static {v5, v8, v6, v11}, Lwq1;->d(ILjava/util/List;Lmd1;Z)V

    .line 719
    .line 720
    .line 721
    goto/16 :goto_3

    .line 722
    .line 723
    :pswitch_22
    aget v5, v8, v2

    .line 724
    .line 725
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 726
    .line 727
    .line 728
    move-result-object v8

    .line 729
    check-cast v8, Ljava/util/List;

    .line 730
    .line 731
    const/4 v11, 0x0

    .line 732
    invoke-static {v5, v8, v6, v11}, Lwq1;->h(ILjava/util/List;Lmd1;Z)V

    .line 733
    .line 734
    .line 735
    goto/16 :goto_9

    .line 736
    .line 737
    :pswitch_23
    const/4 v11, 0x0

    .line 738
    aget v5, v8, v2

    .line 739
    .line 740
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 741
    .line 742
    .line 743
    move-result-object v8

    .line 744
    check-cast v8, Ljava/util/List;

    .line 745
    .line 746
    invoke-static {v5, v8, v6, v11}, Lwq1;->m(ILjava/util/List;Lmd1;Z)V

    .line 747
    .line 748
    .line 749
    goto/16 :goto_9

    .line 750
    .line 751
    :pswitch_24
    const/4 v11, 0x0

    .line 752
    aget v5, v8, v2

    .line 753
    .line 754
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 755
    .line 756
    .line 757
    move-result-object v8

    .line 758
    check-cast v8, Ljava/util/List;

    .line 759
    .line 760
    invoke-static {v5, v8, v6, v11}, Lwq1;->j(ILjava/util/List;Lmd1;Z)V

    .line 761
    .line 762
    .line 763
    goto/16 :goto_9

    .line 764
    .line 765
    :pswitch_25
    const/4 v11, 0x0

    .line 766
    aget v5, v8, v2

    .line 767
    .line 768
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 769
    .line 770
    .line 771
    move-result-object v8

    .line 772
    check-cast v8, Ljava/util/List;

    .line 773
    .line 774
    invoke-static {v5, v8, v6, v11}, Lwq1;->o(ILjava/util/List;Lmd1;Z)V

    .line 775
    .line 776
    .line 777
    goto/16 :goto_9

    .line 778
    .line 779
    :pswitch_26
    const/4 v11, 0x0

    .line 780
    aget v5, v8, v2

    .line 781
    .line 782
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 783
    .line 784
    .line 785
    move-result-object v8

    .line 786
    check-cast v8, Ljava/util/List;

    .line 787
    .line 788
    invoke-static {v5, v8, v6, v11}, Lwq1;->p(ILjava/util/List;Lmd1;Z)V

    .line 789
    .line 790
    .line 791
    goto/16 :goto_9

    .line 792
    .line 793
    :pswitch_27
    const/4 v11, 0x0

    .line 794
    aget v5, v8, v2

    .line 795
    .line 796
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 797
    .line 798
    .line 799
    move-result-object v8

    .line 800
    check-cast v8, Ljava/util/List;

    .line 801
    .line 802
    invoke-static {v5, v8, v6, v11}, Lwq1;->l(ILjava/util/List;Lmd1;Z)V

    .line 803
    .line 804
    .line 805
    goto/16 :goto_9

    .line 806
    .line 807
    :pswitch_28
    aget v5, v8, v2

    .line 808
    .line 809
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 810
    .line 811
    .line 812
    move-result-object v8

    .line 813
    check-cast v8, Ljava/util/List;

    .line 814
    .line 815
    sget-object v9, Lwq1;->a:Ltb0;

    .line 816
    .line 817
    if-eqz v8, :cond_3

    .line 818
    .line 819
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    .line 820
    .line 821
    .line 822
    move-result v9

    .line 823
    if-nez v9, :cond_3

    .line 824
    .line 825
    const/4 v11, 0x0

    .line 826
    :goto_6
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 827
    .line 828
    .line 829
    move-result v9

    .line 830
    if-ge v11, v9, :cond_3

    .line 831
    .line 832
    invoke-interface {v8, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 833
    .line 834
    .line 835
    move-result-object v9

    .line 836
    check-cast v9, Lxo1;

    .line 837
    .line 838
    invoke-virtual {v7, v5, v9}, Lfp1;->l(ILxo1;)V

    .line 839
    .line 840
    .line 841
    add-int/lit8 v11, v11, 0x1

    .line 842
    .line 843
    goto :goto_6

    .line 844
    :pswitch_29
    aget v5, v8, v2

    .line 845
    .line 846
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 847
    .line 848
    .line 849
    move-result-object v8

    .line 850
    check-cast v8, Ljava/util/List;

    .line 851
    .line 852
    invoke-virtual {v0, v2}, Lnq1;->C(I)Lvq1;

    .line 853
    .line 854
    .line 855
    move-result-object v9

    .line 856
    sget-object v10, Lwq1;->a:Ltb0;

    .line 857
    .line 858
    if-eqz v8, :cond_3

    .line 859
    .line 860
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    .line 861
    .line 862
    .line 863
    move-result v10

    .line 864
    if-nez v10, :cond_3

    .line 865
    .line 866
    const/4 v11, 0x0

    .line 867
    :goto_7
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 868
    .line 869
    .line 870
    move-result v10

    .line 871
    if-ge v11, v10, :cond_3

    .line 872
    .line 873
    invoke-interface {v8, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 874
    .line 875
    .line 876
    move-result-object v10

    .line 877
    invoke-virtual {v6, v5, v10, v9}, Lmd1;->m(ILjava/lang/Object;Lvq1;)V

    .line 878
    .line 879
    .line 880
    add-int/lit8 v11, v11, 0x1

    .line 881
    .line 882
    goto :goto_7

    .line 883
    :pswitch_2a
    aget v5, v8, v2

    .line 884
    .line 885
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 886
    .line 887
    .line 888
    move-result-object v8

    .line 889
    check-cast v8, Ljava/util/List;

    .line 890
    .line 891
    sget-object v9, Lwq1;->a:Ltb0;

    .line 892
    .line 893
    if-eqz v8, :cond_3

    .line 894
    .line 895
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    .line 896
    .line 897
    .line 898
    move-result v9

    .line 899
    if-nez v9, :cond_3

    .line 900
    .line 901
    const/4 v11, 0x0

    .line 902
    :goto_8
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 903
    .line 904
    .line 905
    move-result v9

    .line 906
    if-ge v11, v9, :cond_3

    .line 907
    .line 908
    invoke-interface {v8, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 909
    .line 910
    .line 911
    move-result-object v9

    .line 912
    check-cast v9, Ljava/lang/String;

    .line 913
    .line 914
    invoke-virtual {v7, v5, v9}, Lfp1;->k(ILjava/lang/String;)V

    .line 915
    .line 916
    .line 917
    add-int/lit8 v11, v11, 0x1

    .line 918
    .line 919
    goto :goto_8

    .line 920
    :pswitch_2b
    aget v5, v8, v2

    .line 921
    .line 922
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 923
    .line 924
    .line 925
    move-result-object v8

    .line 926
    check-cast v8, Ljava/util/List;

    .line 927
    .line 928
    const/4 v11, 0x0

    .line 929
    invoke-static {v5, v8, v6, v11}, Lwq1;->q(ILjava/util/List;Lmd1;Z)V

    .line 930
    .line 931
    .line 932
    goto/16 :goto_9

    .line 933
    .line 934
    :pswitch_2c
    const/4 v11, 0x0

    .line 935
    aget v5, v8, v2

    .line 936
    .line 937
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 938
    .line 939
    .line 940
    move-result-object v8

    .line 941
    check-cast v8, Ljava/util/List;

    .line 942
    .line 943
    invoke-static {v5, v8, v6, v11}, Lwq1;->n(ILjava/util/List;Lmd1;Z)V

    .line 944
    .line 945
    .line 946
    goto/16 :goto_9

    .line 947
    .line 948
    :pswitch_2d
    const/4 v11, 0x0

    .line 949
    aget v5, v8, v2

    .line 950
    .line 951
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 952
    .line 953
    .line 954
    move-result-object v8

    .line 955
    check-cast v8, Ljava/util/List;

    .line 956
    .line 957
    invoke-static {v5, v8, v6, v11}, Lwq1;->i(ILjava/util/List;Lmd1;Z)V

    .line 958
    .line 959
    .line 960
    goto/16 :goto_9

    .line 961
    .line 962
    :pswitch_2e
    const/4 v11, 0x0

    .line 963
    aget v5, v8, v2

    .line 964
    .line 965
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 966
    .line 967
    .line 968
    move-result-object v8

    .line 969
    check-cast v8, Ljava/util/List;

    .line 970
    .line 971
    invoke-static {v5, v8, v6, v11}, Lwq1;->k(ILjava/util/List;Lmd1;Z)V

    .line 972
    .line 973
    .line 974
    goto/16 :goto_9

    .line 975
    .line 976
    :pswitch_2f
    const/4 v11, 0x0

    .line 977
    aget v5, v8, v2

    .line 978
    .line 979
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 980
    .line 981
    .line 982
    move-result-object v8

    .line 983
    check-cast v8, Ljava/util/List;

    .line 984
    .line 985
    invoke-static {v5, v8, v6, v11}, Lwq1;->g(ILjava/util/List;Lmd1;Z)V

    .line 986
    .line 987
    .line 988
    goto/16 :goto_9

    .line 989
    .line 990
    :pswitch_30
    const/4 v11, 0x0

    .line 991
    aget v5, v8, v2

    .line 992
    .line 993
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 994
    .line 995
    .line 996
    move-result-object v8

    .line 997
    check-cast v8, Ljava/util/List;

    .line 998
    .line 999
    invoke-static {v5, v8, v6, v11}, Lwq1;->f(ILjava/util/List;Lmd1;Z)V

    .line 1000
    .line 1001
    .line 1002
    goto/16 :goto_9

    .line 1003
    .line 1004
    :pswitch_31
    const/4 v11, 0x0

    .line 1005
    aget v5, v8, v2

    .line 1006
    .line 1007
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1008
    .line 1009
    .line 1010
    move-result-object v8

    .line 1011
    check-cast v8, Ljava/util/List;

    .line 1012
    .line 1013
    invoke-static {v5, v8, v6, v11}, Lwq1;->e(ILjava/util/List;Lmd1;Z)V

    .line 1014
    .line 1015
    .line 1016
    goto/16 :goto_9

    .line 1017
    .line 1018
    :pswitch_32
    const/4 v11, 0x0

    .line 1019
    aget v5, v8, v2

    .line 1020
    .line 1021
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1022
    .line 1023
    .line 1024
    move-result-object v8

    .line 1025
    check-cast v8, Ljava/util/List;

    .line 1026
    .line 1027
    invoke-static {v5, v8, v6, v11}, Lwq1;->d(ILjava/util/List;Lmd1;Z)V

    .line 1028
    .line 1029
    .line 1030
    goto/16 :goto_9

    .line 1031
    .line 1032
    :pswitch_33
    const/4 v11, 0x0

    .line 1033
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1034
    .line 1035
    .line 1036
    move-result v5

    .line 1037
    if-eqz v5, :cond_6

    .line 1038
    .line 1039
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1040
    .line 1041
    .line 1042
    move-result-object v5

    .line 1043
    invoke-virtual {v0, v2}, Lnq1;->C(I)Lvq1;

    .line 1044
    .line 1045
    .line 1046
    move-result-object v8

    .line 1047
    check-cast v5, Lqo1;

    .line 1048
    .line 1049
    invoke-virtual {v7, v12, v14}, Lfp1;->d(II)V

    .line 1050
    .line 1051
    .line 1052
    invoke-interface {v8, v5, v6}, Lvq1;->b(Ljava/lang/Object;Lmd1;)V

    .line 1053
    .line 1054
    .line 1055
    invoke-virtual {v7, v12, v13}, Lfp1;->d(II)V

    .line 1056
    .line 1057
    .line 1058
    goto/16 :goto_9

    .line 1059
    .line 1060
    :pswitch_34
    const/4 v11, 0x0

    .line 1061
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1062
    .line 1063
    .line 1064
    move-result v5

    .line 1065
    if-eqz v5, :cond_6

    .line 1066
    .line 1067
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1068
    .line 1069
    .line 1070
    move-result-wide v8

    .line 1071
    add-long v13, v8, v8

    .line 1072
    .line 1073
    shr-long v8, v8, v16

    .line 1074
    .line 1075
    xor-long/2addr v8, v13

    .line 1076
    invoke-virtual {v7, v12, v8, v9}, Lfp1;->h(IJ)V

    .line 1077
    .line 1078
    .line 1079
    goto/16 :goto_9

    .line 1080
    .line 1081
    :pswitch_35
    const/4 v11, 0x0

    .line 1082
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1083
    .line 1084
    .line 1085
    move-result v5

    .line 1086
    if-eqz v5, :cond_6

    .line 1087
    .line 1088
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1089
    .line 1090
    .line 1091
    move-result v0

    .line 1092
    add-int v5, v0, v0

    .line 1093
    .line 1094
    shr-int/lit8 v0, v0, 0x1f

    .line 1095
    .line 1096
    xor-int/2addr v0, v5

    .line 1097
    invoke-virtual {v7, v12, v0}, Lfp1;->f(II)V

    .line 1098
    .line 1099
    .line 1100
    goto/16 :goto_9

    .line 1101
    .line 1102
    :pswitch_36
    const/4 v11, 0x0

    .line 1103
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1104
    .line 1105
    .line 1106
    move-result v5

    .line 1107
    if-eqz v5, :cond_6

    .line 1108
    .line 1109
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1110
    .line 1111
    .line 1112
    move-result-wide v8

    .line 1113
    invoke-virtual {v7, v12, v8, v9}, Lfp1;->i(IJ)V

    .line 1114
    .line 1115
    .line 1116
    goto/16 :goto_9

    .line 1117
    .line 1118
    :pswitch_37
    const/4 v11, 0x0

    .line 1119
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1120
    .line 1121
    .line 1122
    move-result v5

    .line 1123
    if-eqz v5, :cond_6

    .line 1124
    .line 1125
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1126
    .line 1127
    .line 1128
    move-result v0

    .line 1129
    invoke-virtual {v7, v12, v0}, Lfp1;->g(II)V

    .line 1130
    .line 1131
    .line 1132
    goto/16 :goto_9

    .line 1133
    .line 1134
    :pswitch_38
    const/4 v11, 0x0

    .line 1135
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1136
    .line 1137
    .line 1138
    move-result v5

    .line 1139
    if-eqz v5, :cond_6

    .line 1140
    .line 1141
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1142
    .line 1143
    .line 1144
    move-result v0

    .line 1145
    invoke-virtual {v7, v12, v0}, Lfp1;->e(II)V

    .line 1146
    .line 1147
    .line 1148
    goto/16 :goto_9

    .line 1149
    .line 1150
    :pswitch_39
    const/4 v11, 0x0

    .line 1151
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1152
    .line 1153
    .line 1154
    move-result v5

    .line 1155
    if-eqz v5, :cond_6

    .line 1156
    .line 1157
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1158
    .line 1159
    .line 1160
    move-result v0

    .line 1161
    invoke-virtual {v7, v12, v0}, Lfp1;->f(II)V

    .line 1162
    .line 1163
    .line 1164
    goto/16 :goto_9

    .line 1165
    .line 1166
    :pswitch_3a
    const/4 v11, 0x0

    .line 1167
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1168
    .line 1169
    .line 1170
    move-result v5

    .line 1171
    if-eqz v5, :cond_6

    .line 1172
    .line 1173
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1174
    .line 1175
    .line 1176
    move-result-object v0

    .line 1177
    check-cast v0, Lxo1;

    .line 1178
    .line 1179
    invoke-virtual {v7, v12, v0}, Lfp1;->l(ILxo1;)V

    .line 1180
    .line 1181
    .line 1182
    goto/16 :goto_9

    .line 1183
    .line 1184
    :pswitch_3b
    const/4 v11, 0x0

    .line 1185
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1186
    .line 1187
    .line 1188
    move-result v5

    .line 1189
    if-eqz v5, :cond_6

    .line 1190
    .line 1191
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1192
    .line 1193
    .line 1194
    move-result-object v5

    .line 1195
    invoke-virtual {v0, v2}, Lnq1;->C(I)Lvq1;

    .line 1196
    .line 1197
    .line 1198
    move-result-object v8

    .line 1199
    invoke-virtual {v6, v12, v5, v8}, Lmd1;->m(ILjava/lang/Object;Lvq1;)V

    .line 1200
    .line 1201
    .line 1202
    goto/16 :goto_9

    .line 1203
    .line 1204
    :pswitch_3c
    const/4 v11, 0x0

    .line 1205
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1206
    .line 1207
    .line 1208
    move-result v5

    .line 1209
    if-eqz v5, :cond_6

    .line 1210
    .line 1211
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1212
    .line 1213
    .line 1214
    move-result-object v0

    .line 1215
    instance-of v5, v0, Ljava/lang/String;

    .line 1216
    .line 1217
    if-eqz v5, :cond_5

    .line 1218
    .line 1219
    check-cast v0, Ljava/lang/String;

    .line 1220
    .line 1221
    invoke-virtual {v7, v12, v0}, Lfp1;->k(ILjava/lang/String;)V

    .line 1222
    .line 1223
    .line 1224
    goto/16 :goto_9

    .line 1225
    .line 1226
    :cond_5
    check-cast v0, Lxo1;

    .line 1227
    .line 1228
    invoke-virtual {v7, v12, v0}, Lfp1;->l(ILxo1;)V

    .line 1229
    .line 1230
    .line 1231
    goto/16 :goto_9

    .line 1232
    .line 1233
    :pswitch_3d
    const/4 v11, 0x0

    .line 1234
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1235
    .line 1236
    .line 1237
    move-result v5

    .line 1238
    if-eqz v5, :cond_6

    .line 1239
    .line 1240
    sget-object v0, Ler1;->c:Llf1;

    .line 1241
    .line 1242
    invoke-virtual {v0, v9, v10, v1}, Llf1;->l(JLjava/lang/Object;)Z

    .line 1243
    .line 1244
    .line 1245
    move-result v0

    .line 1246
    invoke-virtual {v7, v12, v0}, Lfp1;->j(IZ)V

    .line 1247
    .line 1248
    .line 1249
    goto/16 :goto_9

    .line 1250
    .line 1251
    :pswitch_3e
    const/4 v11, 0x0

    .line 1252
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1253
    .line 1254
    .line 1255
    move-result v5

    .line 1256
    if-eqz v5, :cond_6

    .line 1257
    .line 1258
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1259
    .line 1260
    .line 1261
    move-result v0

    .line 1262
    invoke-virtual {v7, v12, v0}, Lfp1;->g(II)V

    .line 1263
    .line 1264
    .line 1265
    goto :goto_9

    .line 1266
    :pswitch_3f
    const/4 v11, 0x0

    .line 1267
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1268
    .line 1269
    .line 1270
    move-result v5

    .line 1271
    if-eqz v5, :cond_6

    .line 1272
    .line 1273
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1274
    .line 1275
    .line 1276
    move-result-wide v8

    .line 1277
    invoke-virtual {v7, v12, v8, v9}, Lfp1;->i(IJ)V

    .line 1278
    .line 1279
    .line 1280
    goto :goto_9

    .line 1281
    :pswitch_40
    const/4 v11, 0x0

    .line 1282
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1283
    .line 1284
    .line 1285
    move-result v5

    .line 1286
    if-eqz v5, :cond_6

    .line 1287
    .line 1288
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1289
    .line 1290
    .line 1291
    move-result v0

    .line 1292
    invoke-virtual {v7, v12, v0}, Lfp1;->e(II)V

    .line 1293
    .line 1294
    .line 1295
    goto :goto_9

    .line 1296
    :pswitch_41
    const/4 v11, 0x0

    .line 1297
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1298
    .line 1299
    .line 1300
    move-result v5

    .line 1301
    if-eqz v5, :cond_6

    .line 1302
    .line 1303
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1304
    .line 1305
    .line 1306
    move-result-wide v8

    .line 1307
    invoke-virtual {v7, v12, v8, v9}, Lfp1;->h(IJ)V

    .line 1308
    .line 1309
    .line 1310
    goto :goto_9

    .line 1311
    :pswitch_42
    const/4 v11, 0x0

    .line 1312
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1313
    .line 1314
    .line 1315
    move-result v5

    .line 1316
    if-eqz v5, :cond_6

    .line 1317
    .line 1318
    invoke-virtual {v15, v1, v9, v10}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1319
    .line 1320
    .line 1321
    move-result-wide v8

    .line 1322
    invoke-virtual {v7, v12, v8, v9}, Lfp1;->h(IJ)V

    .line 1323
    .line 1324
    .line 1325
    goto :goto_9

    .line 1326
    :pswitch_43
    const/4 v11, 0x0

    .line 1327
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1328
    .line 1329
    .line 1330
    move-result v5

    .line 1331
    if-eqz v5, :cond_6

    .line 1332
    .line 1333
    sget-object v0, Ler1;->c:Llf1;

    .line 1334
    .line 1335
    invoke-virtual {v0, v9, v10, v1}, Llf1;->n(JLjava/lang/Object;)F

    .line 1336
    .line 1337
    .line 1338
    move-result v0

    .line 1339
    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    .line 1340
    .line 1341
    .line 1342
    move-result v0

    .line 1343
    invoke-virtual {v7, v12, v0}, Lfp1;->g(II)V

    .line 1344
    .line 1345
    .line 1346
    goto :goto_9

    .line 1347
    :pswitch_44
    const/4 v11, 0x0

    .line 1348
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1349
    .line 1350
    .line 1351
    move-result v5

    .line 1352
    if-eqz v5, :cond_6

    .line 1353
    .line 1354
    sget-object v0, Ler1;->c:Llf1;

    .line 1355
    .line 1356
    invoke-virtual {v0, v9, v10, v1}, Llf1;->p(JLjava/lang/Object;)D

    .line 1357
    .line 1358
    .line 1359
    move-result-wide v8

    .line 1360
    invoke-static {v8, v9}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    .line 1361
    .line 1362
    .line 1363
    move-result-wide v8

    .line 1364
    invoke-virtual {v7, v12, v8, v9}, Lfp1;->i(IJ)V

    .line 1365
    .line 1366
    .line 1367
    :cond_6
    :goto_9
    add-int/lit8 v2, v2, 0x3

    .line 1368
    .line 1369
    const v9, 0xfffff

    .line 1370
    .line 1371
    .line 1372
    move-object/from16 v0, p0

    .line 1373
    .line 1374
    goto/16 :goto_0

    .line 1375
    .line 1376
    :cond_7
    move-object v0, v1

    .line 1377
    check-cast v0, Lnp1;

    .line 1378
    .line 1379
    iget-object v0, v0, Lnp1;->zzc:Lcr1;

    .line 1380
    .line 1381
    invoke-virtual {v0, v6}, Lcr1;->b(Lmd1;)V

    .line 1382
    .line 1383
    .line 1384
    return-void

    .line 1385
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final c(Lnp1;)I
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    iget-object v3, p0, Lnq1;->a:[I

    .line 5
    .line 6
    array-length v3, v3

    .line 7
    const v4, 0xfffff

    .line 8
    .line 9
    .line 10
    if-ge v1, v3, :cond_4

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Lnq1;->k(I)I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    invoke-static {v3}, Lnq1;->l(I)I

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    const/16 v6, 0x32

    .line 21
    .line 22
    if-le v5, v6, :cond_0

    .line 23
    .line 24
    const/16 v6, 0x45

    .line 25
    .line 26
    if-lt v5, v6, :cond_3

    .line 27
    .line 28
    :cond_0
    and-int/2addr v3, v4

    .line 29
    int-to-long v3, v3

    .line 30
    const/16 v6, 0x25

    .line 31
    .line 32
    const/16 v7, 0x20

    .line 33
    .line 34
    packed-switch v5, :pswitch_data_0

    .line 35
    .line 36
    .line 37
    goto/16 :goto_5

    .line 38
    .line 39
    :pswitch_0
    mul-int/lit8 v2, v2, 0x35

    .line 40
    .line 41
    invoke-static {v3, v4, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    :goto_1
    add-int/2addr v2, v3

    .line 50
    goto/16 :goto_5

    .line 51
    .line 52
    :pswitch_1
    mul-int/lit8 v2, v2, 0x35

    .line 53
    .line 54
    invoke-static {v3, v4, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    goto :goto_1

    .line 63
    :pswitch_2
    mul-int/lit8 v2, v2, 0x35

    .line 64
    .line 65
    invoke-static {v3, v4, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    if-eqz v3, :cond_1

    .line 70
    .line 71
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    :cond_1
    :goto_2
    add-int/2addr v2, v6

    .line 76
    goto/16 :goto_5

    .line 77
    .line 78
    :pswitch_3
    mul-int/lit8 v2, v2, 0x35

    .line 79
    .line 80
    invoke-static {v3, v4, p1}, Ler1;->f(JLjava/lang/Object;)J

    .line 81
    .line 82
    .line 83
    move-result-wide v3

    .line 84
    sget-object v5, Lwp1;->a:[B

    .line 85
    .line 86
    :goto_3
    ushr-long v5, v3, v7

    .line 87
    .line 88
    xor-long/2addr v3, v5

    .line 89
    long-to-int v3, v3

    .line 90
    :goto_4
    add-int/2addr v2, v3

    .line 91
    goto/16 :goto_5

    .line 92
    .line 93
    :pswitch_4
    mul-int/lit8 v2, v2, 0x35

    .line 94
    .line 95
    invoke-static {v3, v4, p1}, Ler1;->d(JLjava/lang/Object;)I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    goto :goto_1

    .line 100
    :pswitch_5
    mul-int/lit8 v2, v2, 0x35

    .line 101
    .line 102
    invoke-static {v3, v4, p1}, Ler1;->f(JLjava/lang/Object;)J

    .line 103
    .line 104
    .line 105
    move-result-wide v3

    .line 106
    sget-object v5, Lwp1;->a:[B

    .line 107
    .line 108
    goto :goto_3

    .line 109
    :pswitch_6
    mul-int/lit8 v2, v2, 0x35

    .line 110
    .line 111
    invoke-static {v3, v4, p1}, Ler1;->d(JLjava/lang/Object;)I

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    goto :goto_1

    .line 116
    :pswitch_7
    mul-int/lit8 v2, v2, 0x35

    .line 117
    .line 118
    invoke-static {v3, v4, p1}, Ler1;->d(JLjava/lang/Object;)I

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    goto :goto_1

    .line 123
    :pswitch_8
    mul-int/lit8 v2, v2, 0x35

    .line 124
    .line 125
    invoke-static {v3, v4, p1}, Ler1;->d(JLjava/lang/Object;)I

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    goto :goto_1

    .line 130
    :pswitch_9
    mul-int/lit8 v2, v2, 0x35

    .line 131
    .line 132
    invoke-static {v3, v4, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    goto :goto_1

    .line 141
    :pswitch_a
    mul-int/lit8 v2, v2, 0x35

    .line 142
    .line 143
    invoke-static {v3, v4, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    if-eqz v3, :cond_1

    .line 148
    .line 149
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 150
    .line 151
    .line 152
    move-result v6

    .line 153
    goto :goto_2

    .line 154
    :pswitch_b
    mul-int/lit8 v2, v2, 0x35

    .line 155
    .line 156
    invoke-static {v3, v4, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    check-cast v3, Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    goto :goto_1

    .line 167
    :pswitch_c
    mul-int/lit8 v2, v2, 0x35

    .line 168
    .line 169
    sget-object v5, Ler1;->c:Llf1;

    .line 170
    .line 171
    invoke-virtual {v5, v3, v4, p1}, Llf1;->l(JLjava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    sget-object v4, Lwp1;->a:[B

    .line 176
    .line 177
    if-eqz v3, :cond_2

    .line 178
    .line 179
    const/16 v3, 0x4cf

    .line 180
    .line 181
    goto :goto_4

    .line 182
    :cond_2
    const/16 v3, 0x4d5

    .line 183
    .line 184
    goto :goto_4

    .line 185
    :pswitch_d
    mul-int/lit8 v2, v2, 0x35

    .line 186
    .line 187
    invoke-static {v3, v4, p1}, Ler1;->d(JLjava/lang/Object;)I

    .line 188
    .line 189
    .line 190
    move-result v3

    .line 191
    goto/16 :goto_1

    .line 192
    .line 193
    :pswitch_e
    mul-int/lit8 v2, v2, 0x35

    .line 194
    .line 195
    invoke-static {v3, v4, p1}, Ler1;->f(JLjava/lang/Object;)J

    .line 196
    .line 197
    .line 198
    move-result-wide v3

    .line 199
    sget-object v5, Lwp1;->a:[B

    .line 200
    .line 201
    goto :goto_3

    .line 202
    :pswitch_f
    mul-int/lit8 v2, v2, 0x35

    .line 203
    .line 204
    invoke-static {v3, v4, p1}, Ler1;->d(JLjava/lang/Object;)I

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    goto/16 :goto_1

    .line 209
    .line 210
    :pswitch_10
    mul-int/lit8 v2, v2, 0x35

    .line 211
    .line 212
    invoke-static {v3, v4, p1}, Ler1;->f(JLjava/lang/Object;)J

    .line 213
    .line 214
    .line 215
    move-result-wide v3

    .line 216
    sget-object v5, Lwp1;->a:[B

    .line 217
    .line 218
    goto/16 :goto_3

    .line 219
    .line 220
    :pswitch_11
    mul-int/lit8 v2, v2, 0x35

    .line 221
    .line 222
    invoke-static {v3, v4, p1}, Ler1;->f(JLjava/lang/Object;)J

    .line 223
    .line 224
    .line 225
    move-result-wide v3

    .line 226
    sget-object v5, Lwp1;->a:[B

    .line 227
    .line 228
    goto/16 :goto_3

    .line 229
    .line 230
    :pswitch_12
    mul-int/lit8 v2, v2, 0x35

    .line 231
    .line 232
    sget-object v5, Ler1;->c:Llf1;

    .line 233
    .line 234
    invoke-virtual {v5, v3, v4, p1}, Llf1;->n(JLjava/lang/Object;)F

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 239
    .line 240
    .line 241
    move-result v3

    .line 242
    goto/16 :goto_1

    .line 243
    .line 244
    :pswitch_13
    mul-int/lit8 v2, v2, 0x35

    .line 245
    .line 246
    sget-object v5, Ler1;->c:Llf1;

    .line 247
    .line 248
    invoke-virtual {v5, v3, v4, p1}, Llf1;->p(JLjava/lang/Object;)D

    .line 249
    .line 250
    .line 251
    move-result-wide v3

    .line 252
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 253
    .line 254
    .line 255
    move-result-wide v3

    .line 256
    sget-object v5, Lwp1;->a:[B

    .line 257
    .line 258
    goto/16 :goto_3

    .line 259
    .line 260
    :cond_3
    :goto_5
    add-int/lit8 v1, v1, 0x3

    .line 261
    .line 262
    goto/16 :goto_0

    .line 263
    .line 264
    :cond_4
    iget v1, p0, Lnq1;->i:I

    .line 265
    .line 266
    :goto_6
    iget-object v3, p0, Lnq1;->g:[I

    .line 267
    .line 268
    array-length v5, v3

    .line 269
    if-ge v1, v5, :cond_6

    .line 270
    .line 271
    aget v3, v3, v1

    .line 272
    .line 273
    invoke-virtual {p0, v0, p1, v3}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 274
    .line 275
    .line 276
    move-result v5

    .line 277
    if-nez v5, :cond_5

    .line 278
    .line 279
    mul-int/lit8 v2, v2, 0x35

    .line 280
    .line 281
    invoke-virtual {p0, v3}, Lnq1;->k(I)I

    .line 282
    .line 283
    .line 284
    move-result v3

    .line 285
    and-int/2addr v3, v4

    .line 286
    int-to-long v5, v3

    .line 287
    invoke-static {v5, v6, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 288
    .line 289
    .line 290
    move-result-object v3

    .line 291
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 292
    .line 293
    .line 294
    move-result v3

    .line 295
    add-int/2addr v3, v2

    .line 296
    move v2, v3

    .line 297
    :cond_5
    add-int/lit8 v1, v1, 0x1

    .line 298
    .line 299
    goto :goto_6

    .line 300
    :cond_6
    mul-int/lit8 v2, v2, 0x35

    .line 301
    .line 302
    iget-object p0, p1, Lnp1;->zzc:Lcr1;

    .line 303
    .line 304
    invoke-virtual {p0}, Lcr1;->hashCode()I

    .line 305
    .line 306
    .line 307
    move-result p0

    .line 308
    add-int/2addr p0, v2

    .line 309
    return p0

    .line 310
    nop

    .line 311
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final d(Ljava/lang/Object;Lwk;Lgp1;)V
    .locals 21

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v7, p2

    .line 4
    .line 5
    move-object/from16 v8, p3

    .line 6
    .line 7
    iget-object v0, v7, Lwk;->d:Ljava/lang/Object;

    .line 8
    .line 9
    move-object v9, v0

    .line 10
    check-cast v9, Lap1;

    .line 11
    .line 12
    iget-object v10, v1, Lnq1;->g:[I

    .line 13
    .line 14
    iget v11, v1, Lnq1;->i:I

    .line 15
    .line 16
    iget v12, v1, Lnq1;->h:I

    .line 17
    .line 18
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    invoke-static/range {p1 .. p1}, Lnq1;->n(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object v5, v1, Lnq1;->j:Ltb0;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    move-object v2, v0

    .line 28
    :goto_0
    :try_start_0
    invoke-virtual {v7}, Lwk;->X()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget v3, v1, Lnq1;->c:I

    .line 33
    .line 34
    const/4 v13, 0x0

    .line 35
    if-lt v0, v3, :cond_0

    .line 36
    .line 37
    iget v3, v1, Lnq1;->d:I

    .line 38
    .line 39
    if-gt v0, v3, :cond_0

    .line 40
    .line 41
    invoke-virtual {v1, v0, v13}, Lnq1;->w(II)I

    .line 42
    .line 43
    .line 44
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    .line 45
    :goto_1
    move v6, v3

    .line 46
    goto :goto_2

    .line 47
    :cond_0
    const/4 v3, -0x1

    .line 48
    goto :goto_1

    .line 49
    :goto_2
    if-gez v6, :cond_4

    .line 50
    .line 51
    const v3, 0x7fffffff

    .line 52
    .line 53
    .line 54
    if-ne v0, v3, :cond_1

    .line 55
    .line 56
    move-object v4, v2

    .line 57
    :goto_3
    if-ge v12, v11, :cond_14

    .line 58
    .line 59
    aget v3, v10, v12

    .line 60
    .line 61
    move-object/from16 v6, p1

    .line 62
    .line 63
    move-object/from16 v2, p1

    .line 64
    .line 65
    invoke-virtual/range {v1 .. v6}, Lnq1;->J(Ljava/lang/Object;ILjava/lang/Object;Ltb0;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    add-int/lit8 v12, v12, 0x1

    .line 70
    .line 71
    move-object/from16 v1, p0

    .line 72
    .line 73
    goto :goto_3

    .line 74
    :cond_1
    if-nez v2, :cond_2

    .line 75
    .line 76
    :try_start_1
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    .line 78
    .line 79
    invoke-static/range {p1 .. p1}, Ltb0;->n(Ljava/lang/Object;)Lcr1;

    .line 80
    .line 81
    .line 82
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    .line 83
    move-object v2, v0

    .line 84
    goto :goto_5

    .line 85
    :goto_4
    move-object/from16 v18, v2

    .line 86
    .line 87
    goto/16 :goto_1c

    .line 88
    .line 89
    :cond_2
    :goto_5
    :try_start_2
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 90
    .line 91
    .line 92
    invoke-static {v13, v7, v2}, Ltb0;->o(ILwk;Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 96
    if-nez v0, :cond_3

    .line 97
    .line 98
    move-object v4, v2

    .line 99
    :goto_6
    if-ge v12, v11, :cond_14

    .line 100
    .line 101
    aget v3, v10, v12

    .line 102
    .line 103
    move-object/from16 v6, p1

    .line 104
    .line 105
    move-object/from16 v1, p0

    .line 106
    .line 107
    move-object/from16 v2, p1

    .line 108
    .line 109
    invoke-virtual/range {v1 .. v6}, Lnq1;->J(Ljava/lang/Object;ILjava/lang/Object;Ltb0;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    add-int/lit8 v12, v12, 0x1

    .line 114
    .line 115
    goto :goto_6

    .line 116
    :cond_3
    move-object/from16 v1, p0

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :catchall_0
    move-exception v0

    .line 120
    move-object/from16 v1, p0

    .line 121
    .line 122
    goto/16 :goto_1d

    .line 123
    .line 124
    :cond_4
    :try_start_3
    invoke-virtual {v1, v6}, Lnq1;->k(I)I

    .line 125
    .line 126
    .line 127
    move-result v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_5

    .line 128
    :try_start_4
    invoke-static {v3}, Lnq1;->l(I)I

    .line 129
    .line 130
    .line 131
    move-result v4
    :try_end_4
    .catch Lzp1; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_a

    .line 132
    const/4 v15, 0x3

    .line 133
    const/4 v14, 0x1

    .line 134
    const v16, 0xfffff

    .line 135
    .line 136
    .line 137
    packed-switch v4, :pswitch_data_0

    .line 138
    .line 139
    .line 140
    if-nez v2, :cond_5

    .line 141
    .line 142
    :try_start_5
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 143
    .line 144
    .line 145
    invoke-static/range {p1 .. p1}, Ltb0;->n(Ljava/lang/Object;)Lcr1;

    .line 146
    .line 147
    .line 148
    move-result-object v0
    :try_end_5
    .catch Lzp1; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    .line 149
    move-object v2, v0

    .line 150
    goto :goto_7

    .line 151
    :catch_0
    move-object v15, v1

    .line 152
    move-object/from16 v18, v2

    .line 153
    .line 154
    move-object/from16 v17, v5

    .line 155
    .line 156
    move-object/from16 v1, p1

    .line 157
    .line 158
    goto/16 :goto_18

    .line 159
    .line 160
    :cond_5
    :goto_7
    :try_start_6
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 161
    .line 162
    .line 163
    invoke-static {v13, v7, v2}, Ltb0;->o(ILwk;Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result v0
    :try_end_6
    .catch Lzp1; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 167
    if-nez v0, :cond_8

    .line 168
    .line 169
    move-object v4, v2

    .line 170
    :goto_8
    if-ge v12, v11, :cond_6

    .line 171
    .line 172
    aget v3, v10, v12

    .line 173
    .line 174
    move-object/from16 v6, p1

    .line 175
    .line 176
    move-object/from16 v2, p1

    .line 177
    .line 178
    invoke-virtual/range {v1 .. v6}, Lnq1;->J(Ljava/lang/Object;ILjava/lang/Object;Ltb0;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v4

    .line 182
    move-object/from16 v17, v5

    .line 183
    .line 184
    move-object v5, v2

    .line 185
    add-int/lit8 v12, v12, 0x1

    .line 186
    .line 187
    move-object/from16 v5, v17

    .line 188
    .line 189
    goto :goto_8

    .line 190
    :cond_6
    move-object/from16 v17, v5

    .line 191
    .line 192
    move-object/from16 v5, p1

    .line 193
    .line 194
    :cond_7
    move-object/from16 v5, v17

    .line 195
    .line 196
    goto/16 :goto_1b

    .line 197
    .line 198
    :cond_8
    move-object/from16 v17, v5

    .line 199
    .line 200
    move-object/from16 v5, p1

    .line 201
    .line 202
    :goto_9
    move-object/from16 v5, v17

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :catchall_1
    move-exception v0

    .line 207
    move-object/from16 v17, v5

    .line 208
    .line 209
    move-object/from16 v5, p1

    .line 210
    .line 211
    goto :goto_a

    .line 212
    :catch_1
    move-object/from16 v17, v5

    .line 213
    .line 214
    move-object/from16 v5, p1

    .line 215
    .line 216
    goto :goto_b

    .line 217
    :goto_a
    move-object/from16 v5, v17

    .line 218
    .line 219
    goto/16 :goto_1d

    .line 220
    .line 221
    :goto_b
    move-object v15, v1

    .line 222
    move-object v1, v5

    .line 223
    goto/16 :goto_19

    .line 224
    .line 225
    :pswitch_0
    move-object/from16 v17, v5

    .line 226
    .line 227
    move-object/from16 v5, p1

    .line 228
    .line 229
    :try_start_7
    invoke-virtual {v1, v0, v5, v6}, Lnq1;->H(ILjava/lang/Object;I)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    check-cast v3, Lqo1;

    .line 234
    .line 235
    invoke-virtual {v1, v6}, Lnq1;->C(I)Lvq1;

    .line 236
    .line 237
    .line 238
    move-result-object v4

    .line 239
    invoke-virtual {v7, v15}, Lwk;->Q(I)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v7, v3, v4, v8}, Lwk;->S(Ljava/lang/Object;Lvq1;Lgp1;)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {v1, v5, v0, v6, v3}, Lnq1;->I(Ljava/lang/Object;IILjava/lang/Object;)V

    .line 246
    .line 247
    .line 248
    :goto_c
    move-object v15, v1

    .line 249
    move-object/from16 v18, v2

    .line 250
    .line 251
    move-object v1, v5

    .line 252
    goto/16 :goto_17

    .line 253
    .line 254
    :catchall_2
    move-exception v0

    .line 255
    move-object/from16 v18, v2

    .line 256
    .line 257
    :goto_d
    move-object/from16 v5, v17

    .line 258
    .line 259
    goto/16 :goto_1c

    .line 260
    .line 261
    :catch_2
    move-object v15, v1

    .line 262
    move-object/from16 v18, v2

    .line 263
    .line 264
    move-object v1, v5

    .line 265
    goto/16 :goto_18

    .line 266
    .line 267
    :pswitch_1
    move-object/from16 v17, v5

    .line 268
    .line 269
    move-object/from16 v5, p1

    .line 270
    .line 271
    and-int v3, v3, v16

    .line 272
    .line 273
    invoke-virtual {v7, v13}, Lwk;->Q(I)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v9}, Lap1;->F()J

    .line 277
    .line 278
    .line 279
    move-result-wide v14

    .line 280
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 281
    .line 282
    .line 283
    move-result-object v4

    .line 284
    int-to-long v14, v3

    .line 285
    invoke-static {v5, v14, v15, v4}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v1, v0, v5, v6}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 289
    .line 290
    .line 291
    goto :goto_c

    .line 292
    :pswitch_2
    move-object/from16 v17, v5

    .line 293
    .line 294
    move-object/from16 v5, p1

    .line 295
    .line 296
    and-int v3, v3, v16

    .line 297
    .line 298
    invoke-virtual {v7, v13}, Lwk;->Q(I)V

    .line 299
    .line 300
    .line 301
    invoke-virtual {v9}, Lap1;->E()I

    .line 302
    .line 303
    .line 304
    move-result v4

    .line 305
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 306
    .line 307
    .line 308
    move-result-object v4

    .line 309
    int-to-long v14, v3

    .line 310
    invoke-static {v5, v14, v15, v4}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {v1, v0, v5, v6}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 314
    .line 315
    .line 316
    goto :goto_c

    .line 317
    :pswitch_3
    move-object/from16 v17, v5

    .line 318
    .line 319
    move-object/from16 v5, p1

    .line 320
    .line 321
    and-int v3, v3, v16

    .line 322
    .line 323
    invoke-virtual {v7, v14}, Lwk;->Q(I)V

    .line 324
    .line 325
    .line 326
    invoke-virtual {v9}, Lap1;->D()J

    .line 327
    .line 328
    .line 329
    move-result-wide v14

    .line 330
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 331
    .line 332
    .line 333
    move-result-object v4

    .line 334
    int-to-long v14, v3

    .line 335
    invoke-static {v5, v14, v15, v4}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 336
    .line 337
    .line 338
    invoke-virtual {v1, v0, v5, v6}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 339
    .line 340
    .line 341
    goto :goto_c

    .line 342
    :pswitch_4
    move-object/from16 v17, v5

    .line 343
    .line 344
    move-object/from16 v5, p1

    .line 345
    .line 346
    and-int v3, v3, v16

    .line 347
    .line 348
    const/4 v4, 0x5

    .line 349
    invoke-virtual {v7, v4}, Lwk;->Q(I)V

    .line 350
    .line 351
    .line 352
    invoke-virtual {v9}, Lap1;->C()I

    .line 353
    .line 354
    .line 355
    move-result v4

    .line 356
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 357
    .line 358
    .line 359
    move-result-object v4

    .line 360
    int-to-long v14, v3

    .line 361
    invoke-static {v5, v14, v15, v4}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 362
    .line 363
    .line 364
    invoke-virtual {v1, v0, v5, v6}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 365
    .line 366
    .line 367
    goto :goto_c

    .line 368
    :pswitch_5
    move-object/from16 v17, v5

    .line 369
    .line 370
    move-object/from16 v5, p1

    .line 371
    .line 372
    invoke-virtual {v7, v13}, Lwk;->Q(I)V

    .line 373
    .line 374
    .line 375
    invoke-virtual {v9}, Lap1;->B()I

    .line 376
    .line 377
    .line 378
    move-result v4

    .line 379
    invoke-virtual {v1, v6}, Lnq1;->E(I)Llo1;

    .line 380
    .line 381
    .line 382
    move-result-object v14

    .line 383
    if-eqz v14, :cond_b

    .line 384
    .line 385
    invoke-virtual {v14, v4}, Llo1;->a(I)Z

    .line 386
    .line 387
    .line 388
    move-result v14

    .line 389
    if-eqz v14, :cond_9

    .line 390
    .line 391
    goto :goto_10

    .line 392
    :cond_9
    sget-object v3, Lwq1;->a:Ltb0;

    .line 393
    .line 394
    if-nez v2, :cond_a

    .line 395
    .line 396
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 397
    .line 398
    .line 399
    invoke-static {v5}, Ltb0;->n(Ljava/lang/Object;)Lcr1;

    .line 400
    .line 401
    .line 402
    move-result-object v3

    .line 403
    goto :goto_e

    .line 404
    :cond_a
    move-object v3, v2

    .line 405
    :goto_e
    int-to-long v14, v4

    .line 406
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 407
    .line 408
    .line 409
    move-object v4, v3

    .line 410
    check-cast v4, Lcr1;

    .line 411
    .line 412
    shl-int/lit8 v0, v0, 0x3

    .line 413
    .line 414
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 415
    .line 416
    .line 417
    move-result-object v6

    .line 418
    invoke-virtual {v4, v0, v6}, Lcr1;->d(ILjava/lang/Object;)V

    .line 419
    .line 420
    .line 421
    :goto_f
    move-object v2, v3

    .line 422
    goto/16 :goto_9

    .line 423
    .line 424
    :cond_b
    :goto_10
    and-int v3, v3, v16

    .line 425
    .line 426
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 427
    .line 428
    .line 429
    move-result-object v4

    .line 430
    int-to-long v14, v3

    .line 431
    invoke-static {v5, v14, v15, v4}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 432
    .line 433
    .line 434
    invoke-virtual {v1, v0, v5, v6}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 435
    .line 436
    .line 437
    goto/16 :goto_c

    .line 438
    .line 439
    :pswitch_6
    move-object/from16 v17, v5

    .line 440
    .line 441
    move-object/from16 v5, p1

    .line 442
    .line 443
    and-int v3, v3, v16

    .line 444
    .line 445
    invoke-virtual {v7, v13}, Lwk;->Q(I)V

    .line 446
    .line 447
    .line 448
    invoke-virtual {v9}, Lap1;->A()I

    .line 449
    .line 450
    .line 451
    move-result v4

    .line 452
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 453
    .line 454
    .line 455
    move-result-object v4

    .line 456
    int-to-long v14, v3

    .line 457
    invoke-static {v5, v14, v15, v4}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 458
    .line 459
    .line 460
    invoke-virtual {v1, v0, v5, v6}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 461
    .line 462
    .line 463
    goto/16 :goto_c

    .line 464
    .line 465
    :pswitch_7
    move-object/from16 v17, v5

    .line 466
    .line 467
    move-object/from16 v5, p1

    .line 468
    .line 469
    and-int v3, v3, v16

    .line 470
    .line 471
    invoke-virtual {v7}, Lwk;->Y()Lxo1;

    .line 472
    .line 473
    .line 474
    move-result-object v4

    .line 475
    int-to-long v14, v3

    .line 476
    invoke-static {v5, v14, v15, v4}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 477
    .line 478
    .line 479
    invoke-virtual {v1, v0, v5, v6}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 480
    .line 481
    .line 482
    goto/16 :goto_c

    .line 483
    .line 484
    :pswitch_8
    move-object/from16 v17, v5

    .line 485
    .line 486
    move-object/from16 v5, p1

    .line 487
    .line 488
    invoke-virtual {v1, v0, v5, v6}, Lnq1;->H(ILjava/lang/Object;I)Ljava/lang/Object;

    .line 489
    .line 490
    .line 491
    move-result-object v3

    .line 492
    check-cast v3, Lqo1;

    .line 493
    .line 494
    invoke-virtual {v1, v6}, Lnq1;->C(I)Lvq1;

    .line 495
    .line 496
    .line 497
    move-result-object v4

    .line 498
    const/4 v14, 0x2

    .line 499
    invoke-virtual {v7, v14}, Lwk;->Q(I)V

    .line 500
    .line 501
    .line 502
    invoke-virtual {v7, v3, v4, v8}, Lwk;->R(Ljava/lang/Object;Lvq1;Lgp1;)V

    .line 503
    .line 504
    .line 505
    invoke-virtual {v1, v5, v0, v6, v3}, Lnq1;->I(Ljava/lang/Object;IILjava/lang/Object;)V

    .line 506
    .line 507
    .line 508
    goto/16 :goto_c

    .line 509
    .line 510
    :pswitch_9
    move-object/from16 v17, v5

    .line 511
    .line 512
    move-object/from16 v5, p1

    .line 513
    .line 514
    invoke-virtual {v1, v3, v7, v5}, Lnq1;->K(ILwk;Ljava/lang/Object;)V

    .line 515
    .line 516
    .line 517
    invoke-virtual {v1, v0, v5, v6}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 518
    .line 519
    .line 520
    goto/16 :goto_c

    .line 521
    .line 522
    :pswitch_a
    move-object/from16 v17, v5

    .line 523
    .line 524
    move-object/from16 v5, p1

    .line 525
    .line 526
    and-int v3, v3, v16

    .line 527
    .line 528
    invoke-virtual {v7, v13}, Lwk;->Q(I)V

    .line 529
    .line 530
    .line 531
    invoke-virtual {v9}, Lap1;->v()Z

    .line 532
    .line 533
    .line 534
    move-result v4

    .line 535
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 536
    .line 537
    .line 538
    move-result-object v4

    .line 539
    int-to-long v14, v3

    .line 540
    invoke-static {v5, v14, v15, v4}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 541
    .line 542
    .line 543
    invoke-virtual {v1, v0, v5, v6}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 544
    .line 545
    .line 546
    goto/16 :goto_c

    .line 547
    .line 548
    :pswitch_b
    move-object/from16 v17, v5

    .line 549
    .line 550
    move-object/from16 v5, p1

    .line 551
    .line 552
    and-int v3, v3, v16

    .line 553
    .line 554
    const/4 v4, 0x5

    .line 555
    invoke-virtual {v7, v4}, Lwk;->Q(I)V

    .line 556
    .line 557
    .line 558
    invoke-virtual {v9}, Lap1;->u()I

    .line 559
    .line 560
    .line 561
    move-result v4

    .line 562
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 563
    .line 564
    .line 565
    move-result-object v4

    .line 566
    int-to-long v14, v3

    .line 567
    invoke-static {v5, v14, v15, v4}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 568
    .line 569
    .line 570
    invoke-virtual {v1, v0, v5, v6}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 571
    .line 572
    .line 573
    goto/16 :goto_c

    .line 574
    .line 575
    :pswitch_c
    move-object/from16 v17, v5

    .line 576
    .line 577
    move-object/from16 v5, p1

    .line 578
    .line 579
    and-int v3, v3, v16

    .line 580
    .line 581
    invoke-virtual {v7, v14}, Lwk;->Q(I)V

    .line 582
    .line 583
    .line 584
    invoke-virtual {v9}, Lap1;->t()J

    .line 585
    .line 586
    .line 587
    move-result-wide v14

    .line 588
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 589
    .line 590
    .line 591
    move-result-object v4

    .line 592
    int-to-long v14, v3

    .line 593
    invoke-static {v5, v14, v15, v4}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 594
    .line 595
    .line 596
    invoke-virtual {v1, v0, v5, v6}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 597
    .line 598
    .line 599
    goto/16 :goto_c

    .line 600
    .line 601
    :pswitch_d
    move-object/from16 v17, v5

    .line 602
    .line 603
    move-object/from16 v5, p1

    .line 604
    .line 605
    and-int v3, v3, v16

    .line 606
    .line 607
    invoke-virtual {v7, v13}, Lwk;->Q(I)V

    .line 608
    .line 609
    .line 610
    invoke-virtual {v9}, Lap1;->s()I

    .line 611
    .line 612
    .line 613
    move-result v4

    .line 614
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 615
    .line 616
    .line 617
    move-result-object v4

    .line 618
    int-to-long v14, v3

    .line 619
    invoke-static {v5, v14, v15, v4}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 620
    .line 621
    .line 622
    invoke-virtual {v1, v0, v5, v6}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 623
    .line 624
    .line 625
    goto/16 :goto_c

    .line 626
    .line 627
    :pswitch_e
    move-object/from16 v17, v5

    .line 628
    .line 629
    move-object/from16 v5, p1

    .line 630
    .line 631
    and-int v3, v3, v16

    .line 632
    .line 633
    invoke-virtual {v7, v13}, Lwk;->Q(I)V

    .line 634
    .line 635
    .line 636
    invoke-virtual {v9}, Lap1;->q()J

    .line 637
    .line 638
    .line 639
    move-result-wide v14

    .line 640
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 641
    .line 642
    .line 643
    move-result-object v4

    .line 644
    int-to-long v14, v3

    .line 645
    invoke-static {v5, v14, v15, v4}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 646
    .line 647
    .line 648
    invoke-virtual {v1, v0, v5, v6}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 649
    .line 650
    .line 651
    goto/16 :goto_c

    .line 652
    .line 653
    :pswitch_f
    move-object/from16 v17, v5

    .line 654
    .line 655
    move-object/from16 v5, p1

    .line 656
    .line 657
    and-int v3, v3, v16

    .line 658
    .line 659
    invoke-virtual {v7, v13}, Lwk;->Q(I)V

    .line 660
    .line 661
    .line 662
    invoke-virtual {v9}, Lap1;->r()J

    .line 663
    .line 664
    .line 665
    move-result-wide v14

    .line 666
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 667
    .line 668
    .line 669
    move-result-object v4

    .line 670
    int-to-long v14, v3

    .line 671
    invoke-static {v5, v14, v15, v4}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 672
    .line 673
    .line 674
    invoke-virtual {v1, v0, v5, v6}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 675
    .line 676
    .line 677
    goto/16 :goto_c

    .line 678
    .line 679
    :pswitch_10
    move-object/from16 v17, v5

    .line 680
    .line 681
    move-object/from16 v5, p1

    .line 682
    .line 683
    and-int v3, v3, v16

    .line 684
    .line 685
    const/4 v4, 0x5

    .line 686
    invoke-virtual {v7, v4}, Lwk;->Q(I)V

    .line 687
    .line 688
    .line 689
    invoke-virtual {v9}, Lap1;->p()F

    .line 690
    .line 691
    .line 692
    move-result v4

    .line 693
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 694
    .line 695
    .line 696
    move-result-object v4

    .line 697
    int-to-long v14, v3

    .line 698
    invoke-static {v5, v14, v15, v4}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 699
    .line 700
    .line 701
    invoke-virtual {v1, v0, v5, v6}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 702
    .line 703
    .line 704
    goto/16 :goto_c

    .line 705
    .line 706
    :pswitch_11
    move-object/from16 v17, v5

    .line 707
    .line 708
    move-object/from16 v5, p1

    .line 709
    .line 710
    and-int v3, v3, v16

    .line 711
    .line 712
    invoke-virtual {v7, v14}, Lwk;->Q(I)V

    .line 713
    .line 714
    .line 715
    invoke-virtual {v9}, Lap1;->o()D

    .line 716
    .line 717
    .line 718
    move-result-wide v14

    .line 719
    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 720
    .line 721
    .line 722
    move-result-object v4

    .line 723
    int-to-long v14, v3

    .line 724
    invoke-static {v5, v14, v15, v4}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 725
    .line 726
    .line 727
    invoke-virtual {v1, v0, v5, v6}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 728
    .line 729
    .line 730
    goto/16 :goto_c

    .line 731
    .line 732
    :pswitch_12
    move-object/from16 v17, v5

    .line 733
    .line 734
    move-object/from16 v5, p1

    .line 735
    .line 736
    invoke-virtual {v1, v6}, Lnq1;->D(I)Ljava/lang/Object;

    .line 737
    .line 738
    .line 739
    move-result-object v0

    .line 740
    invoke-virtual {v1, v6}, Lnq1;->k(I)I

    .line 741
    .line 742
    .line 743
    move-result v3

    .line 744
    and-int v3, v3, v16

    .line 745
    .line 746
    int-to-long v3, v3

    .line 747
    invoke-static {v3, v4, v5}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 748
    .line 749
    .line 750
    move-result-object v6

    .line 751
    if-nez v6, :cond_c

    .line 752
    .line 753
    sget-object v6, Lfq1;->k:Lfq1;

    .line 754
    .line 755
    invoke-virtual {v6}, Lfq1;->a()Lfq1;

    .line 756
    .line 757
    .line 758
    move-result-object v6

    .line 759
    invoke-static {v5, v3, v4, v6}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 760
    .line 761
    .line 762
    goto :goto_11

    .line 763
    :cond_c
    move-object v14, v6

    .line 764
    check-cast v14, Lfq1;

    .line 765
    .line 766
    iget-boolean v14, v14, Lfq1;->j:Z

    .line 767
    .line 768
    if-nez v14, :cond_d

    .line 769
    .line 770
    sget-object v14, Lfq1;->k:Lfq1;

    .line 771
    .line 772
    invoke-virtual {v14}, Lfq1;->a()Lfq1;

    .line 773
    .line 774
    .line 775
    move-result-object v14

    .line 776
    invoke-static {v14, v6}, Lmz;->p(Ljava/lang/Object;Ljava/lang/Object;)Lfq1;

    .line 777
    .line 778
    .line 779
    invoke-static {v5, v3, v4, v14}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 780
    .line 781
    .line 782
    move-object v6, v14

    .line 783
    :cond_d
    :goto_11
    check-cast v6, Lfq1;

    .line 784
    .line 785
    check-cast v0, Leq1;

    .line 786
    .line 787
    iget-object v0, v0, Leq1;->a:Lc9;

    .line 788
    .line 789
    invoke-virtual {v7, v6, v0, v8}, Lwk;->P(Lfq1;Lc9;Lgp1;)V

    .line 790
    .line 791
    .line 792
    goto/16 :goto_c

    .line 793
    .line 794
    :pswitch_13
    move-object/from16 v17, v5

    .line 795
    .line 796
    move-object/from16 v5, p1

    .line 797
    .line 798
    and-int v0, v3, v16

    .line 799
    .line 800
    invoke-virtual {v1, v6}, Lnq1;->C(I)Lvq1;

    .line 801
    .line 802
    .line 803
    move-result-object v3

    .line 804
    int-to-long v14, v0

    .line 805
    invoke-static {v14, v15, v5}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 806
    .line 807
    .line 808
    move-result-object v0

    .line 809
    invoke-virtual {v7, v0, v3, v8}, Lwk;->H(Lyp1;Lvq1;Lgp1;)V

    .line 810
    .line 811
    .line 812
    goto/16 :goto_c

    .line 813
    .line 814
    :pswitch_14
    move-object/from16 v17, v5

    .line 815
    .line 816
    move-object/from16 v5, p1

    .line 817
    .line 818
    and-int v0, v3, v16

    .line 819
    .line 820
    int-to-long v3, v0

    .line 821
    invoke-static {v3, v4, v5}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 822
    .line 823
    .line 824
    move-result-object v0

    .line 825
    invoke-virtual {v7, v0}, Lwk;->O(Lyp1;)V

    .line 826
    .line 827
    .line 828
    goto/16 :goto_c

    .line 829
    .line 830
    :pswitch_15
    move-object/from16 v17, v5

    .line 831
    .line 832
    move-object/from16 v5, p1

    .line 833
    .line 834
    and-int v0, v3, v16

    .line 835
    .line 836
    int-to-long v3, v0

    .line 837
    invoke-static {v3, v4, v5}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 838
    .line 839
    .line 840
    move-result-object v0

    .line 841
    invoke-virtual {v7, v0}, Lwk;->N(Lyp1;)V

    .line 842
    .line 843
    .line 844
    goto/16 :goto_c

    .line 845
    .line 846
    :pswitch_16
    move-object/from16 v17, v5

    .line 847
    .line 848
    move-object/from16 v5, p1

    .line 849
    .line 850
    and-int v0, v3, v16

    .line 851
    .line 852
    int-to-long v3, v0

    .line 853
    invoke-static {v3, v4, v5}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 854
    .line 855
    .line 856
    move-result-object v0

    .line 857
    invoke-virtual {v7, v0}, Lwk;->M(Lyp1;)V

    .line 858
    .line 859
    .line 860
    goto/16 :goto_c

    .line 861
    .line 862
    :pswitch_17
    move-object/from16 v17, v5

    .line 863
    .line 864
    move-object/from16 v5, p1

    .line 865
    .line 866
    and-int v0, v3, v16

    .line 867
    .line 868
    int-to-long v3, v0

    .line 869
    invoke-static {v3, v4, v5}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 870
    .line 871
    .line 872
    move-result-object v0

    .line 873
    invoke-virtual {v7, v0}, Lwk;->L(Lyp1;)V
    :try_end_7
    .catch Lzp1; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 874
    .line 875
    .line 876
    goto/16 :goto_c

    .line 877
    .line 878
    :pswitch_18
    move-object/from16 v17, v5

    .line 879
    .line 880
    move-object/from16 v5, p1

    .line 881
    .line 882
    and-int v3, v3, v16

    .line 883
    .line 884
    int-to-long v3, v3

    .line 885
    :try_start_8
    invoke-static {v3, v4, v5}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 886
    .line 887
    .line 888
    move-result-object v3

    .line 889
    invoke-virtual {v7, v3}, Lwk;->K(Lyp1;)V

    .line 890
    .line 891
    .line 892
    invoke-virtual {v1, v6}, Lnq1;->E(I)Llo1;

    .line 893
    .line 894
    .line 895
    move-result-object v4
    :try_end_8
    .catch Lzp1; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 896
    move-object v15, v1

    .line 897
    move-object v1, v5

    .line 898
    move-object/from16 v6, v17

    .line 899
    .line 900
    move-object v5, v2

    .line 901
    move v2, v0

    .line 902
    :try_start_9
    invoke-static/range {v1 .. v6}, Lwq1;->c(Ljava/lang/Object;ILyp1;Llo1;Ljava/lang/Object;Ltb0;)Ljava/lang/Object;

    .line 903
    .line 904
    .line 905
    move-result-object v2
    :try_end_9
    .catch Lzp1; {:try_start_9 .. :try_end_9} :catch_3
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 906
    move-object v5, v6

    .line 907
    move-object v1, v15

    .line 908
    goto/16 :goto_0

    .line 909
    .line 910
    :catchall_3
    move-exception v0

    .line 911
    move-object v2, v5

    .line 912
    move-object v5, v6

    .line 913
    goto/16 :goto_4

    .line 914
    .line 915
    :catch_3
    move-object/from16 v18, v5

    .line 916
    .line 917
    move-object/from16 v17, v6

    .line 918
    .line 919
    goto/16 :goto_18

    .line 920
    .line 921
    :catchall_4
    move-exception v0

    .line 922
    move-object v15, v1

    .line 923
    move-object v1, v5

    .line 924
    move-object/from16 v5, v17

    .line 925
    .line 926
    goto/16 :goto_4

    .line 927
    .line 928
    :catch_4
    move-object v15, v1

    .line 929
    move-object v1, v5

    .line 930
    move-object/from16 v18, v2

    .line 931
    .line 932
    goto/16 :goto_18

    .line 933
    .line 934
    :pswitch_19
    move-object v15, v1

    .line 935
    move-object/from16 v1, p1

    .line 936
    .line 937
    and-int v0, v3, v16

    .line 938
    .line 939
    int-to-long v3, v0

    .line 940
    :try_start_a
    invoke-static {v3, v4, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 941
    .line 942
    .line 943
    move-result-object v0

    .line 944
    invoke-virtual {v7, v0}, Lwk;->J(Lyp1;)V

    .line 945
    .line 946
    .line 947
    :goto_12
    move-object/from16 v18, v2

    .line 948
    .line 949
    move-object/from16 v17, v5

    .line 950
    .line 951
    goto/16 :goto_17

    .line 952
    .line 953
    :catchall_5
    move-exception v0

    .line 954
    goto/16 :goto_4

    .line 955
    .line 956
    :catch_5
    move-object/from16 v18, v2

    .line 957
    .line 958
    move-object/from16 v17, v5

    .line 959
    .line 960
    goto/16 :goto_18

    .line 961
    .line 962
    :pswitch_1a
    move-object v15, v1

    .line 963
    move-object/from16 v1, p1

    .line 964
    .line 965
    and-int v0, v3, v16

    .line 966
    .line 967
    int-to-long v3, v0

    .line 968
    invoke-static {v3, v4, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 969
    .line 970
    .line 971
    move-result-object v0

    .line 972
    invoke-virtual {v7, v0}, Lwk;->E(Lyp1;)V

    .line 973
    .line 974
    .line 975
    goto :goto_12

    .line 976
    :pswitch_1b
    move-object v15, v1

    .line 977
    move-object/from16 v1, p1

    .line 978
    .line 979
    and-int v0, v3, v16

    .line 980
    .line 981
    int-to-long v3, v0

    .line 982
    invoke-static {v3, v4, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 983
    .line 984
    .line 985
    move-result-object v0

    .line 986
    invoke-virtual {v7, v0}, Lwk;->D(Lyp1;)V

    .line 987
    .line 988
    .line 989
    goto :goto_12

    .line 990
    :pswitch_1c
    move-object v15, v1

    .line 991
    move-object/from16 v1, p1

    .line 992
    .line 993
    and-int v0, v3, v16

    .line 994
    .line 995
    int-to-long v3, v0

    .line 996
    invoke-static {v3, v4, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 997
    .line 998
    .line 999
    move-result-object v0

    .line 1000
    invoke-virtual {v7, v0}, Lwk;->C(Lyp1;)V

    .line 1001
    .line 1002
    .line 1003
    goto :goto_12

    .line 1004
    :pswitch_1d
    move-object v15, v1

    .line 1005
    move-object/from16 v1, p1

    .line 1006
    .line 1007
    and-int v0, v3, v16

    .line 1008
    .line 1009
    int-to-long v3, v0

    .line 1010
    invoke-static {v3, v4, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1011
    .line 1012
    .line 1013
    move-result-object v0

    .line 1014
    invoke-virtual {v7, v0}, Lwk;->B(Lyp1;)V

    .line 1015
    .line 1016
    .line 1017
    goto :goto_12

    .line 1018
    :pswitch_1e
    move-object v15, v1

    .line 1019
    move-object/from16 v1, p1

    .line 1020
    .line 1021
    and-int v0, v3, v16

    .line 1022
    .line 1023
    int-to-long v3, v0

    .line 1024
    invoke-static {v3, v4, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1025
    .line 1026
    .line 1027
    move-result-object v0

    .line 1028
    invoke-virtual {v7, v0}, Lwk;->b0(Lyp1;)V

    .line 1029
    .line 1030
    .line 1031
    goto :goto_12

    .line 1032
    :pswitch_1f
    move-object v15, v1

    .line 1033
    move-object/from16 v1, p1

    .line 1034
    .line 1035
    and-int v0, v3, v16

    .line 1036
    .line 1037
    int-to-long v3, v0

    .line 1038
    invoke-static {v3, v4, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1039
    .line 1040
    .line 1041
    move-result-object v0

    .line 1042
    invoke-virtual {v7, v0}, Lwk;->A(Lyp1;)V

    .line 1043
    .line 1044
    .line 1045
    goto :goto_12

    .line 1046
    :pswitch_20
    move-object v15, v1

    .line 1047
    move-object/from16 v1, p1

    .line 1048
    .line 1049
    and-int v0, v3, v16

    .line 1050
    .line 1051
    int-to-long v3, v0

    .line 1052
    invoke-static {v3, v4, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1053
    .line 1054
    .line 1055
    move-result-object v0

    .line 1056
    invoke-virtual {v7, v0}, Lwk;->a0(Lyp1;)V

    .line 1057
    .line 1058
    .line 1059
    goto :goto_12

    .line 1060
    :pswitch_21
    move-object v15, v1

    .line 1061
    move-object/from16 v1, p1

    .line 1062
    .line 1063
    and-int v0, v3, v16

    .line 1064
    .line 1065
    int-to-long v3, v0

    .line 1066
    invoke-static {v3, v4, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1067
    .line 1068
    .line 1069
    move-result-object v0

    .line 1070
    invoke-virtual {v7, v0}, Lwk;->Z(Lyp1;)V

    .line 1071
    .line 1072
    .line 1073
    goto :goto_12

    .line 1074
    :pswitch_22
    move-object v15, v1

    .line 1075
    move-object/from16 v1, p1

    .line 1076
    .line 1077
    and-int v0, v3, v16

    .line 1078
    .line 1079
    int-to-long v3, v0

    .line 1080
    invoke-static {v3, v4, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1081
    .line 1082
    .line 1083
    move-result-object v0

    .line 1084
    invoke-virtual {v7, v0}, Lwk;->O(Lyp1;)V

    .line 1085
    .line 1086
    .line 1087
    goto/16 :goto_12

    .line 1088
    .line 1089
    :pswitch_23
    move-object v15, v1

    .line 1090
    move-object/from16 v1, p1

    .line 1091
    .line 1092
    and-int v0, v3, v16

    .line 1093
    .line 1094
    int-to-long v3, v0

    .line 1095
    invoke-static {v3, v4, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1096
    .line 1097
    .line 1098
    move-result-object v0

    .line 1099
    invoke-virtual {v7, v0}, Lwk;->N(Lyp1;)V

    .line 1100
    .line 1101
    .line 1102
    goto/16 :goto_12

    .line 1103
    .line 1104
    :pswitch_24
    move-object v15, v1

    .line 1105
    move-object/from16 v1, p1

    .line 1106
    .line 1107
    and-int v0, v3, v16

    .line 1108
    .line 1109
    int-to-long v3, v0

    .line 1110
    invoke-static {v3, v4, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1111
    .line 1112
    .line 1113
    move-result-object v0

    .line 1114
    invoke-virtual {v7, v0}, Lwk;->M(Lyp1;)V

    .line 1115
    .line 1116
    .line 1117
    goto/16 :goto_12

    .line 1118
    .line 1119
    :pswitch_25
    move-object v15, v1

    .line 1120
    move-object/from16 v1, p1

    .line 1121
    .line 1122
    and-int v0, v3, v16

    .line 1123
    .line 1124
    int-to-long v3, v0

    .line 1125
    invoke-static {v3, v4, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1126
    .line 1127
    .line 1128
    move-result-object v0

    .line 1129
    invoke-virtual {v7, v0}, Lwk;->L(Lyp1;)V
    :try_end_a
    .catch Lzp1; {:try_start_a .. :try_end_a} :catch_5
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    .line 1130
    .line 1131
    .line 1132
    goto/16 :goto_12

    .line 1133
    .line 1134
    :pswitch_26
    move-object v15, v1

    .line 1135
    move-object/from16 v17, v5

    .line 1136
    .line 1137
    move-object/from16 v1, p1

    .line 1138
    .line 1139
    move-object v5, v2

    .line 1140
    move v2, v0

    .line 1141
    and-int v0, v3, v16

    .line 1142
    .line 1143
    int-to-long v3, v0

    .line 1144
    :try_start_b
    invoke-static {v3, v4, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1145
    .line 1146
    .line 1147
    move-result-object v3

    .line 1148
    invoke-virtual {v7, v3}, Lwk;->K(Lyp1;)V

    .line 1149
    .line 1150
    .line 1151
    invoke-virtual {v15, v6}, Lnq1;->E(I)Llo1;

    .line 1152
    .line 1153
    .line 1154
    move-result-object v4
    :try_end_b
    .catch Lzp1; {:try_start_b .. :try_end_b} :catch_6
    .catchall {:try_start_b .. :try_end_b} :catchall_7

    .line 1155
    move-object/from16 v6, v17

    .line 1156
    .line 1157
    :try_start_c
    invoke-static/range {v1 .. v6}, Lwq1;->c(Ljava/lang/Object;ILyp1;Llo1;Ljava/lang/Object;Ltb0;)Ljava/lang/Object;

    .line 1158
    .line 1159
    .line 1160
    move-result-object v2
    :try_end_c
    .catch Lzp1; {:try_start_c .. :try_end_c} :catch_3
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    .line 1161
    move-object/from16 v17, v6

    .line 1162
    .line 1163
    move-object v1, v15

    .line 1164
    goto/16 :goto_9

    .line 1165
    .line 1166
    :catchall_6
    move-exception v0

    .line 1167
    move-object/from16 v18, v5

    .line 1168
    .line 1169
    move-object/from16 v17, v6

    .line 1170
    .line 1171
    goto/16 :goto_d

    .line 1172
    .line 1173
    :catchall_7
    move-exception v0

    .line 1174
    move-object/from16 v18, v5

    .line 1175
    .line 1176
    goto/16 :goto_d

    .line 1177
    .line 1178
    :catch_6
    move-object/from16 v18, v5

    .line 1179
    .line 1180
    goto/16 :goto_18

    .line 1181
    .line 1182
    :pswitch_27
    move-object v15, v1

    .line 1183
    move-object/from16 v18, v2

    .line 1184
    .line 1185
    move-object/from16 v17, v5

    .line 1186
    .line 1187
    move-object/from16 v1, p1

    .line 1188
    .line 1189
    and-int v0, v3, v16

    .line 1190
    .line 1191
    int-to-long v2, v0

    .line 1192
    :try_start_d
    invoke-static {v2, v3, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1193
    .line 1194
    .line 1195
    move-result-object v0

    .line 1196
    invoke-virtual {v7, v0}, Lwk;->J(Lyp1;)V

    .line 1197
    .line 1198
    .line 1199
    goto/16 :goto_17

    .line 1200
    .line 1201
    :catchall_8
    move-exception v0

    .line 1202
    goto/16 :goto_d

    .line 1203
    .line 1204
    :pswitch_28
    move-object v15, v1

    .line 1205
    move-object/from16 v18, v2

    .line 1206
    .line 1207
    move-object/from16 v17, v5

    .line 1208
    .line 1209
    move-object/from16 v1, p1

    .line 1210
    .line 1211
    and-int v0, v3, v16

    .line 1212
    .line 1213
    int-to-long v2, v0

    .line 1214
    invoke-static {v2, v3, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1215
    .line 1216
    .line 1217
    move-result-object v0

    .line 1218
    invoke-virtual {v7, v0}, Lwk;->I(Lyp1;)V

    .line 1219
    .line 1220
    .line 1221
    goto/16 :goto_17

    .line 1222
    .line 1223
    :pswitch_29
    move-object v15, v1

    .line 1224
    move-object/from16 v18, v2

    .line 1225
    .line 1226
    move-object/from16 v17, v5

    .line 1227
    .line 1228
    move-object/from16 v1, p1

    .line 1229
    .line 1230
    invoke-virtual {v15, v6}, Lnq1;->C(I)Lvq1;

    .line 1231
    .line 1232
    .line 1233
    move-result-object v0

    .line 1234
    and-int v2, v3, v16

    .line 1235
    .line 1236
    int-to-long v2, v2

    .line 1237
    invoke-static {v2, v3, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1238
    .line 1239
    .line 1240
    move-result-object v2

    .line 1241
    invoke-virtual {v7, v2, v0, v8}, Lwk;->G(Lyp1;Lvq1;Lgp1;)V

    .line 1242
    .line 1243
    .line 1244
    goto/16 :goto_17

    .line 1245
    .line 1246
    :pswitch_2a
    move-object v15, v1

    .line 1247
    move-object/from16 v18, v2

    .line 1248
    .line 1249
    move-object/from16 v17, v5

    .line 1250
    .line 1251
    move-object/from16 v1, p1

    .line 1252
    .line 1253
    const/high16 v0, 0x20000000

    .line 1254
    .line 1255
    and-int/2addr v0, v3

    .line 1256
    if-eqz v0, :cond_e

    .line 1257
    .line 1258
    move v0, v14

    .line 1259
    goto :goto_13

    .line 1260
    :cond_e
    move v0, v13

    .line 1261
    :goto_13
    if-eqz v0, :cond_f

    .line 1262
    .line 1263
    and-int v0, v3, v16

    .line 1264
    .line 1265
    int-to-long v2, v0

    .line 1266
    invoke-static {v2, v3, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1267
    .line 1268
    .line 1269
    move-result-object v0

    .line 1270
    invoke-virtual {v7, v0, v14}, Lwk;->F(Lyp1;Z)V

    .line 1271
    .line 1272
    .line 1273
    goto/16 :goto_17

    .line 1274
    .line 1275
    :cond_f
    and-int v0, v3, v16

    .line 1276
    .line 1277
    int-to-long v2, v0

    .line 1278
    invoke-static {v2, v3, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1279
    .line 1280
    .line 1281
    move-result-object v0

    .line 1282
    invoke-virtual {v7, v0, v13}, Lwk;->F(Lyp1;Z)V

    .line 1283
    .line 1284
    .line 1285
    goto/16 :goto_17

    .line 1286
    .line 1287
    :pswitch_2b
    move-object v15, v1

    .line 1288
    move-object/from16 v18, v2

    .line 1289
    .line 1290
    move-object/from16 v17, v5

    .line 1291
    .line 1292
    move-object/from16 v1, p1

    .line 1293
    .line 1294
    and-int v0, v3, v16

    .line 1295
    .line 1296
    int-to-long v2, v0

    .line 1297
    invoke-static {v2, v3, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1298
    .line 1299
    .line 1300
    move-result-object v0

    .line 1301
    invoke-virtual {v7, v0}, Lwk;->E(Lyp1;)V

    .line 1302
    .line 1303
    .line 1304
    goto/16 :goto_17

    .line 1305
    .line 1306
    :pswitch_2c
    move-object v15, v1

    .line 1307
    move-object/from16 v18, v2

    .line 1308
    .line 1309
    move-object/from16 v17, v5

    .line 1310
    .line 1311
    move-object/from16 v1, p1

    .line 1312
    .line 1313
    and-int v0, v3, v16

    .line 1314
    .line 1315
    int-to-long v2, v0

    .line 1316
    invoke-static {v2, v3, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1317
    .line 1318
    .line 1319
    move-result-object v0

    .line 1320
    invoke-virtual {v7, v0}, Lwk;->D(Lyp1;)V

    .line 1321
    .line 1322
    .line 1323
    goto/16 :goto_17

    .line 1324
    .line 1325
    :pswitch_2d
    move-object v15, v1

    .line 1326
    move-object/from16 v18, v2

    .line 1327
    .line 1328
    move-object/from16 v17, v5

    .line 1329
    .line 1330
    move-object/from16 v1, p1

    .line 1331
    .line 1332
    and-int v0, v3, v16

    .line 1333
    .line 1334
    int-to-long v2, v0

    .line 1335
    invoke-static {v2, v3, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1336
    .line 1337
    .line 1338
    move-result-object v0

    .line 1339
    invoke-virtual {v7, v0}, Lwk;->C(Lyp1;)V

    .line 1340
    .line 1341
    .line 1342
    goto/16 :goto_17

    .line 1343
    .line 1344
    :pswitch_2e
    move-object v15, v1

    .line 1345
    move-object/from16 v18, v2

    .line 1346
    .line 1347
    move-object/from16 v17, v5

    .line 1348
    .line 1349
    move-object/from16 v1, p1

    .line 1350
    .line 1351
    and-int v0, v3, v16

    .line 1352
    .line 1353
    int-to-long v2, v0

    .line 1354
    invoke-static {v2, v3, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1355
    .line 1356
    .line 1357
    move-result-object v0

    .line 1358
    invoke-virtual {v7, v0}, Lwk;->B(Lyp1;)V

    .line 1359
    .line 1360
    .line 1361
    goto/16 :goto_17

    .line 1362
    .line 1363
    :pswitch_2f
    move-object v15, v1

    .line 1364
    move-object/from16 v18, v2

    .line 1365
    .line 1366
    move-object/from16 v17, v5

    .line 1367
    .line 1368
    move-object/from16 v1, p1

    .line 1369
    .line 1370
    and-int v0, v3, v16

    .line 1371
    .line 1372
    int-to-long v2, v0

    .line 1373
    invoke-static {v2, v3, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1374
    .line 1375
    .line 1376
    move-result-object v0

    .line 1377
    invoke-virtual {v7, v0}, Lwk;->b0(Lyp1;)V

    .line 1378
    .line 1379
    .line 1380
    goto/16 :goto_17

    .line 1381
    .line 1382
    :pswitch_30
    move-object v15, v1

    .line 1383
    move-object/from16 v18, v2

    .line 1384
    .line 1385
    move-object/from16 v17, v5

    .line 1386
    .line 1387
    move-object/from16 v1, p1

    .line 1388
    .line 1389
    and-int v0, v3, v16

    .line 1390
    .line 1391
    int-to-long v2, v0

    .line 1392
    invoke-static {v2, v3, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1393
    .line 1394
    .line 1395
    move-result-object v0

    .line 1396
    invoke-virtual {v7, v0}, Lwk;->A(Lyp1;)V

    .line 1397
    .line 1398
    .line 1399
    goto/16 :goto_17

    .line 1400
    .line 1401
    :pswitch_31
    move-object v15, v1

    .line 1402
    move-object/from16 v18, v2

    .line 1403
    .line 1404
    move-object/from16 v17, v5

    .line 1405
    .line 1406
    move-object/from16 v1, p1

    .line 1407
    .line 1408
    and-int v0, v3, v16

    .line 1409
    .line 1410
    int-to-long v2, v0

    .line 1411
    invoke-static {v2, v3, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1412
    .line 1413
    .line 1414
    move-result-object v0

    .line 1415
    invoke-virtual {v7, v0}, Lwk;->a0(Lyp1;)V

    .line 1416
    .line 1417
    .line 1418
    goto/16 :goto_17

    .line 1419
    .line 1420
    :pswitch_32
    move-object v15, v1

    .line 1421
    move-object/from16 v18, v2

    .line 1422
    .line 1423
    move-object/from16 v17, v5

    .line 1424
    .line 1425
    move-object/from16 v1, p1

    .line 1426
    .line 1427
    and-int v0, v3, v16

    .line 1428
    .line 1429
    int-to-long v2, v0

    .line 1430
    invoke-static {v2, v3, v1}, Lok0;->z(JLjava/lang/Object;)Lyp1;

    .line 1431
    .line 1432
    .line 1433
    move-result-object v0

    .line 1434
    invoke-virtual {v7, v0}, Lwk;->Z(Lyp1;)V
    :try_end_d
    .catch Lzp1; {:try_start_d .. :try_end_d} :catch_8
    .catchall {:try_start_d .. :try_end_d} :catchall_8

    .line 1435
    .line 1436
    .line 1437
    goto/16 :goto_17

    .line 1438
    .line 1439
    :pswitch_33
    move-object/from16 v18, v2

    .line 1440
    .line 1441
    move-object/from16 v17, v5

    .line 1442
    .line 1443
    move-object v2, v1

    .line 1444
    move-object/from16 v1, p1

    .line 1445
    .line 1446
    :try_start_e
    invoke-virtual {v2, v6, v1}, Lnq1;->F(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1447
    .line 1448
    .line 1449
    move-result-object v0

    .line 1450
    check-cast v0, Lqo1;

    .line 1451
    .line 1452
    invoke-virtual {v2, v6}, Lnq1;->C(I)Lvq1;

    .line 1453
    .line 1454
    .line 1455
    move-result-object v3

    .line 1456
    invoke-virtual {v7, v15}, Lwk;->Q(I)V

    .line 1457
    .line 1458
    .line 1459
    invoke-virtual {v7, v0, v3, v8}, Lwk;->S(Ljava/lang/Object;Lvq1;Lgp1;)V

    .line 1460
    .line 1461
    .line 1462
    invoke-virtual {v2, v1, v6, v0}, Lnq1;->G(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 1463
    .line 1464
    .line 1465
    :goto_14
    move-object v15, v2

    .line 1466
    goto/16 :goto_17

    .line 1467
    .line 1468
    :catch_7
    move-object v15, v2

    .line 1469
    goto/16 :goto_18

    .line 1470
    .line 1471
    :pswitch_34
    move-object/from16 v18, v2

    .line 1472
    .line 1473
    move-object/from16 v17, v5

    .line 1474
    .line 1475
    move-object v2, v1

    .line 1476
    move-object/from16 v1, p1

    .line 1477
    .line 1478
    and-int v0, v3, v16

    .line 1479
    .line 1480
    invoke-virtual {v7, v13}, Lwk;->Q(I)V

    .line 1481
    .line 1482
    .line 1483
    invoke-virtual {v9}, Lap1;->F()J

    .line 1484
    .line 1485
    .line 1486
    move-result-wide v3

    .line 1487
    int-to-long v14, v0

    .line 1488
    invoke-static {v1, v14, v15, v3, v4}, Ler1;->g(Ljava/lang/Object;JJ)V

    .line 1489
    .line 1490
    .line 1491
    invoke-virtual {v2, v6, v1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 1492
    .line 1493
    .line 1494
    goto :goto_14

    .line 1495
    :pswitch_35
    move-object/from16 v18, v2

    .line 1496
    .line 1497
    move-object/from16 v17, v5

    .line 1498
    .line 1499
    move-object v2, v1

    .line 1500
    move-object/from16 v1, p1

    .line 1501
    .line 1502
    and-int v0, v3, v16

    .line 1503
    .line 1504
    invoke-virtual {v7, v13}, Lwk;->Q(I)V

    .line 1505
    .line 1506
    .line 1507
    invoke-virtual {v9}, Lap1;->E()I

    .line 1508
    .line 1509
    .line 1510
    move-result v3

    .line 1511
    int-to-long v4, v0

    .line 1512
    invoke-static {v1, v4, v5, v3}, Ler1;->e(Ljava/lang/Object;JI)V

    .line 1513
    .line 1514
    .line 1515
    invoke-virtual {v2, v6, v1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 1516
    .line 1517
    .line 1518
    goto :goto_14

    .line 1519
    :pswitch_36
    move-object/from16 v18, v2

    .line 1520
    .line 1521
    move-object/from16 v17, v5

    .line 1522
    .line 1523
    move-object v2, v1

    .line 1524
    move-object/from16 v1, p1

    .line 1525
    .line 1526
    and-int v0, v3, v16

    .line 1527
    .line 1528
    invoke-virtual {v7, v14}, Lwk;->Q(I)V

    .line 1529
    .line 1530
    .line 1531
    invoke-virtual {v9}, Lap1;->D()J

    .line 1532
    .line 1533
    .line 1534
    move-result-wide v3

    .line 1535
    int-to-long v14, v0

    .line 1536
    invoke-static {v1, v14, v15, v3, v4}, Ler1;->g(Ljava/lang/Object;JJ)V

    .line 1537
    .line 1538
    .line 1539
    invoke-virtual {v2, v6, v1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 1540
    .line 1541
    .line 1542
    goto :goto_14

    .line 1543
    :pswitch_37
    move-object/from16 v18, v2

    .line 1544
    .line 1545
    move-object/from16 v17, v5

    .line 1546
    .line 1547
    move-object v2, v1

    .line 1548
    move-object/from16 v1, p1

    .line 1549
    .line 1550
    and-int v0, v3, v16

    .line 1551
    .line 1552
    const/4 v4, 0x5

    .line 1553
    invoke-virtual {v7, v4}, Lwk;->Q(I)V

    .line 1554
    .line 1555
    .line 1556
    invoke-virtual {v9}, Lap1;->C()I

    .line 1557
    .line 1558
    .line 1559
    move-result v3

    .line 1560
    int-to-long v4, v0

    .line 1561
    invoke-static {v1, v4, v5, v3}, Ler1;->e(Ljava/lang/Object;JI)V

    .line 1562
    .line 1563
    .line 1564
    invoke-virtual {v2, v6, v1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 1565
    .line 1566
    .line 1567
    goto :goto_14

    .line 1568
    :pswitch_38
    move-object/from16 v18, v2

    .line 1569
    .line 1570
    move-object/from16 v17, v5

    .line 1571
    .line 1572
    move-object v2, v1

    .line 1573
    move-object/from16 v1, p1

    .line 1574
    .line 1575
    invoke-virtual {v7, v13}, Lwk;->Q(I)V

    .line 1576
    .line 1577
    .line 1578
    invoke-virtual {v9}, Lap1;->B()I

    .line 1579
    .line 1580
    .line 1581
    move-result v4

    .line 1582
    invoke-virtual {v2, v6}, Lnq1;->E(I)Llo1;

    .line 1583
    .line 1584
    .line 1585
    move-result-object v5

    .line 1586
    if-eqz v5, :cond_12

    .line 1587
    .line 1588
    invoke-virtual {v5, v4}, Llo1;->a(I)Z

    .line 1589
    .line 1590
    .line 1591
    move-result v5

    .line 1592
    if-eqz v5, :cond_10

    .line 1593
    .line 1594
    goto :goto_16

    .line 1595
    :cond_10
    sget-object v3, Lwq1;->a:Ltb0;

    .line 1596
    .line 1597
    if-nez v18, :cond_11

    .line 1598
    .line 1599
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1600
    .line 1601
    .line 1602
    invoke-static {v1}, Ltb0;->n(Ljava/lang/Object;)Lcr1;

    .line 1603
    .line 1604
    .line 1605
    move-result-object v3

    .line 1606
    goto :goto_15

    .line 1607
    :cond_11
    move-object/from16 v3, v18

    .line 1608
    .line 1609
    :goto_15
    int-to-long v4, v4

    .line 1610
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1611
    .line 1612
    .line 1613
    move-object v6, v3

    .line 1614
    check-cast v6, Lcr1;

    .line 1615
    .line 1616
    shl-int/lit8 v0, v0, 0x3

    .line 1617
    .line 1618
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 1619
    .line 1620
    .line 1621
    move-result-object v4

    .line 1622
    invoke-virtual {v6, v0, v4}, Lcr1;->d(ILjava/lang/Object;)V

    .line 1623
    .line 1624
    .line 1625
    move-object v1, v2

    .line 1626
    goto/16 :goto_f

    .line 1627
    .line 1628
    :cond_12
    :goto_16
    and-int v0, v3, v16

    .line 1629
    .line 1630
    int-to-long v14, v0

    .line 1631
    invoke-static {v1, v14, v15, v4}, Ler1;->e(Ljava/lang/Object;JI)V

    .line 1632
    .line 1633
    .line 1634
    invoke-virtual {v2, v6, v1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 1635
    .line 1636
    .line 1637
    goto/16 :goto_14

    .line 1638
    .line 1639
    :pswitch_39
    move-object/from16 v18, v2

    .line 1640
    .line 1641
    move-object/from16 v17, v5

    .line 1642
    .line 1643
    move-object v2, v1

    .line 1644
    move-object/from16 v1, p1

    .line 1645
    .line 1646
    and-int v0, v3, v16

    .line 1647
    .line 1648
    invoke-virtual {v7, v13}, Lwk;->Q(I)V

    .line 1649
    .line 1650
    .line 1651
    invoke-virtual {v9}, Lap1;->A()I

    .line 1652
    .line 1653
    .line 1654
    move-result v3

    .line 1655
    int-to-long v4, v0

    .line 1656
    invoke-static {v1, v4, v5, v3}, Ler1;->e(Ljava/lang/Object;JI)V

    .line 1657
    .line 1658
    .line 1659
    invoke-virtual {v2, v6, v1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 1660
    .line 1661
    .line 1662
    goto/16 :goto_14

    .line 1663
    .line 1664
    :pswitch_3a
    move-object/from16 v18, v2

    .line 1665
    .line 1666
    move-object/from16 v17, v5

    .line 1667
    .line 1668
    move-object v2, v1

    .line 1669
    move-object/from16 v1, p1

    .line 1670
    .line 1671
    and-int v0, v3, v16

    .line 1672
    .line 1673
    invoke-virtual {v7}, Lwk;->Y()Lxo1;

    .line 1674
    .line 1675
    .line 1676
    move-result-object v3

    .line 1677
    int-to-long v4, v0

    .line 1678
    invoke-static {v1, v4, v5, v3}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 1679
    .line 1680
    .line 1681
    invoke-virtual {v2, v6, v1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 1682
    .line 1683
    .line 1684
    goto/16 :goto_14

    .line 1685
    .line 1686
    :pswitch_3b
    move-object/from16 v18, v2

    .line 1687
    .line 1688
    move-object/from16 v17, v5

    .line 1689
    .line 1690
    move-object v2, v1

    .line 1691
    move-object/from16 v1, p1

    .line 1692
    .line 1693
    invoke-virtual {v2, v6, v1}, Lnq1;->F(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1694
    .line 1695
    .line 1696
    move-result-object v0

    .line 1697
    check-cast v0, Lqo1;

    .line 1698
    .line 1699
    invoke-virtual {v2, v6}, Lnq1;->C(I)Lvq1;

    .line 1700
    .line 1701
    .line 1702
    move-result-object v3

    .line 1703
    const/4 v14, 0x2

    .line 1704
    invoke-virtual {v7, v14}, Lwk;->Q(I)V

    .line 1705
    .line 1706
    .line 1707
    invoke-virtual {v7, v0, v3, v8}, Lwk;->R(Ljava/lang/Object;Lvq1;Lgp1;)V

    .line 1708
    .line 1709
    .line 1710
    invoke-virtual {v2, v1, v6, v0}, Lnq1;->G(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 1711
    .line 1712
    .line 1713
    goto/16 :goto_14

    .line 1714
    .line 1715
    :pswitch_3c
    move-object/from16 v18, v2

    .line 1716
    .line 1717
    move-object/from16 v17, v5

    .line 1718
    .line 1719
    move-object v2, v1

    .line 1720
    move-object/from16 v1, p1

    .line 1721
    .line 1722
    invoke-virtual {v2, v3, v7, v1}, Lnq1;->K(ILwk;Ljava/lang/Object;)V

    .line 1723
    .line 1724
    .line 1725
    invoke-virtual {v2, v6, v1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 1726
    .line 1727
    .line 1728
    goto/16 :goto_14

    .line 1729
    .line 1730
    :pswitch_3d
    move-object/from16 v18, v2

    .line 1731
    .line 1732
    move-object/from16 v17, v5

    .line 1733
    .line 1734
    move-object v2, v1

    .line 1735
    move-object/from16 v1, p1

    .line 1736
    .line 1737
    and-int v0, v3, v16

    .line 1738
    .line 1739
    invoke-virtual {v7, v13}, Lwk;->Q(I)V

    .line 1740
    .line 1741
    .line 1742
    invoke-virtual {v9}, Lap1;->v()Z

    .line 1743
    .line 1744
    .line 1745
    move-result v3

    .line 1746
    int-to-long v4, v0

    .line 1747
    sget-object v0, Ler1;->c:Llf1;

    .line 1748
    .line 1749
    invoke-virtual {v0, v1, v4, v5, v3}, Llf1;->m(Ljava/lang/Object;JZ)V

    .line 1750
    .line 1751
    .line 1752
    invoke-virtual {v2, v6, v1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 1753
    .line 1754
    .line 1755
    goto/16 :goto_14

    .line 1756
    .line 1757
    :pswitch_3e
    move-object/from16 v18, v2

    .line 1758
    .line 1759
    move-object/from16 v17, v5

    .line 1760
    .line 1761
    move-object v2, v1

    .line 1762
    move-object/from16 v1, p1

    .line 1763
    .line 1764
    and-int v0, v3, v16

    .line 1765
    .line 1766
    const/4 v4, 0x5

    .line 1767
    invoke-virtual {v7, v4}, Lwk;->Q(I)V

    .line 1768
    .line 1769
    .line 1770
    invoke-virtual {v9}, Lap1;->u()I

    .line 1771
    .line 1772
    .line 1773
    move-result v3

    .line 1774
    int-to-long v4, v0

    .line 1775
    invoke-static {v1, v4, v5, v3}, Ler1;->e(Ljava/lang/Object;JI)V

    .line 1776
    .line 1777
    .line 1778
    invoke-virtual {v2, v6, v1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 1779
    .line 1780
    .line 1781
    goto/16 :goto_14

    .line 1782
    .line 1783
    :pswitch_3f
    move-object/from16 v18, v2

    .line 1784
    .line 1785
    move-object/from16 v17, v5

    .line 1786
    .line 1787
    move-object v2, v1

    .line 1788
    move-object/from16 v1, p1

    .line 1789
    .line 1790
    and-int v0, v3, v16

    .line 1791
    .line 1792
    invoke-virtual {v7, v14}, Lwk;->Q(I)V

    .line 1793
    .line 1794
    .line 1795
    invoke-virtual {v9}, Lap1;->t()J

    .line 1796
    .line 1797
    .line 1798
    move-result-wide v3

    .line 1799
    int-to-long v14, v0

    .line 1800
    invoke-static {v1, v14, v15, v3, v4}, Ler1;->g(Ljava/lang/Object;JJ)V

    .line 1801
    .line 1802
    .line 1803
    invoke-virtual {v2, v6, v1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 1804
    .line 1805
    .line 1806
    goto/16 :goto_14

    .line 1807
    .line 1808
    :pswitch_40
    move-object/from16 v18, v2

    .line 1809
    .line 1810
    move-object/from16 v17, v5

    .line 1811
    .line 1812
    move-object v2, v1

    .line 1813
    move-object/from16 v1, p1

    .line 1814
    .line 1815
    and-int v0, v3, v16

    .line 1816
    .line 1817
    invoke-virtual {v7, v13}, Lwk;->Q(I)V

    .line 1818
    .line 1819
    .line 1820
    invoke-virtual {v9}, Lap1;->s()I

    .line 1821
    .line 1822
    .line 1823
    move-result v3

    .line 1824
    int-to-long v4, v0

    .line 1825
    invoke-static {v1, v4, v5, v3}, Ler1;->e(Ljava/lang/Object;JI)V

    .line 1826
    .line 1827
    .line 1828
    invoke-virtual {v2, v6, v1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 1829
    .line 1830
    .line 1831
    goto/16 :goto_14

    .line 1832
    .line 1833
    :pswitch_41
    move-object/from16 v18, v2

    .line 1834
    .line 1835
    move-object/from16 v17, v5

    .line 1836
    .line 1837
    move-object v2, v1

    .line 1838
    move-object/from16 v1, p1

    .line 1839
    .line 1840
    and-int v0, v3, v16

    .line 1841
    .line 1842
    invoke-virtual {v7, v13}, Lwk;->Q(I)V

    .line 1843
    .line 1844
    .line 1845
    invoke-virtual {v9}, Lap1;->q()J

    .line 1846
    .line 1847
    .line 1848
    move-result-wide v3

    .line 1849
    int-to-long v14, v0

    .line 1850
    invoke-static {v1, v14, v15, v3, v4}, Ler1;->g(Ljava/lang/Object;JJ)V

    .line 1851
    .line 1852
    .line 1853
    invoke-virtual {v2, v6, v1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 1854
    .line 1855
    .line 1856
    goto/16 :goto_14

    .line 1857
    .line 1858
    :pswitch_42
    move-object/from16 v18, v2

    .line 1859
    .line 1860
    move-object/from16 v17, v5

    .line 1861
    .line 1862
    move-object v2, v1

    .line 1863
    move-object/from16 v1, p1

    .line 1864
    .line 1865
    and-int v0, v3, v16

    .line 1866
    .line 1867
    invoke-virtual {v7, v13}, Lwk;->Q(I)V

    .line 1868
    .line 1869
    .line 1870
    invoke-virtual {v9}, Lap1;->r()J

    .line 1871
    .line 1872
    .line 1873
    move-result-wide v3

    .line 1874
    int-to-long v14, v0

    .line 1875
    invoke-static {v1, v14, v15, v3, v4}, Ler1;->g(Ljava/lang/Object;JJ)V

    .line 1876
    .line 1877
    .line 1878
    invoke-virtual {v2, v6, v1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 1879
    .line 1880
    .line 1881
    goto/16 :goto_14

    .line 1882
    .line 1883
    :pswitch_43
    move-object/from16 v18, v2

    .line 1884
    .line 1885
    move-object/from16 v17, v5

    .line 1886
    .line 1887
    move-object v2, v1

    .line 1888
    move-object/from16 v1, p1

    .line 1889
    .line 1890
    and-int v0, v3, v16

    .line 1891
    .line 1892
    const/4 v4, 0x5

    .line 1893
    invoke-virtual {v7, v4}, Lwk;->Q(I)V

    .line 1894
    .line 1895
    .line 1896
    invoke-virtual {v9}, Lap1;->p()F

    .line 1897
    .line 1898
    .line 1899
    move-result v3

    .line 1900
    int-to-long v4, v0

    .line 1901
    sget-object v0, Ler1;->c:Llf1;

    .line 1902
    .line 1903
    invoke-virtual {v0, v1, v4, v5, v3}, Llf1;->o(Ljava/lang/Object;JF)V

    .line 1904
    .line 1905
    .line 1906
    invoke-virtual {v2, v6, v1}, Lnq1;->t(ILjava/lang/Object;)V
    :try_end_e
    .catch Lzp1; {:try_start_e .. :try_end_e} :catch_7
    .catchall {:try_start_e .. :try_end_e} :catchall_8

    .line 1907
    .line 1908
    .line 1909
    goto/16 :goto_14

    .line 1910
    .line 1911
    :pswitch_44
    move-object/from16 v18, v2

    .line 1912
    .line 1913
    move-object/from16 v17, v5

    .line 1914
    .line 1915
    move-object v2, v1

    .line 1916
    move-object/from16 v1, p1

    .line 1917
    .line 1918
    and-int v0, v3, v16

    .line 1919
    .line 1920
    :try_start_f
    invoke-virtual {v7, v14}, Lwk;->Q(I)V

    .line 1921
    .line 1922
    .line 1923
    invoke-virtual {v9}, Lap1;->o()D

    .line 1924
    .line 1925
    .line 1926
    move-result-wide v4

    .line 1927
    int-to-long v14, v0

    .line 1928
    sget-object v0, Ler1;->c:Llf1;
    :try_end_f
    .catch Lzp1; {:try_start_f .. :try_end_f} :catch_7
    .catchall {:try_start_f .. :try_end_f} :catchall_9

    .line 1929
    .line 1930
    move-wide/from16 v19, v14

    .line 1931
    .line 1932
    move-object v15, v2

    .line 1933
    move-wide/from16 v2, v19

    .line 1934
    .line 1935
    :try_start_10
    invoke-virtual/range {v0 .. v5}, Llf1;->q(Ljava/lang/Object;JD)V

    .line 1936
    .line 1937
    .line 1938
    invoke-virtual {v15, v6, v1}, Lnq1;->t(ILjava/lang/Object;)V
    :try_end_10
    .catch Lzp1; {:try_start_10 .. :try_end_10} :catch_8
    .catchall {:try_start_10 .. :try_end_10} :catchall_8

    .line 1939
    .line 1940
    .line 1941
    :goto_17
    move-object v1, v15

    .line 1942
    move-object/from16 v5, v17

    .line 1943
    .line 1944
    move-object/from16 v2, v18

    .line 1945
    .line 1946
    goto/16 :goto_0

    .line 1947
    .line 1948
    :catchall_9
    move-exception v0

    .line 1949
    move-object v15, v2

    .line 1950
    goto/16 :goto_d

    .line 1951
    .line 1952
    :catchall_a
    move-exception v0

    .line 1953
    move-object v15, v1

    .line 1954
    move-object/from16 v18, v2

    .line 1955
    .line 1956
    move-object/from16 v17, v5

    .line 1957
    .line 1958
    move-object/from16 v1, p1

    .line 1959
    .line 1960
    goto :goto_1c

    .line 1961
    :catch_8
    :goto_18
    move-object/from16 v2, v18

    .line 1962
    .line 1963
    :goto_19
    if-nez v2, :cond_13

    .line 1964
    .line 1965
    :try_start_11
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1966
    .line 1967
    .line 1968
    invoke-static {v1}, Ltb0;->n(Ljava/lang/Object;)Lcr1;

    .line 1969
    .line 1970
    .line 1971
    move-result-object v0

    .line 1972
    move-object v2, v0

    .line 1973
    :cond_13
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1974
    .line 1975
    .line 1976
    invoke-static {v13, v7, v2}, Ltb0;->o(ILwk;Ljava/lang/Object;)Z

    .line 1977
    .line 1978
    .line 1979
    move-result v0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_b

    .line 1980
    if-nez v0, :cond_16

    .line 1981
    .line 1982
    move-object v4, v2

    .line 1983
    :goto_1a
    if-ge v12, v11, :cond_7

    .line 1984
    .line 1985
    aget v3, v10, v12

    .line 1986
    .line 1987
    move-object/from16 v6, p1

    .line 1988
    .line 1989
    move-object v2, v1

    .line 1990
    move-object v1, v15

    .line 1991
    move-object/from16 v5, v17

    .line 1992
    .line 1993
    invoke-virtual/range {v1 .. v6}, Lnq1;->J(Ljava/lang/Object;ILjava/lang/Object;Ltb0;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1994
    .line 1995
    .line 1996
    move-result-object v4

    .line 1997
    add-int/lit8 v12, v12, 0x1

    .line 1998
    .line 1999
    move-object/from16 v15, p0

    .line 2000
    .line 2001
    move-object/from16 v1, p1

    .line 2002
    .line 2003
    goto :goto_1a

    .line 2004
    :cond_14
    :goto_1b
    if-eqz v4, :cond_15

    .line 2005
    .line 2006
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2007
    .line 2008
    .line 2009
    check-cast v4, Lcr1;

    .line 2010
    .line 2011
    move-object/from16 v0, p1

    .line 2012
    .line 2013
    check-cast v0, Lnp1;

    .line 2014
    .line 2015
    iput-object v4, v0, Lnp1;->zzc:Lcr1;

    .line 2016
    .line 2017
    :cond_15
    return-void

    .line 2018
    :cond_16
    move-object/from16 v1, p0

    .line 2019
    .line 2020
    goto/16 :goto_9

    .line 2021
    .line 2022
    :catchall_b
    move-exception v0

    .line 2023
    goto/16 :goto_a

    .line 2024
    .line 2025
    :goto_1c
    move-object/from16 v2, v18

    .line 2026
    .line 2027
    :goto_1d
    move-object v4, v2

    .line 2028
    :goto_1e
    if-ge v12, v11, :cond_17

    .line 2029
    .line 2030
    aget v3, v10, v12

    .line 2031
    .line 2032
    move-object/from16 v6, p1

    .line 2033
    .line 2034
    move-object/from16 v1, p0

    .line 2035
    .line 2036
    move-object/from16 v2, p1

    .line 2037
    .line 2038
    invoke-virtual/range {v1 .. v6}, Lnq1;->J(Ljava/lang/Object;ILjava/lang/Object;Ltb0;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2039
    .line 2040
    .line 2041
    move-result-object v4

    .line 2042
    add-int/lit8 v12, v12, 0x1

    .line 2043
    .line 2044
    goto :goto_1e

    .line 2045
    :cond_17
    if-eqz v4, :cond_18

    .line 2046
    .line 2047
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2048
    .line 2049
    .line 2050
    check-cast v4, Lcr1;

    .line 2051
    .line 2052
    move-object/from16 v1, p1

    .line 2053
    .line 2054
    check-cast v1, Lnp1;

    .line 2055
    .line 2056
    iput-object v4, v1, Lnp1;->zzc:Lcr1;

    .line 2057
    .line 2058
    :cond_18
    throw v0

    .line 2059
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final e(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 10

    .line 1
    invoke-static {p1}, Lnq1;->n(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    iget-object v1, p0, Lnq1;->a:[I

    .line 9
    .line 10
    array-length v2, v1

    .line 11
    if-ge v0, v2, :cond_4

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lnq1;->k(I)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const v3, 0xfffff

    .line 18
    .line 19
    .line 20
    and-int/2addr v3, v2

    .line 21
    invoke-static {v2}, Lnq1;->l(I)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    aget v1, v1, v0

    .line 26
    .line 27
    int-to-long v6, v3

    .line 28
    packed-switch v2, :pswitch_data_0

    .line 29
    .line 30
    .line 31
    :cond_0
    :goto_1
    move-object v5, p1

    .line 32
    goto/16 :goto_3

    .line 33
    .line 34
    :pswitch_0
    invoke-virtual {p0, p1, v0, p2}, Lnq1;->B(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :pswitch_1
    invoke-virtual {p0, v1, p2, v0}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    invoke-static {v6, v7, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-static {p1, v6, v7, v2}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v1, p1, v0}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :pswitch_2
    invoke-virtual {p0, p1, v0, p2}, Lnq1;->B(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :pswitch_3
    invoke-virtual {p0, v1, p2, v0}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_0

    .line 64
    .line 65
    invoke-static {v6, v7, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-static {p1, v6, v7, v2}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v1, p1, v0}, Lnq1;->v(ILjava/lang/Object;I)V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :pswitch_4
    sget-object v1, Lwq1;->a:Ltb0;

    .line 77
    .line 78
    invoke-static {v6, v7, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-static {v6, v7, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-static {v1, v2}, Lmz;->p(Ljava/lang/Object;Ljava/lang/Object;)Lfq1;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-static {p1, v6, v7, v1}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :pswitch_5
    invoke-static {v6, v7, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    check-cast v1, Lyp1;

    .line 99
    .line 100
    invoke-static {v6, v7, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    check-cast v2, Lyp1;

    .line 105
    .line 106
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    if-lez v3, :cond_2

    .line 115
    .line 116
    if-lez v4, :cond_2

    .line 117
    .line 118
    move-object v5, v1

    .line 119
    check-cast v5, Lro1;

    .line 120
    .line 121
    iget-boolean v5, v5, Lro1;->j:Z

    .line 122
    .line 123
    if-nez v5, :cond_1

    .line 124
    .line 125
    add-int/2addr v4, v3

    .line 126
    invoke-interface {v1, v4}, Lyp1;->l(I)Lyp1;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    :cond_1
    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 131
    .line 132
    .line 133
    :cond_2
    if-gtz v3, :cond_3

    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_3
    move-object v2, v1

    .line 137
    :goto_2
    invoke-static {p1, v6, v7, v2}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :pswitch_6
    invoke-virtual {p0, p1, v0, p2}, Lnq1;->A(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 142
    .line 143
    .line 144
    goto :goto_1

    .line 145
    :pswitch_7
    invoke-virtual {p0, v0, p2}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    if-eqz v1, :cond_0

    .line 150
    .line 151
    invoke-static {v6, v7, p2}, Ler1;->f(JLjava/lang/Object;)J

    .line 152
    .line 153
    .line 154
    move-result-wide v1

    .line 155
    invoke-static {p1, v6, v7, v1, v2}, Ler1;->g(Ljava/lang/Object;JJ)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0, v0, p1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    goto/16 :goto_1

    .line 162
    .line 163
    :pswitch_8
    invoke-virtual {p0, v0, p2}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    if-eqz v1, :cond_0

    .line 168
    .line 169
    invoke-static {v6, v7, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    invoke-static {p1, v6, v7, v1}, Ler1;->e(Ljava/lang/Object;JI)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0, v0, p1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    goto/16 :goto_1

    .line 180
    .line 181
    :pswitch_9
    invoke-virtual {p0, v0, p2}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    if-eqz v1, :cond_0

    .line 186
    .line 187
    invoke-static {v6, v7, p2}, Ler1;->f(JLjava/lang/Object;)J

    .line 188
    .line 189
    .line 190
    move-result-wide v1

    .line 191
    invoke-static {p1, v6, v7, v1, v2}, Ler1;->g(Ljava/lang/Object;JJ)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0, v0, p1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 195
    .line 196
    .line 197
    goto/16 :goto_1

    .line 198
    .line 199
    :pswitch_a
    invoke-virtual {p0, v0, p2}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    if-eqz v1, :cond_0

    .line 204
    .line 205
    invoke-static {v6, v7, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    invoke-static {p1, v6, v7, v1}, Ler1;->e(Ljava/lang/Object;JI)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0, v0, p1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 213
    .line 214
    .line 215
    goto/16 :goto_1

    .line 216
    .line 217
    :pswitch_b
    invoke-virtual {p0, v0, p2}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    if-eqz v1, :cond_0

    .line 222
    .line 223
    invoke-static {v6, v7, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    invoke-static {p1, v6, v7, v1}, Ler1;->e(Ljava/lang/Object;JI)V

    .line 228
    .line 229
    .line 230
    invoke-virtual {p0, v0, p1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 231
    .line 232
    .line 233
    goto/16 :goto_1

    .line 234
    .line 235
    :pswitch_c
    invoke-virtual {p0, v0, p2}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    if-eqz v1, :cond_0

    .line 240
    .line 241
    invoke-static {v6, v7, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 242
    .line 243
    .line 244
    move-result v1

    .line 245
    invoke-static {p1, v6, v7, v1}, Ler1;->e(Ljava/lang/Object;JI)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {p0, v0, p1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 249
    .line 250
    .line 251
    goto/16 :goto_1

    .line 252
    .line 253
    :pswitch_d
    invoke-virtual {p0, v0, p2}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    move-result v1

    .line 257
    if-eqz v1, :cond_0

    .line 258
    .line 259
    invoke-static {v6, v7, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    invoke-static {p1, v6, v7, v1}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 264
    .line 265
    .line 266
    invoke-virtual {p0, v0, p1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 267
    .line 268
    .line 269
    goto/16 :goto_1

    .line 270
    .line 271
    :pswitch_e
    invoke-virtual {p0, p1, v0, p2}, Lnq1;->A(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 272
    .line 273
    .line 274
    goto/16 :goto_1

    .line 275
    .line 276
    :pswitch_f
    invoke-virtual {p0, v0, p2}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 277
    .line 278
    .line 279
    move-result v1

    .line 280
    if-eqz v1, :cond_0

    .line 281
    .line 282
    invoke-static {v6, v7, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object v1

    .line 286
    invoke-static {p1, v6, v7, v1}, Ler1;->i(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 287
    .line 288
    .line 289
    invoke-virtual {p0, v0, p1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 290
    .line 291
    .line 292
    goto/16 :goto_1

    .line 293
    .line 294
    :pswitch_10
    invoke-virtual {p0, v0, p2}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    move-result v1

    .line 298
    if-eqz v1, :cond_0

    .line 299
    .line 300
    sget-object v1, Ler1;->c:Llf1;

    .line 301
    .line 302
    invoke-virtual {v1, v6, v7, p2}, Llf1;->l(JLjava/lang/Object;)Z

    .line 303
    .line 304
    .line 305
    move-result v2

    .line 306
    invoke-virtual {v1, p1, v6, v7, v2}, Llf1;->m(Ljava/lang/Object;JZ)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {p0, v0, p1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 310
    .line 311
    .line 312
    goto/16 :goto_1

    .line 313
    .line 314
    :pswitch_11
    invoke-virtual {p0, v0, p2}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 315
    .line 316
    .line 317
    move-result v1

    .line 318
    if-eqz v1, :cond_0

    .line 319
    .line 320
    invoke-static {v6, v7, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 321
    .line 322
    .line 323
    move-result v1

    .line 324
    invoke-static {p1, v6, v7, v1}, Ler1;->e(Ljava/lang/Object;JI)V

    .line 325
    .line 326
    .line 327
    invoke-virtual {p0, v0, p1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 328
    .line 329
    .line 330
    goto/16 :goto_1

    .line 331
    .line 332
    :pswitch_12
    invoke-virtual {p0, v0, p2}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 333
    .line 334
    .line 335
    move-result v1

    .line 336
    if-eqz v1, :cond_0

    .line 337
    .line 338
    invoke-static {v6, v7, p2}, Ler1;->f(JLjava/lang/Object;)J

    .line 339
    .line 340
    .line 341
    move-result-wide v1

    .line 342
    invoke-static {p1, v6, v7, v1, v2}, Ler1;->g(Ljava/lang/Object;JJ)V

    .line 343
    .line 344
    .line 345
    invoke-virtual {p0, v0, p1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 346
    .line 347
    .line 348
    goto/16 :goto_1

    .line 349
    .line 350
    :pswitch_13
    invoke-virtual {p0, v0, p2}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 351
    .line 352
    .line 353
    move-result v1

    .line 354
    if-eqz v1, :cond_0

    .line 355
    .line 356
    invoke-static {v6, v7, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 357
    .line 358
    .line 359
    move-result v1

    .line 360
    invoke-static {p1, v6, v7, v1}, Ler1;->e(Ljava/lang/Object;JI)V

    .line 361
    .line 362
    .line 363
    invoke-virtual {p0, v0, p1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 364
    .line 365
    .line 366
    goto/16 :goto_1

    .line 367
    .line 368
    :pswitch_14
    invoke-virtual {p0, v0, p2}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 369
    .line 370
    .line 371
    move-result v1

    .line 372
    if-eqz v1, :cond_0

    .line 373
    .line 374
    invoke-static {v6, v7, p2}, Ler1;->f(JLjava/lang/Object;)J

    .line 375
    .line 376
    .line 377
    move-result-wide v1

    .line 378
    invoke-static {p1, v6, v7, v1, v2}, Ler1;->g(Ljava/lang/Object;JJ)V

    .line 379
    .line 380
    .line 381
    invoke-virtual {p0, v0, p1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 382
    .line 383
    .line 384
    goto/16 :goto_1

    .line 385
    .line 386
    :pswitch_15
    invoke-virtual {p0, v0, p2}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 387
    .line 388
    .line 389
    move-result v1

    .line 390
    if-eqz v1, :cond_0

    .line 391
    .line 392
    invoke-static {v6, v7, p2}, Ler1;->f(JLjava/lang/Object;)J

    .line 393
    .line 394
    .line 395
    move-result-wide v1

    .line 396
    invoke-static {p1, v6, v7, v1, v2}, Ler1;->g(Ljava/lang/Object;JJ)V

    .line 397
    .line 398
    .line 399
    invoke-virtual {p0, v0, p1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 400
    .line 401
    .line 402
    goto/16 :goto_1

    .line 403
    .line 404
    :pswitch_16
    invoke-virtual {p0, v0, p2}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 405
    .line 406
    .line 407
    move-result v1

    .line 408
    if-eqz v1, :cond_0

    .line 409
    .line 410
    sget-object v1, Ler1;->c:Llf1;

    .line 411
    .line 412
    invoke-virtual {v1, v6, v7, p2}, Llf1;->n(JLjava/lang/Object;)F

    .line 413
    .line 414
    .line 415
    move-result v2

    .line 416
    invoke-virtual {v1, p1, v6, v7, v2}, Llf1;->o(Ljava/lang/Object;JF)V

    .line 417
    .line 418
    .line 419
    invoke-virtual {p0, v0, p1}, Lnq1;->t(ILjava/lang/Object;)V

    .line 420
    .line 421
    .line 422
    goto/16 :goto_1

    .line 423
    .line 424
    :pswitch_17
    invoke-virtual {p0, v0, p2}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 425
    .line 426
    .line 427
    move-result v1

    .line 428
    if-eqz v1, :cond_0

    .line 429
    .line 430
    sget-object v4, Ler1;->c:Llf1;

    .line 431
    .line 432
    invoke-virtual {v4, v6, v7, p2}, Llf1;->p(JLjava/lang/Object;)D

    .line 433
    .line 434
    .line 435
    move-result-wide v8

    .line 436
    move-object v5, p1

    .line 437
    invoke-virtual/range {v4 .. v9}, Llf1;->q(Ljava/lang/Object;JD)V

    .line 438
    .line 439
    .line 440
    invoke-virtual {p0, v0, v5}, Lnq1;->t(ILjava/lang/Object;)V

    .line 441
    .line 442
    .line 443
    :goto_3
    add-int/lit8 v0, v0, 0x3

    .line 444
    .line 445
    move-object p1, v5

    .line 446
    goto/16 :goto_0

    .line 447
    .line 448
    :cond_4
    move-object v5, p1

    .line 449
    invoke-static {v5, p2}, Lwq1;->b(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 450
    .line 451
    .line 452
    return-void

    .line 453
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final f(Lqo1;)I
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const v7, 0xfffff

    .line 6
    .line 7
    .line 8
    move v3, v7

    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v4, 0x0

    .line 11
    const/4 v8, 0x0

    .line 12
    :goto_0
    iget-object v5, v0, Lnq1;->a:[I

    .line 13
    .line 14
    array-length v9, v5

    .line 15
    if-ge v2, v9, :cond_18

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Lnq1;->k(I)I

    .line 18
    .line 19
    .line 20
    move-result v9

    .line 21
    invoke-static {v9}, Lnq1;->l(I)I

    .line 22
    .line 23
    .line 24
    move-result v10

    .line 25
    aget v11, v5, v2

    .line 26
    .line 27
    add-int/lit8 v12, v2, 0x2

    .line 28
    .line 29
    aget v5, v5, v12

    .line 30
    .line 31
    and-int v12, v5, v7

    .line 32
    .line 33
    const/16 v13, 0x11

    .line 34
    .line 35
    const/4 v14, 0x1

    .line 36
    sget-object v15, Lnq1;->l:Lsun/misc/Unsafe;

    .line 37
    .line 38
    if-gt v10, v13, :cond_2

    .line 39
    .line 40
    if-eq v12, v3, :cond_1

    .line 41
    .line 42
    if-ne v12, v7, :cond_0

    .line 43
    .line 44
    const/4 v4, 0x0

    .line 45
    goto :goto_1

    .line 46
    :cond_0
    int-to-long v3, v12

    .line 47
    invoke-virtual {v15, v1, v3, v4}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    move v4, v3

    .line 52
    :goto_1
    move v3, v12

    .line 53
    :cond_1
    ushr-int/lit8 v5, v5, 0x14

    .line 54
    .line 55
    shl-int v5, v14, v5

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_2
    const/4 v5, 0x0

    .line 59
    :goto_2
    and-int/2addr v9, v7

    .line 60
    sget-object v12, Ljp1;->k:Ljp1;

    .line 61
    .line 62
    iget v12, v12, Ljp1;->j:I

    .line 63
    .line 64
    if-lt v10, v12, :cond_3

    .line 65
    .line 66
    sget-object v12, Ljp1;->l:Ljp1;

    .line 67
    .line 68
    iget v12, v12, Ljp1;->j:I

    .line 69
    .line 70
    :cond_3
    int-to-long v12, v9

    .line 71
    const/16 v9, 0x3f

    .line 72
    .line 73
    const/4 v6, 0x4

    .line 74
    const/16 v7, 0x8

    .line 75
    .line 76
    packed-switch v10, :pswitch_data_0

    .line 77
    .line 78
    .line 79
    goto/16 :goto_1f

    .line 80
    .line 81
    :pswitch_0
    invoke-virtual {v0, v11, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    if-eqz v5, :cond_17

    .line 86
    .line 87
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    check-cast v5, Lqo1;

    .line 92
    .line 93
    invoke-virtual {v0, v2}, Lnq1;->C(I)Lvq1;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    sget-object v7, Lwq1;->a:Ltb0;

    .line 98
    .line 99
    shl-int/lit8 v7, v11, 0x3

    .line 100
    .line 101
    invoke-static {v7}, Lfp1;->a(I)I

    .line 102
    .line 103
    .line 104
    move-result v7

    .line 105
    add-int/2addr v7, v7

    .line 106
    invoke-virtual {v5, v6}, Lqo1;->b(Lvq1;)I

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    :goto_3
    add-int/2addr v5, v7

    .line 111
    :goto_4
    add-int/2addr v8, v5

    .line 112
    goto/16 :goto_1f

    .line 113
    .line 114
    :pswitch_1
    invoke-virtual {v0, v11, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    if-eqz v5, :cond_17

    .line 119
    .line 120
    shl-int/lit8 v5, v11, 0x3

    .line 121
    .line 122
    invoke-static {v12, v13, v1}, Lnq1;->p(JLjava/lang/Object;)J

    .line 123
    .line 124
    .line 125
    move-result-wide v6

    .line 126
    add-long v10, v6, v6

    .line 127
    .line 128
    shr-long/2addr v6, v9

    .line 129
    invoke-static {v5}, Lfp1;->a(I)I

    .line 130
    .line 131
    .line 132
    move-result v5

    .line 133
    xor-long/2addr v6, v10

    .line 134
    invoke-static {v6, v7}, Lfp1;->b(J)I

    .line 135
    .line 136
    .line 137
    move-result v6

    .line 138
    :goto_5
    add-int/2addr v6, v5

    .line 139
    add-int/2addr v8, v6

    .line 140
    goto/16 :goto_1f

    .line 141
    .line 142
    :pswitch_2
    invoke-virtual {v0, v11, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 143
    .line 144
    .line 145
    move-result v5

    .line 146
    if-eqz v5, :cond_17

    .line 147
    .line 148
    shl-int/lit8 v5, v11, 0x3

    .line 149
    .line 150
    invoke-static {v12, v13, v1}, Lnq1;->o(JLjava/lang/Object;)I

    .line 151
    .line 152
    .line 153
    move-result v6

    .line 154
    add-int v7, v6, v6

    .line 155
    .line 156
    shr-int/lit8 v6, v6, 0x1f

    .line 157
    .line 158
    invoke-static {v5}, Lfp1;->a(I)I

    .line 159
    .line 160
    .line 161
    move-result v5

    .line 162
    xor-int/2addr v6, v7

    .line 163
    :goto_6
    invoke-static {v6, v5, v8}, Lx81;->h(III)I

    .line 164
    .line 165
    .line 166
    move-result v8

    .line 167
    goto/16 :goto_1f

    .line 168
    .line 169
    :pswitch_3
    invoke-virtual {v0, v11, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 170
    .line 171
    .line 172
    move-result v5

    .line 173
    if-eqz v5, :cond_17

    .line 174
    .line 175
    :goto_7
    shl-int/lit8 v5, v11, 0x3

    .line 176
    .line 177
    invoke-static {v5, v7, v8}, Lx81;->h(III)I

    .line 178
    .line 179
    .line 180
    move-result v8

    .line 181
    goto/16 :goto_1f

    .line 182
    .line 183
    :pswitch_4
    invoke-virtual {v0, v11, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 184
    .line 185
    .line 186
    move-result v5

    .line 187
    if-eqz v5, :cond_17

    .line 188
    .line 189
    :goto_8
    shl-int/lit8 v5, v11, 0x3

    .line 190
    .line 191
    invoke-static {v5, v6, v8}, Lx81;->h(III)I

    .line 192
    .line 193
    .line 194
    move-result v8

    .line 195
    goto/16 :goto_1f

    .line 196
    .line 197
    :pswitch_5
    invoke-virtual {v0, v11, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 198
    .line 199
    .line 200
    move-result v5

    .line 201
    if-eqz v5, :cond_17

    .line 202
    .line 203
    shl-int/lit8 v5, v11, 0x3

    .line 204
    .line 205
    invoke-static {v12, v13, v1}, Lnq1;->o(JLjava/lang/Object;)I

    .line 206
    .line 207
    .line 208
    move-result v6

    .line 209
    int-to-long v6, v6

    .line 210
    invoke-static {v5}, Lfp1;->a(I)I

    .line 211
    .line 212
    .line 213
    move-result v5

    .line 214
    invoke-static {v6, v7}, Lfp1;->b(J)I

    .line 215
    .line 216
    .line 217
    move-result v6

    .line 218
    goto :goto_5

    .line 219
    :pswitch_6
    invoke-virtual {v0, v11, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 220
    .line 221
    .line 222
    move-result v5

    .line 223
    if-eqz v5, :cond_17

    .line 224
    .line 225
    shl-int/lit8 v5, v11, 0x3

    .line 226
    .line 227
    invoke-static {v12, v13, v1}, Lnq1;->o(JLjava/lang/Object;)I

    .line 228
    .line 229
    .line 230
    move-result v6

    .line 231
    invoke-static {v5}, Lfp1;->a(I)I

    .line 232
    .line 233
    .line 234
    move-result v5

    .line 235
    goto :goto_6

    .line 236
    :pswitch_7
    invoke-virtual {v0, v11, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 237
    .line 238
    .line 239
    move-result v5

    .line 240
    if-eqz v5, :cond_17

    .line 241
    .line 242
    shl-int/lit8 v5, v11, 0x3

    .line 243
    .line 244
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    move-result-object v6

    .line 248
    check-cast v6, Lxo1;

    .line 249
    .line 250
    invoke-static {v5}, Lfp1;->a(I)I

    .line 251
    .line 252
    .line 253
    move-result v5

    .line 254
    invoke-virtual {v6}, Lxo1;->c()I

    .line 255
    .line 256
    .line 257
    move-result v6

    .line 258
    :goto_9
    invoke-static {v6, v6, v5, v8}, Lx81;->i(IIII)I

    .line 259
    .line 260
    .line 261
    move-result v8

    .line 262
    goto/16 :goto_1f

    .line 263
    .line 264
    :pswitch_8
    invoke-virtual {v0, v11, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 265
    .line 266
    .line 267
    move-result v5

    .line 268
    if-eqz v5, :cond_17

    .line 269
    .line 270
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    move-result-object v5

    .line 274
    invoke-virtual {v0, v2}, Lnq1;->C(I)Lvq1;

    .line 275
    .line 276
    .line 277
    move-result-object v6

    .line 278
    sget-object v7, Lwq1;->a:Ltb0;

    .line 279
    .line 280
    shl-int/lit8 v7, v11, 0x3

    .line 281
    .line 282
    check-cast v5, Lqo1;

    .line 283
    .line 284
    invoke-static {v7}, Lfp1;->a(I)I

    .line 285
    .line 286
    .line 287
    move-result v7

    .line 288
    invoke-virtual {v5, v6}, Lqo1;->b(Lvq1;)I

    .line 289
    .line 290
    .line 291
    move-result v5

    .line 292
    :goto_a
    invoke-static {v5, v5, v7, v8}, Lx81;->i(IIII)I

    .line 293
    .line 294
    .line 295
    move-result v8

    .line 296
    goto/16 :goto_1f

    .line 297
    .line 298
    :pswitch_9
    invoke-virtual {v0, v11, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 299
    .line 300
    .line 301
    move-result v5

    .line 302
    if-eqz v5, :cond_17

    .line 303
    .line 304
    shl-int/lit8 v5, v11, 0x3

    .line 305
    .line 306
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object v6

    .line 310
    instance-of v7, v6, Lxo1;

    .line 311
    .line 312
    if-eqz v7, :cond_4

    .line 313
    .line 314
    check-cast v6, Lxo1;

    .line 315
    .line 316
    invoke-static {v5}, Lfp1;->a(I)I

    .line 317
    .line 318
    .line 319
    move-result v5

    .line 320
    invoke-virtual {v6}, Lxo1;->c()I

    .line 321
    .line 322
    .line 323
    move-result v6

    .line 324
    goto :goto_9

    .line 325
    :cond_4
    check-cast v6, Ljava/lang/String;

    .line 326
    .line 327
    invoke-static {v5}, Lfp1;->a(I)I

    .line 328
    .line 329
    .line 330
    move-result v5

    .line 331
    invoke-static {v6}, Lgr1;->b(Ljava/lang/String;)I

    .line 332
    .line 333
    .line 334
    move-result v6

    .line 335
    goto :goto_9

    .line 336
    :pswitch_a
    invoke-virtual {v0, v11, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 337
    .line 338
    .line 339
    move-result v5

    .line 340
    if-eqz v5, :cond_17

    .line 341
    .line 342
    shl-int/lit8 v5, v11, 0x3

    .line 343
    .line 344
    invoke-static {v5, v14, v8}, Lx81;->h(III)I

    .line 345
    .line 346
    .line 347
    move-result v8

    .line 348
    goto/16 :goto_1f

    .line 349
    .line 350
    :pswitch_b
    invoke-virtual {v0, v11, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 351
    .line 352
    .line 353
    move-result v5

    .line 354
    if-eqz v5, :cond_17

    .line 355
    .line 356
    goto/16 :goto_8

    .line 357
    .line 358
    :pswitch_c
    invoke-virtual {v0, v11, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 359
    .line 360
    .line 361
    move-result v5

    .line 362
    if-eqz v5, :cond_17

    .line 363
    .line 364
    goto/16 :goto_7

    .line 365
    .line 366
    :pswitch_d
    invoke-virtual {v0, v11, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 367
    .line 368
    .line 369
    move-result v5

    .line 370
    if-eqz v5, :cond_17

    .line 371
    .line 372
    shl-int/lit8 v5, v11, 0x3

    .line 373
    .line 374
    invoke-static {v12, v13, v1}, Lnq1;->o(JLjava/lang/Object;)I

    .line 375
    .line 376
    .line 377
    move-result v6

    .line 378
    int-to-long v6, v6

    .line 379
    invoke-static {v5}, Lfp1;->a(I)I

    .line 380
    .line 381
    .line 382
    move-result v5

    .line 383
    invoke-static {v6, v7}, Lfp1;->b(J)I

    .line 384
    .line 385
    .line 386
    move-result v6

    .line 387
    goto/16 :goto_5

    .line 388
    .line 389
    :pswitch_e
    invoke-virtual {v0, v11, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 390
    .line 391
    .line 392
    move-result v5

    .line 393
    if-eqz v5, :cond_17

    .line 394
    .line 395
    shl-int/lit8 v5, v11, 0x3

    .line 396
    .line 397
    invoke-static {v12, v13, v1}, Lnq1;->p(JLjava/lang/Object;)J

    .line 398
    .line 399
    .line 400
    move-result-wide v6

    .line 401
    invoke-static {v5}, Lfp1;->a(I)I

    .line 402
    .line 403
    .line 404
    move-result v5

    .line 405
    invoke-static {v6, v7}, Lfp1;->b(J)I

    .line 406
    .line 407
    .line 408
    move-result v6

    .line 409
    goto/16 :goto_5

    .line 410
    .line 411
    :pswitch_f
    invoke-virtual {v0, v11, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 412
    .line 413
    .line 414
    move-result v5

    .line 415
    if-eqz v5, :cond_17

    .line 416
    .line 417
    shl-int/lit8 v5, v11, 0x3

    .line 418
    .line 419
    invoke-static {v12, v13, v1}, Lnq1;->p(JLjava/lang/Object;)J

    .line 420
    .line 421
    .line 422
    move-result-wide v6

    .line 423
    invoke-static {v5}, Lfp1;->a(I)I

    .line 424
    .line 425
    .line 426
    move-result v5

    .line 427
    invoke-static {v6, v7}, Lfp1;->b(J)I

    .line 428
    .line 429
    .line 430
    move-result v6

    .line 431
    goto/16 :goto_5

    .line 432
    .line 433
    :pswitch_10
    invoke-virtual {v0, v11, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 434
    .line 435
    .line 436
    move-result v5

    .line 437
    if-eqz v5, :cond_17

    .line 438
    .line 439
    goto/16 :goto_8

    .line 440
    .line 441
    :pswitch_11
    invoke-virtual {v0, v11, v1, v2}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 442
    .line 443
    .line 444
    move-result v5

    .line 445
    if-eqz v5, :cond_17

    .line 446
    .line 447
    goto/16 :goto_7

    .line 448
    .line 449
    :pswitch_12
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 450
    .line 451
    .line 452
    move-result-object v5

    .line 453
    invoke-virtual {v0, v2}, Lnq1;->D(I)Ljava/lang/Object;

    .line 454
    .line 455
    .line 456
    move-result-object v6

    .line 457
    check-cast v5, Lfq1;

    .line 458
    .line 459
    check-cast v6, Leq1;

    .line 460
    .line 461
    invoke-virtual {v5}, Ljava/util/AbstractMap;->isEmpty()Z

    .line 462
    .line 463
    .line 464
    move-result v7

    .line 465
    if-eqz v7, :cond_5

    .line 466
    .line 467
    :goto_b
    const/4 v7, 0x0

    .line 468
    goto :goto_d

    .line 469
    :cond_5
    invoke-virtual {v5}, Lfq1;->entrySet()Ljava/util/Set;

    .line 470
    .line 471
    .line 472
    move-result-object v5

    .line 473
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 474
    .line 475
    .line 476
    move-result-object v5

    .line 477
    const/4 v7, 0x0

    .line 478
    :goto_c
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 479
    .line 480
    .line 481
    move-result v9

    .line 482
    if-eqz v9, :cond_6

    .line 483
    .line 484
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 485
    .line 486
    .line 487
    move-result-object v9

    .line 488
    check-cast v9, Ljava/util/Map$Entry;

    .line 489
    .line 490
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 491
    .line 492
    .line 493
    move-result-object v10

    .line 494
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 495
    .line 496
    .line 497
    move-result-object v9

    .line 498
    iget-object v12, v6, Leq1;->a:Lc9;

    .line 499
    .line 500
    shl-int/lit8 v13, v11, 0x3

    .line 501
    .line 502
    invoke-static {v13}, Lfp1;->a(I)I

    .line 503
    .line 504
    .line 505
    move-result v13

    .line 506
    invoke-static {v12, v10, v9}, Leq1;->b(Lc9;Ljava/lang/Object;Ljava/lang/Object;)I

    .line 507
    .line 508
    .line 509
    move-result v9

    .line 510
    invoke-static {v9, v9, v13, v7}, Lx81;->i(IIII)I

    .line 511
    .line 512
    .line 513
    move-result v7

    .line 514
    goto :goto_c

    .line 515
    :cond_6
    :goto_d
    add-int/2addr v8, v7

    .line 516
    goto/16 :goto_1f

    .line 517
    .line 518
    :pswitch_13
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 519
    .line 520
    .line 521
    move-result-object v5

    .line 522
    check-cast v5, Ljava/util/List;

    .line 523
    .line 524
    invoke-virtual {v0, v2}, Lnq1;->C(I)Lvq1;

    .line 525
    .line 526
    .line 527
    move-result-object v6

    .line 528
    sget-object v7, Lwq1;->a:Ltb0;

    .line 529
    .line 530
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 531
    .line 532
    .line 533
    move-result v7

    .line 534
    if-nez v7, :cond_7

    .line 535
    .line 536
    const/4 v10, 0x0

    .line 537
    goto :goto_f

    .line 538
    :cond_7
    const/4 v9, 0x0

    .line 539
    const/4 v10, 0x0

    .line 540
    :goto_e
    if-ge v9, v7, :cond_8

    .line 541
    .line 542
    invoke-interface {v5, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 543
    .line 544
    .line 545
    move-result-object v12

    .line 546
    check-cast v12, Lqo1;

    .line 547
    .line 548
    shl-int/lit8 v13, v11, 0x3

    .line 549
    .line 550
    invoke-static {v13}, Lfp1;->a(I)I

    .line 551
    .line 552
    .line 553
    move-result v13

    .line 554
    add-int/2addr v13, v13

    .line 555
    invoke-virtual {v12, v6}, Lqo1;->b(Lvq1;)I

    .line 556
    .line 557
    .line 558
    move-result v12

    .line 559
    add-int/2addr v12, v13

    .line 560
    add-int/2addr v10, v12

    .line 561
    add-int/lit8 v9, v9, 0x1

    .line 562
    .line 563
    goto :goto_e

    .line 564
    :cond_8
    :goto_f
    add-int/2addr v8, v10

    .line 565
    goto/16 :goto_1f

    .line 566
    .line 567
    :pswitch_14
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 568
    .line 569
    .line 570
    move-result-object v5

    .line 571
    check-cast v5, Ljava/util/List;

    .line 572
    .line 573
    invoke-static {v5}, Lwq1;->t(Ljava/util/List;)I

    .line 574
    .line 575
    .line 576
    move-result v5

    .line 577
    if-lez v5, :cond_17

    .line 578
    .line 579
    shl-int/lit8 v6, v11, 0x3

    .line 580
    .line 581
    invoke-static {v6}, Lfp1;->a(I)I

    .line 582
    .line 583
    .line 584
    move-result v6

    .line 585
    :goto_10
    invoke-static {v5, v6, v5, v8}, Lx81;->i(IIII)I

    .line 586
    .line 587
    .line 588
    move-result v8

    .line 589
    goto/16 :goto_1f

    .line 590
    .line 591
    :pswitch_15
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 592
    .line 593
    .line 594
    move-result-object v5

    .line 595
    check-cast v5, Ljava/util/List;

    .line 596
    .line 597
    invoke-static {v5}, Lwq1;->x(Ljava/util/List;)I

    .line 598
    .line 599
    .line 600
    move-result v5

    .line 601
    if-lez v5, :cond_17

    .line 602
    .line 603
    shl-int/lit8 v6, v11, 0x3

    .line 604
    .line 605
    invoke-static {v6}, Lfp1;->a(I)I

    .line 606
    .line 607
    .line 608
    move-result v6

    .line 609
    goto :goto_10

    .line 610
    :pswitch_16
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 611
    .line 612
    .line 613
    move-result-object v5

    .line 614
    check-cast v5, Ljava/util/List;

    .line 615
    .line 616
    sget-object v6, Lwq1;->a:Ltb0;

    .line 617
    .line 618
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 619
    .line 620
    .line 621
    move-result v5

    .line 622
    mul-int/2addr v5, v7

    .line 623
    if-lez v5, :cond_17

    .line 624
    .line 625
    shl-int/lit8 v6, v11, 0x3

    .line 626
    .line 627
    invoke-static {v6}, Lfp1;->a(I)I

    .line 628
    .line 629
    .line 630
    move-result v6

    .line 631
    goto :goto_10

    .line 632
    :pswitch_17
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 633
    .line 634
    .line 635
    move-result-object v5

    .line 636
    check-cast v5, Ljava/util/List;

    .line 637
    .line 638
    sget-object v7, Lwq1;->a:Ltb0;

    .line 639
    .line 640
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 641
    .line 642
    .line 643
    move-result v5

    .line 644
    mul-int/2addr v5, v6

    .line 645
    if-lez v5, :cond_17

    .line 646
    .line 647
    shl-int/lit8 v6, v11, 0x3

    .line 648
    .line 649
    invoke-static {v6}, Lfp1;->a(I)I

    .line 650
    .line 651
    .line 652
    move-result v6

    .line 653
    goto :goto_10

    .line 654
    :pswitch_18
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 655
    .line 656
    .line 657
    move-result-object v5

    .line 658
    check-cast v5, Ljava/util/List;

    .line 659
    .line 660
    invoke-static {v5}, Lwq1;->u(Ljava/util/List;)I

    .line 661
    .line 662
    .line 663
    move-result v5

    .line 664
    if-lez v5, :cond_17

    .line 665
    .line 666
    shl-int/lit8 v6, v11, 0x3

    .line 667
    .line 668
    invoke-static {v6}, Lfp1;->a(I)I

    .line 669
    .line 670
    .line 671
    move-result v6

    .line 672
    goto :goto_10

    .line 673
    :pswitch_19
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 674
    .line 675
    .line 676
    move-result-object v5

    .line 677
    check-cast v5, Ljava/util/List;

    .line 678
    .line 679
    invoke-static {v5}, Lwq1;->w(Ljava/util/List;)I

    .line 680
    .line 681
    .line 682
    move-result v5

    .line 683
    if-lez v5, :cond_17

    .line 684
    .line 685
    shl-int/lit8 v6, v11, 0x3

    .line 686
    .line 687
    invoke-static {v6}, Lfp1;->a(I)I

    .line 688
    .line 689
    .line 690
    move-result v6

    .line 691
    goto :goto_10

    .line 692
    :pswitch_1a
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 693
    .line 694
    .line 695
    move-result-object v5

    .line 696
    check-cast v5, Ljava/util/List;

    .line 697
    .line 698
    sget-object v6, Lwq1;->a:Ltb0;

    .line 699
    .line 700
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 701
    .line 702
    .line 703
    move-result v5

    .line 704
    if-lez v5, :cond_17

    .line 705
    .line 706
    shl-int/lit8 v6, v11, 0x3

    .line 707
    .line 708
    invoke-static {v6}, Lfp1;->a(I)I

    .line 709
    .line 710
    .line 711
    move-result v6

    .line 712
    goto :goto_10

    .line 713
    :pswitch_1b
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 714
    .line 715
    .line 716
    move-result-object v5

    .line 717
    check-cast v5, Ljava/util/List;

    .line 718
    .line 719
    sget-object v7, Lwq1;->a:Ltb0;

    .line 720
    .line 721
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 722
    .line 723
    .line 724
    move-result v5

    .line 725
    mul-int/2addr v5, v6

    .line 726
    if-lez v5, :cond_17

    .line 727
    .line 728
    shl-int/lit8 v6, v11, 0x3

    .line 729
    .line 730
    invoke-static {v6}, Lfp1;->a(I)I

    .line 731
    .line 732
    .line 733
    move-result v6

    .line 734
    goto/16 :goto_10

    .line 735
    .line 736
    :pswitch_1c
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 737
    .line 738
    .line 739
    move-result-object v5

    .line 740
    check-cast v5, Ljava/util/List;

    .line 741
    .line 742
    sget-object v6, Lwq1;->a:Ltb0;

    .line 743
    .line 744
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 745
    .line 746
    .line 747
    move-result v5

    .line 748
    mul-int/2addr v5, v7

    .line 749
    if-lez v5, :cond_17

    .line 750
    .line 751
    shl-int/lit8 v6, v11, 0x3

    .line 752
    .line 753
    invoke-static {v6}, Lfp1;->a(I)I

    .line 754
    .line 755
    .line 756
    move-result v6

    .line 757
    goto/16 :goto_10

    .line 758
    .line 759
    :pswitch_1d
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 760
    .line 761
    .line 762
    move-result-object v5

    .line 763
    check-cast v5, Ljava/util/List;

    .line 764
    .line 765
    invoke-static {v5}, Lwq1;->v(Ljava/util/List;)I

    .line 766
    .line 767
    .line 768
    move-result v5

    .line 769
    if-lez v5, :cond_17

    .line 770
    .line 771
    shl-int/lit8 v6, v11, 0x3

    .line 772
    .line 773
    invoke-static {v6}, Lfp1;->a(I)I

    .line 774
    .line 775
    .line 776
    move-result v6

    .line 777
    goto/16 :goto_10

    .line 778
    .line 779
    :pswitch_1e
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 780
    .line 781
    .line 782
    move-result-object v5

    .line 783
    check-cast v5, Ljava/util/List;

    .line 784
    .line 785
    invoke-static {v5}, Lwq1;->s(Ljava/util/List;)I

    .line 786
    .line 787
    .line 788
    move-result v5

    .line 789
    if-lez v5, :cond_17

    .line 790
    .line 791
    shl-int/lit8 v6, v11, 0x3

    .line 792
    .line 793
    invoke-static {v6}, Lfp1;->a(I)I

    .line 794
    .line 795
    .line 796
    move-result v6

    .line 797
    goto/16 :goto_10

    .line 798
    .line 799
    :pswitch_1f
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 800
    .line 801
    .line 802
    move-result-object v5

    .line 803
    check-cast v5, Ljava/util/List;

    .line 804
    .line 805
    invoke-static {v5}, Lwq1;->r(Ljava/util/List;)I

    .line 806
    .line 807
    .line 808
    move-result v5

    .line 809
    if-lez v5, :cond_17

    .line 810
    .line 811
    shl-int/lit8 v6, v11, 0x3

    .line 812
    .line 813
    invoke-static {v6}, Lfp1;->a(I)I

    .line 814
    .line 815
    .line 816
    move-result v6

    .line 817
    goto/16 :goto_10

    .line 818
    .line 819
    :pswitch_20
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 820
    .line 821
    .line 822
    move-result-object v5

    .line 823
    check-cast v5, Ljava/util/List;

    .line 824
    .line 825
    sget-object v7, Lwq1;->a:Ltb0;

    .line 826
    .line 827
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 828
    .line 829
    .line 830
    move-result v5

    .line 831
    mul-int/2addr v5, v6

    .line 832
    if-lez v5, :cond_17

    .line 833
    .line 834
    shl-int/lit8 v6, v11, 0x3

    .line 835
    .line 836
    invoke-static {v6}, Lfp1;->a(I)I

    .line 837
    .line 838
    .line 839
    move-result v6

    .line 840
    goto/16 :goto_10

    .line 841
    .line 842
    :pswitch_21
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 843
    .line 844
    .line 845
    move-result-object v5

    .line 846
    check-cast v5, Ljava/util/List;

    .line 847
    .line 848
    sget-object v6, Lwq1;->a:Ltb0;

    .line 849
    .line 850
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 851
    .line 852
    .line 853
    move-result v5

    .line 854
    mul-int/2addr v5, v7

    .line 855
    if-lez v5, :cond_17

    .line 856
    .line 857
    shl-int/lit8 v6, v11, 0x3

    .line 858
    .line 859
    invoke-static {v6}, Lfp1;->a(I)I

    .line 860
    .line 861
    .line 862
    move-result v6

    .line 863
    goto/16 :goto_10

    .line 864
    .line 865
    :pswitch_22
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 866
    .line 867
    .line 868
    move-result-object v5

    .line 869
    check-cast v5, Ljava/util/List;

    .line 870
    .line 871
    sget-object v6, Lwq1;->a:Ltb0;

    .line 872
    .line 873
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 874
    .line 875
    .line 876
    move-result v6

    .line 877
    if-nez v6, :cond_9

    .line 878
    .line 879
    goto/16 :goto_b

    .line 880
    .line 881
    :cond_9
    shl-int/lit8 v7, v11, 0x3

    .line 882
    .line 883
    invoke-static {v5}, Lwq1;->t(Ljava/util/List;)I

    .line 884
    .line 885
    .line 886
    move-result v5

    .line 887
    invoke-static {v7}, Lfp1;->a(I)I

    .line 888
    .line 889
    .line 890
    move-result v7

    .line 891
    :goto_11
    mul-int/2addr v7, v6

    .line 892
    add-int/2addr v7, v5

    .line 893
    goto/16 :goto_d

    .line 894
    .line 895
    :pswitch_23
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 896
    .line 897
    .line 898
    move-result-object v5

    .line 899
    check-cast v5, Ljava/util/List;

    .line 900
    .line 901
    sget-object v6, Lwq1;->a:Ltb0;

    .line 902
    .line 903
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 904
    .line 905
    .line 906
    move-result v6

    .line 907
    if-nez v6, :cond_a

    .line 908
    .line 909
    goto/16 :goto_b

    .line 910
    .line 911
    :cond_a
    shl-int/lit8 v7, v11, 0x3

    .line 912
    .line 913
    invoke-static {v5}, Lwq1;->x(Ljava/util/List;)I

    .line 914
    .line 915
    .line 916
    move-result v5

    .line 917
    invoke-static {v7}, Lfp1;->a(I)I

    .line 918
    .line 919
    .line 920
    move-result v7

    .line 921
    goto :goto_11

    .line 922
    :pswitch_24
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 923
    .line 924
    .line 925
    move-result-object v5

    .line 926
    check-cast v5, Ljava/util/List;

    .line 927
    .line 928
    invoke-static {v11, v5}, Lwq1;->z(ILjava/util/List;)I

    .line 929
    .line 930
    .line 931
    move-result v5

    .line 932
    goto/16 :goto_4

    .line 933
    .line 934
    :pswitch_25
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 935
    .line 936
    .line 937
    move-result-object v5

    .line 938
    check-cast v5, Ljava/util/List;

    .line 939
    .line 940
    invoke-static {v11, v5}, Lwq1;->y(ILjava/util/List;)I

    .line 941
    .line 942
    .line 943
    move-result v5

    .line 944
    goto/16 :goto_4

    .line 945
    .line 946
    :pswitch_26
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 947
    .line 948
    .line 949
    move-result-object v5

    .line 950
    check-cast v5, Ljava/util/List;

    .line 951
    .line 952
    sget-object v6, Lwq1;->a:Ltb0;

    .line 953
    .line 954
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 955
    .line 956
    .line 957
    move-result v6

    .line 958
    if-nez v6, :cond_b

    .line 959
    .line 960
    goto/16 :goto_b

    .line 961
    .line 962
    :cond_b
    shl-int/lit8 v7, v11, 0x3

    .line 963
    .line 964
    invoke-static {v5}, Lwq1;->u(Ljava/util/List;)I

    .line 965
    .line 966
    .line 967
    move-result v5

    .line 968
    invoke-static {v7}, Lfp1;->a(I)I

    .line 969
    .line 970
    .line 971
    move-result v7

    .line 972
    goto :goto_11

    .line 973
    :pswitch_27
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 974
    .line 975
    .line 976
    move-result-object v5

    .line 977
    check-cast v5, Ljava/util/List;

    .line 978
    .line 979
    sget-object v6, Lwq1;->a:Ltb0;

    .line 980
    .line 981
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 982
    .line 983
    .line 984
    move-result v6

    .line 985
    if-nez v6, :cond_c

    .line 986
    .line 987
    goto/16 :goto_b

    .line 988
    .line 989
    :cond_c
    shl-int/lit8 v7, v11, 0x3

    .line 990
    .line 991
    invoke-static {v5}, Lwq1;->w(Ljava/util/List;)I

    .line 992
    .line 993
    .line 994
    move-result v5

    .line 995
    invoke-static {v7}, Lfp1;->a(I)I

    .line 996
    .line 997
    .line 998
    move-result v7

    .line 999
    goto :goto_11

    .line 1000
    :pswitch_28
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1001
    .line 1002
    .line 1003
    move-result-object v5

    .line 1004
    check-cast v5, Ljava/util/List;

    .line 1005
    .line 1006
    sget-object v6, Lwq1;->a:Ltb0;

    .line 1007
    .line 1008
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1009
    .line 1010
    .line 1011
    move-result v6

    .line 1012
    if-nez v6, :cond_d

    .line 1013
    .line 1014
    goto/16 :goto_b

    .line 1015
    .line 1016
    :cond_d
    shl-int/lit8 v7, v11, 0x3

    .line 1017
    .line 1018
    invoke-static {v7}, Lfp1;->a(I)I

    .line 1019
    .line 1020
    .line 1021
    move-result v7

    .line 1022
    mul-int/2addr v7, v6

    .line 1023
    const/4 v6, 0x0

    .line 1024
    :goto_12
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1025
    .line 1026
    .line 1027
    move-result v9

    .line 1028
    if-ge v6, v9, :cond_6

    .line 1029
    .line 1030
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1031
    .line 1032
    .line 1033
    move-result-object v9

    .line 1034
    check-cast v9, Lxo1;

    .line 1035
    .line 1036
    invoke-virtual {v9}, Lxo1;->c()I

    .line 1037
    .line 1038
    .line 1039
    move-result v9

    .line 1040
    invoke-static {v9, v9, v7}, Lx81;->h(III)I

    .line 1041
    .line 1042
    .line 1043
    move-result v7

    .line 1044
    add-int/lit8 v6, v6, 0x1

    .line 1045
    .line 1046
    goto :goto_12

    .line 1047
    :pswitch_29
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1048
    .line 1049
    .line 1050
    move-result-object v5

    .line 1051
    check-cast v5, Ljava/util/List;

    .line 1052
    .line 1053
    invoke-virtual {v0, v2}, Lnq1;->C(I)Lvq1;

    .line 1054
    .line 1055
    .line 1056
    move-result-object v6

    .line 1057
    sget-object v7, Lwq1;->a:Ltb0;

    .line 1058
    .line 1059
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1060
    .line 1061
    .line 1062
    move-result v7

    .line 1063
    if-nez v7, :cond_e

    .line 1064
    .line 1065
    const/4 v9, 0x0

    .line 1066
    goto :goto_14

    .line 1067
    :cond_e
    shl-int/lit8 v9, v11, 0x3

    .line 1068
    .line 1069
    invoke-static {v9}, Lfp1;->a(I)I

    .line 1070
    .line 1071
    .line 1072
    move-result v9

    .line 1073
    mul-int/2addr v9, v7

    .line 1074
    const/4 v10, 0x0

    .line 1075
    :goto_13
    if-ge v10, v7, :cond_f

    .line 1076
    .line 1077
    invoke-interface {v5, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1078
    .line 1079
    .line 1080
    move-result-object v11

    .line 1081
    check-cast v11, Lqo1;

    .line 1082
    .line 1083
    invoke-virtual {v11, v6}, Lqo1;->b(Lvq1;)I

    .line 1084
    .line 1085
    .line 1086
    move-result v11

    .line 1087
    invoke-static {v11, v11, v9}, Lx81;->h(III)I

    .line 1088
    .line 1089
    .line 1090
    move-result v9

    .line 1091
    add-int/lit8 v10, v10, 0x1

    .line 1092
    .line 1093
    goto :goto_13

    .line 1094
    :cond_f
    :goto_14
    add-int/2addr v8, v9

    .line 1095
    goto/16 :goto_1f

    .line 1096
    .line 1097
    :pswitch_2a
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1098
    .line 1099
    .line 1100
    move-result-object v5

    .line 1101
    check-cast v5, Ljava/util/List;

    .line 1102
    .line 1103
    sget-object v6, Lwq1;->a:Ltb0;

    .line 1104
    .line 1105
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1106
    .line 1107
    .line 1108
    move-result v6

    .line 1109
    if-nez v6, :cond_10

    .line 1110
    .line 1111
    goto/16 :goto_b

    .line 1112
    .line 1113
    :cond_10
    shl-int/lit8 v7, v11, 0x3

    .line 1114
    .line 1115
    invoke-static {v7}, Lfp1;->a(I)I

    .line 1116
    .line 1117
    .line 1118
    move-result v7

    .line 1119
    mul-int/2addr v7, v6

    .line 1120
    const/4 v9, 0x0

    .line 1121
    :goto_15
    if-ge v9, v6, :cond_6

    .line 1122
    .line 1123
    invoke-interface {v5, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1124
    .line 1125
    .line 1126
    move-result-object v10

    .line 1127
    instance-of v11, v10, Lxo1;

    .line 1128
    .line 1129
    if-eqz v11, :cond_11

    .line 1130
    .line 1131
    check-cast v10, Lxo1;

    .line 1132
    .line 1133
    invoke-virtual {v10}, Lxo1;->c()I

    .line 1134
    .line 1135
    .line 1136
    move-result v10

    .line 1137
    :goto_16
    invoke-static {v10, v10, v7}, Lx81;->h(III)I

    .line 1138
    .line 1139
    .line 1140
    move-result v7

    .line 1141
    goto :goto_17

    .line 1142
    :cond_11
    check-cast v10, Ljava/lang/String;

    .line 1143
    .line 1144
    invoke-static {v10}, Lgr1;->b(Ljava/lang/String;)I

    .line 1145
    .line 1146
    .line 1147
    move-result v10

    .line 1148
    goto :goto_16

    .line 1149
    :goto_17
    add-int/lit8 v9, v9, 0x1

    .line 1150
    .line 1151
    goto :goto_15

    .line 1152
    :pswitch_2b
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1153
    .line 1154
    .line 1155
    move-result-object v5

    .line 1156
    check-cast v5, Ljava/util/List;

    .line 1157
    .line 1158
    sget-object v6, Lwq1;->a:Ltb0;

    .line 1159
    .line 1160
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1161
    .line 1162
    .line 1163
    move-result v5

    .line 1164
    if-nez v5, :cond_12

    .line 1165
    .line 1166
    :goto_18
    const/4 v6, 0x0

    .line 1167
    goto :goto_19

    .line 1168
    :cond_12
    shl-int/lit8 v6, v11, 0x3

    .line 1169
    .line 1170
    invoke-static {v6}, Lfp1;->a(I)I

    .line 1171
    .line 1172
    .line 1173
    move-result v6

    .line 1174
    add-int/2addr v6, v14

    .line 1175
    mul-int/2addr v6, v5

    .line 1176
    :goto_19
    add-int/2addr v8, v6

    .line 1177
    goto/16 :goto_1f

    .line 1178
    .line 1179
    :pswitch_2c
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1180
    .line 1181
    .line 1182
    move-result-object v5

    .line 1183
    check-cast v5, Ljava/util/List;

    .line 1184
    .line 1185
    invoke-static {v11, v5}, Lwq1;->y(ILjava/util/List;)I

    .line 1186
    .line 1187
    .line 1188
    move-result v5

    .line 1189
    goto/16 :goto_4

    .line 1190
    .line 1191
    :pswitch_2d
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1192
    .line 1193
    .line 1194
    move-result-object v5

    .line 1195
    check-cast v5, Ljava/util/List;

    .line 1196
    .line 1197
    invoke-static {v11, v5}, Lwq1;->z(ILjava/util/List;)I

    .line 1198
    .line 1199
    .line 1200
    move-result v5

    .line 1201
    goto/16 :goto_4

    .line 1202
    .line 1203
    :pswitch_2e
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1204
    .line 1205
    .line 1206
    move-result-object v5

    .line 1207
    check-cast v5, Ljava/util/List;

    .line 1208
    .line 1209
    sget-object v6, Lwq1;->a:Ltb0;

    .line 1210
    .line 1211
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1212
    .line 1213
    .line 1214
    move-result v6

    .line 1215
    if-nez v6, :cond_13

    .line 1216
    .line 1217
    goto/16 :goto_b

    .line 1218
    .line 1219
    :cond_13
    shl-int/lit8 v7, v11, 0x3

    .line 1220
    .line 1221
    invoke-static {v5}, Lwq1;->v(Ljava/util/List;)I

    .line 1222
    .line 1223
    .line 1224
    move-result v5

    .line 1225
    invoke-static {v7}, Lfp1;->a(I)I

    .line 1226
    .line 1227
    .line 1228
    move-result v7

    .line 1229
    goto/16 :goto_11

    .line 1230
    .line 1231
    :pswitch_2f
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1232
    .line 1233
    .line 1234
    move-result-object v5

    .line 1235
    check-cast v5, Ljava/util/List;

    .line 1236
    .line 1237
    sget-object v6, Lwq1;->a:Ltb0;

    .line 1238
    .line 1239
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1240
    .line 1241
    .line 1242
    move-result v6

    .line 1243
    if-nez v6, :cond_14

    .line 1244
    .line 1245
    goto/16 :goto_b

    .line 1246
    .line 1247
    :cond_14
    shl-int/lit8 v7, v11, 0x3

    .line 1248
    .line 1249
    invoke-static {v5}, Lwq1;->s(Ljava/util/List;)I

    .line 1250
    .line 1251
    .line 1252
    move-result v5

    .line 1253
    invoke-static {v7}, Lfp1;->a(I)I

    .line 1254
    .line 1255
    .line 1256
    move-result v7

    .line 1257
    goto/16 :goto_11

    .line 1258
    .line 1259
    :pswitch_30
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1260
    .line 1261
    .line 1262
    move-result-object v5

    .line 1263
    check-cast v5, Ljava/util/List;

    .line 1264
    .line 1265
    sget-object v6, Lwq1;->a:Ltb0;

    .line 1266
    .line 1267
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1268
    .line 1269
    .line 1270
    move-result v6

    .line 1271
    if-nez v6, :cond_15

    .line 1272
    .line 1273
    goto :goto_18

    .line 1274
    :cond_15
    shl-int/lit8 v6, v11, 0x3

    .line 1275
    .line 1276
    invoke-static {v5}, Lwq1;->r(Ljava/util/List;)I

    .line 1277
    .line 1278
    .line 1279
    move-result v7

    .line 1280
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1281
    .line 1282
    .line 1283
    move-result v5

    .line 1284
    invoke-static {v6}, Lfp1;->a(I)I

    .line 1285
    .line 1286
    .line 1287
    move-result v6

    .line 1288
    mul-int/2addr v6, v5

    .line 1289
    add-int/2addr v6, v7

    .line 1290
    goto :goto_19

    .line 1291
    :pswitch_31
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1292
    .line 1293
    .line 1294
    move-result-object v5

    .line 1295
    check-cast v5, Ljava/util/List;

    .line 1296
    .line 1297
    invoke-static {v11, v5}, Lwq1;->y(ILjava/util/List;)I

    .line 1298
    .line 1299
    .line 1300
    move-result v5

    .line 1301
    goto/16 :goto_4

    .line 1302
    .line 1303
    :pswitch_32
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1304
    .line 1305
    .line 1306
    move-result-object v5

    .line 1307
    check-cast v5, Ljava/util/List;

    .line 1308
    .line 1309
    invoke-static {v11, v5}, Lwq1;->z(ILjava/util/List;)I

    .line 1310
    .line 1311
    .line 1312
    move-result v5

    .line 1313
    goto/16 :goto_4

    .line 1314
    .line 1315
    :pswitch_33
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1316
    .line 1317
    .line 1318
    move-result v5

    .line 1319
    if-eqz v5, :cond_17

    .line 1320
    .line 1321
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1322
    .line 1323
    .line 1324
    move-result-object v5

    .line 1325
    check-cast v5, Lqo1;

    .line 1326
    .line 1327
    invoke-virtual {v0, v2}, Lnq1;->C(I)Lvq1;

    .line 1328
    .line 1329
    .line 1330
    move-result-object v6

    .line 1331
    sget-object v7, Lwq1;->a:Ltb0;

    .line 1332
    .line 1333
    shl-int/lit8 v7, v11, 0x3

    .line 1334
    .line 1335
    invoke-static {v7}, Lfp1;->a(I)I

    .line 1336
    .line 1337
    .line 1338
    move-result v7

    .line 1339
    add-int/2addr v7, v7

    .line 1340
    invoke-virtual {v5, v6}, Lqo1;->b(Lvq1;)I

    .line 1341
    .line 1342
    .line 1343
    move-result v5

    .line 1344
    goto/16 :goto_3

    .line 1345
    .line 1346
    :pswitch_34
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1347
    .line 1348
    .line 1349
    move-result v5

    .line 1350
    if-eqz v5, :cond_17

    .line 1351
    .line 1352
    shl-int/lit8 v0, v11, 0x3

    .line 1353
    .line 1354
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1355
    .line 1356
    .line 1357
    move-result-wide v5

    .line 1358
    add-long v10, v5, v5

    .line 1359
    .line 1360
    shr-long/2addr v5, v9

    .line 1361
    invoke-static {v0}, Lfp1;->a(I)I

    .line 1362
    .line 1363
    .line 1364
    move-result v0

    .line 1365
    xor-long/2addr v5, v10

    .line 1366
    invoke-static {v5, v6}, Lfp1;->b(J)I

    .line 1367
    .line 1368
    .line 1369
    move-result v5

    .line 1370
    :goto_1a
    add-int/2addr v5, v0

    .line 1371
    goto/16 :goto_4

    .line 1372
    .line 1373
    :pswitch_35
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1374
    .line 1375
    .line 1376
    move-result v5

    .line 1377
    if-eqz v5, :cond_17

    .line 1378
    .line 1379
    shl-int/lit8 v0, v11, 0x3

    .line 1380
    .line 1381
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1382
    .line 1383
    .line 1384
    move-result v5

    .line 1385
    add-int v6, v5, v5

    .line 1386
    .line 1387
    shr-int/lit8 v5, v5, 0x1f

    .line 1388
    .line 1389
    invoke-static {v0}, Lfp1;->a(I)I

    .line 1390
    .line 1391
    .line 1392
    move-result v0

    .line 1393
    xor-int/2addr v5, v6

    .line 1394
    :goto_1b
    invoke-static {v5, v0, v8}, Lx81;->h(III)I

    .line 1395
    .line 1396
    .line 1397
    move-result v8

    .line 1398
    goto/16 :goto_1f

    .line 1399
    .line 1400
    :pswitch_36
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1401
    .line 1402
    .line 1403
    move-result v5

    .line 1404
    if-eqz v5, :cond_17

    .line 1405
    .line 1406
    :goto_1c
    shl-int/lit8 v0, v11, 0x3

    .line 1407
    .line 1408
    invoke-static {v0, v7, v8}, Lx81;->h(III)I

    .line 1409
    .line 1410
    .line 1411
    move-result v8

    .line 1412
    goto/16 :goto_1f

    .line 1413
    .line 1414
    :pswitch_37
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1415
    .line 1416
    .line 1417
    move-result v5

    .line 1418
    if-eqz v5, :cond_17

    .line 1419
    .line 1420
    :goto_1d
    shl-int/lit8 v0, v11, 0x3

    .line 1421
    .line 1422
    invoke-static {v0, v6, v8}, Lx81;->h(III)I

    .line 1423
    .line 1424
    .line 1425
    move-result v8

    .line 1426
    goto/16 :goto_1f

    .line 1427
    .line 1428
    :pswitch_38
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1429
    .line 1430
    .line 1431
    move-result v5

    .line 1432
    if-eqz v5, :cond_17

    .line 1433
    .line 1434
    shl-int/lit8 v0, v11, 0x3

    .line 1435
    .line 1436
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1437
    .line 1438
    .line 1439
    move-result v5

    .line 1440
    int-to-long v5, v5

    .line 1441
    invoke-static {v0}, Lfp1;->a(I)I

    .line 1442
    .line 1443
    .line 1444
    move-result v0

    .line 1445
    invoke-static {v5, v6}, Lfp1;->b(J)I

    .line 1446
    .line 1447
    .line 1448
    move-result v5

    .line 1449
    goto :goto_1a

    .line 1450
    :pswitch_39
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1451
    .line 1452
    .line 1453
    move-result v5

    .line 1454
    if-eqz v5, :cond_17

    .line 1455
    .line 1456
    shl-int/lit8 v0, v11, 0x3

    .line 1457
    .line 1458
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1459
    .line 1460
    .line 1461
    move-result v5

    .line 1462
    invoke-static {v0}, Lfp1;->a(I)I

    .line 1463
    .line 1464
    .line 1465
    move-result v0

    .line 1466
    goto :goto_1b

    .line 1467
    :pswitch_3a
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1468
    .line 1469
    .line 1470
    move-result v5

    .line 1471
    if-eqz v5, :cond_17

    .line 1472
    .line 1473
    shl-int/lit8 v0, v11, 0x3

    .line 1474
    .line 1475
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1476
    .line 1477
    .line 1478
    move-result-object v5

    .line 1479
    check-cast v5, Lxo1;

    .line 1480
    .line 1481
    invoke-static {v0}, Lfp1;->a(I)I

    .line 1482
    .line 1483
    .line 1484
    move-result v0

    .line 1485
    invoke-virtual {v5}, Lxo1;->c()I

    .line 1486
    .line 1487
    .line 1488
    move-result v5

    .line 1489
    :goto_1e
    invoke-static {v5, v5, v0, v8}, Lx81;->i(IIII)I

    .line 1490
    .line 1491
    .line 1492
    move-result v8

    .line 1493
    goto/16 :goto_1f

    .line 1494
    .line 1495
    :pswitch_3b
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1496
    .line 1497
    .line 1498
    move-result v5

    .line 1499
    if-eqz v5, :cond_17

    .line 1500
    .line 1501
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1502
    .line 1503
    .line 1504
    move-result-object v5

    .line 1505
    invoke-virtual {v0, v2}, Lnq1;->C(I)Lvq1;

    .line 1506
    .line 1507
    .line 1508
    move-result-object v6

    .line 1509
    sget-object v7, Lwq1;->a:Ltb0;

    .line 1510
    .line 1511
    shl-int/lit8 v7, v11, 0x3

    .line 1512
    .line 1513
    check-cast v5, Lqo1;

    .line 1514
    .line 1515
    invoke-static {v7}, Lfp1;->a(I)I

    .line 1516
    .line 1517
    .line 1518
    move-result v7

    .line 1519
    invoke-virtual {v5, v6}, Lqo1;->b(Lvq1;)I

    .line 1520
    .line 1521
    .line 1522
    move-result v5

    .line 1523
    goto/16 :goto_a

    .line 1524
    .line 1525
    :pswitch_3c
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1526
    .line 1527
    .line 1528
    move-result v5

    .line 1529
    if-eqz v5, :cond_17

    .line 1530
    .line 1531
    shl-int/lit8 v0, v11, 0x3

    .line 1532
    .line 1533
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1534
    .line 1535
    .line 1536
    move-result-object v5

    .line 1537
    instance-of v6, v5, Lxo1;

    .line 1538
    .line 1539
    if-eqz v6, :cond_16

    .line 1540
    .line 1541
    check-cast v5, Lxo1;

    .line 1542
    .line 1543
    invoke-static {v0}, Lfp1;->a(I)I

    .line 1544
    .line 1545
    .line 1546
    move-result v0

    .line 1547
    invoke-virtual {v5}, Lxo1;->c()I

    .line 1548
    .line 1549
    .line 1550
    move-result v5

    .line 1551
    goto :goto_1e

    .line 1552
    :cond_16
    check-cast v5, Ljava/lang/String;

    .line 1553
    .line 1554
    invoke-static {v0}, Lfp1;->a(I)I

    .line 1555
    .line 1556
    .line 1557
    move-result v0

    .line 1558
    invoke-static {v5}, Lgr1;->b(Ljava/lang/String;)I

    .line 1559
    .line 1560
    .line 1561
    move-result v5

    .line 1562
    goto :goto_1e

    .line 1563
    :pswitch_3d
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1564
    .line 1565
    .line 1566
    move-result v5

    .line 1567
    if-eqz v5, :cond_17

    .line 1568
    .line 1569
    shl-int/lit8 v0, v11, 0x3

    .line 1570
    .line 1571
    invoke-static {v0, v14, v8}, Lx81;->h(III)I

    .line 1572
    .line 1573
    .line 1574
    move-result v8

    .line 1575
    goto :goto_1f

    .line 1576
    :pswitch_3e
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1577
    .line 1578
    .line 1579
    move-result v5

    .line 1580
    if-eqz v5, :cond_17

    .line 1581
    .line 1582
    goto/16 :goto_1d

    .line 1583
    .line 1584
    :pswitch_3f
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1585
    .line 1586
    .line 1587
    move-result v5

    .line 1588
    if-eqz v5, :cond_17

    .line 1589
    .line 1590
    goto/16 :goto_1c

    .line 1591
    .line 1592
    :pswitch_40
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1593
    .line 1594
    .line 1595
    move-result v5

    .line 1596
    if-eqz v5, :cond_17

    .line 1597
    .line 1598
    shl-int/lit8 v0, v11, 0x3

    .line 1599
    .line 1600
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1601
    .line 1602
    .line 1603
    move-result v5

    .line 1604
    int-to-long v5, v5

    .line 1605
    invoke-static {v0}, Lfp1;->a(I)I

    .line 1606
    .line 1607
    .line 1608
    move-result v0

    .line 1609
    invoke-static {v5, v6}, Lfp1;->b(J)I

    .line 1610
    .line 1611
    .line 1612
    move-result v5

    .line 1613
    goto/16 :goto_1a

    .line 1614
    .line 1615
    :pswitch_41
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1616
    .line 1617
    .line 1618
    move-result v5

    .line 1619
    if-eqz v5, :cond_17

    .line 1620
    .line 1621
    shl-int/lit8 v0, v11, 0x3

    .line 1622
    .line 1623
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1624
    .line 1625
    .line 1626
    move-result-wide v5

    .line 1627
    invoke-static {v0}, Lfp1;->a(I)I

    .line 1628
    .line 1629
    .line 1630
    move-result v0

    .line 1631
    invoke-static {v5, v6}, Lfp1;->b(J)I

    .line 1632
    .line 1633
    .line 1634
    move-result v5

    .line 1635
    goto/16 :goto_1a

    .line 1636
    .line 1637
    :pswitch_42
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1638
    .line 1639
    .line 1640
    move-result v5

    .line 1641
    if-eqz v5, :cond_17

    .line 1642
    .line 1643
    shl-int/lit8 v0, v11, 0x3

    .line 1644
    .line 1645
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1646
    .line 1647
    .line 1648
    move-result-wide v5

    .line 1649
    invoke-static {v0}, Lfp1;->a(I)I

    .line 1650
    .line 1651
    .line 1652
    move-result v0

    .line 1653
    invoke-static {v5, v6}, Lfp1;->b(J)I

    .line 1654
    .line 1655
    .line 1656
    move-result v5

    .line 1657
    goto/16 :goto_1a

    .line 1658
    .line 1659
    :pswitch_43
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1660
    .line 1661
    .line 1662
    move-result v5

    .line 1663
    if-eqz v5, :cond_17

    .line 1664
    .line 1665
    goto/16 :goto_1d

    .line 1666
    .line 1667
    :pswitch_44
    invoke-virtual/range {v0 .. v5}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 1668
    .line 1669
    .line 1670
    move-result v5

    .line 1671
    if-eqz v5, :cond_17

    .line 1672
    .line 1673
    goto/16 :goto_1c

    .line 1674
    .line 1675
    :cond_17
    :goto_1f
    add-int/lit8 v2, v2, 0x3

    .line 1676
    .line 1677
    move-object/from16 v0, p0

    .line 1678
    .line 1679
    move-object/from16 v1, p1

    .line 1680
    .line 1681
    const v7, 0xfffff

    .line 1682
    .line 1683
    .line 1684
    goto/16 :goto_0

    .line 1685
    .line 1686
    :cond_18
    move-object/from16 v0, p1

    .line 1687
    .line 1688
    check-cast v0, Lnp1;

    .line 1689
    .line 1690
    iget-object v0, v0, Lnp1;->zzc:Lcr1;

    .line 1691
    .line 1692
    invoke-virtual {v0}, Lcr1;->c()I

    .line 1693
    .line 1694
    .line 1695
    move-result v0

    .line 1696
    add-int/2addr v0, v8

    .line 1697
    return v0

    .line 1698
    nop

    .line 1699
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final g(Ljava/lang/Object;)Z
    .locals 14

    .line 1
    const/4 v0, 0x0

    .line 2
    const v1, 0xfffff

    .line 3
    .line 4
    .line 5
    move v2, v0

    .line 6
    move v4, v2

    .line 7
    move v3, v1

    .line 8
    :goto_0
    iget v5, p0, Lnq1;->h:I

    .line 9
    .line 10
    const/4 v6, 0x1

    .line 11
    if-ge v2, v5, :cond_b

    .line 12
    .line 13
    iget-object v5, p0, Lnq1;->g:[I

    .line 14
    .line 15
    aget v9, v5, v2

    .line 16
    .line 17
    invoke-virtual {p0, v9}, Lnq1;->k(I)I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    add-int/lit8 v7, v9, 0x2

    .line 22
    .line 23
    iget-object v13, p0, Lnq1;->a:[I

    .line 24
    .line 25
    aget v7, v13, v7

    .line 26
    .line 27
    and-int v8, v7, v1

    .line 28
    .line 29
    ushr-int/lit8 v7, v7, 0x14

    .line 30
    .line 31
    shl-int v12, v6, v7

    .line 32
    .line 33
    if-eq v8, v3, :cond_1

    .line 34
    .line 35
    if-eq v8, v1, :cond_0

    .line 36
    .line 37
    int-to-long v3, v8

    .line 38
    sget-object v6, Lnq1;->l:Lsun/misc/Unsafe;

    .line 39
    .line 40
    invoke-virtual {v6, p1, v3, v4}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    :cond_0
    move v11, v4

    .line 45
    move v10, v8

    .line 46
    goto :goto_1

    .line 47
    :cond_1
    move v10, v3

    .line 48
    move v11, v4

    .line 49
    :goto_1
    const/high16 v3, 0x10000000

    .line 50
    .line 51
    and-int/2addr v3, v5

    .line 52
    move-object v7, p0

    .line 53
    move-object v8, p1

    .line 54
    if-eqz v3, :cond_2

    .line 55
    .line 56
    invoke-virtual/range {v7 .. v12}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-nez p0, :cond_2

    .line 61
    .line 62
    goto/16 :goto_3

    .line 63
    .line 64
    :cond_2
    invoke-static {v5}, Lnq1;->l(I)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    const/16 p1, 0x9

    .line 69
    .line 70
    if-eq p0, p1, :cond_9

    .line 71
    .line 72
    const/16 p1, 0x11

    .line 73
    .line 74
    if-eq p0, p1, :cond_9

    .line 75
    .line 76
    const/16 p1, 0x1b

    .line 77
    .line 78
    if-eq p0, p1, :cond_7

    .line 79
    .line 80
    const/16 p1, 0x3c

    .line 81
    .line 82
    if-eq p0, p1, :cond_6

    .line 83
    .line 84
    const/16 p1, 0x44

    .line 85
    .line 86
    if-eq p0, p1, :cond_6

    .line 87
    .line 88
    const/16 p1, 0x31

    .line 89
    .line 90
    if-eq p0, p1, :cond_7

    .line 91
    .line 92
    const/16 p1, 0x32

    .line 93
    .line 94
    if-eq p0, p1, :cond_3

    .line 95
    .line 96
    goto/16 :goto_4

    .line 97
    .line 98
    :cond_3
    and-int p0, v5, v1

    .line 99
    .line 100
    int-to-long p0, p0

    .line 101
    invoke-static {p0, p1, v8}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    check-cast p0, Lfq1;

    .line 106
    .line 107
    invoke-virtual {p0}, Ljava/util/HashMap;->isEmpty()Z

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    if-nez p1, :cond_a

    .line 112
    .line 113
    invoke-virtual {v7, v9}, Lnq1;->D(I)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    check-cast p1, Leq1;

    .line 118
    .line 119
    iget-object p1, p1, Leq1;->a:Lc9;

    .line 120
    .line 121
    iget-object p1, p1, Lc9;->l:Ljava/lang/Object;

    .line 122
    .line 123
    check-cast p1, Lhr1;

    .line 124
    .line 125
    iget-object p1, p1, Lhr1;->j:Lir1;

    .line 126
    .line 127
    sget-object v3, Lir1;->r:Lir1;

    .line 128
    .line 129
    if-ne p1, v3, :cond_a

    .line 130
    .line 131
    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    const/4 p1, 0x0

    .line 140
    :cond_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    if-eqz v3, :cond_a

    .line 145
    .line 146
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    if-nez p1, :cond_5

    .line 151
    .line 152
    sget-object p1, Lsq1;->c:Lsq1;

    .line 153
    .line 154
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    invoke-virtual {p1, v4}, Lsq1;->a(Ljava/lang/Class;)Lvq1;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    :cond_5
    invoke-interface {p1, v3}, Lvq1;->g(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    if-nez v3, :cond_4

    .line 167
    .line 168
    goto :goto_3

    .line 169
    :cond_6
    aget p0, v13, v9

    .line 170
    .line 171
    invoke-virtual {v7, p0, v8, v9}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    if-eqz p0, :cond_a

    .line 176
    .line 177
    invoke-virtual {v7, v9}, Lnq1;->C(I)Lvq1;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    and-int p1, v5, v1

    .line 182
    .line 183
    int-to-long v3, p1

    .line 184
    invoke-static {v3, v4, v8}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    invoke-interface {p0, p1}, Lvq1;->g(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result p0

    .line 192
    if-nez p0, :cond_a

    .line 193
    .line 194
    goto :goto_3

    .line 195
    :cond_7
    and-int p0, v5, v1

    .line 196
    .line 197
    int-to-long p0, p0

    .line 198
    invoke-static {p0, p1, v8}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    check-cast p0, Ljava/util/List;

    .line 203
    .line 204
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 205
    .line 206
    .line 207
    move-result p1

    .line 208
    if-nez p1, :cond_a

    .line 209
    .line 210
    invoke-virtual {v7, v9}, Lnq1;->C(I)Lvq1;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    move v3, v0

    .line 215
    :goto_2
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 216
    .line 217
    .line 218
    move-result v4

    .line 219
    if-ge v3, v4, :cond_a

    .line 220
    .line 221
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v4

    .line 225
    invoke-interface {p1, v4}, Lvq1;->g(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result v4

    .line 229
    if-nez v4, :cond_8

    .line 230
    .line 231
    goto :goto_3

    .line 232
    :cond_8
    add-int/lit8 v3, v3, 0x1

    .line 233
    .line 234
    goto :goto_2

    .line 235
    :cond_9
    invoke-virtual/range {v7 .. v12}, Lnq1;->r(Ljava/lang/Object;IIII)Z

    .line 236
    .line 237
    .line 238
    move-result p0

    .line 239
    if-eqz p0, :cond_a

    .line 240
    .line 241
    invoke-virtual {v7, v9}, Lnq1;->C(I)Lvq1;

    .line 242
    .line 243
    .line 244
    move-result-object p0

    .line 245
    and-int p1, v5, v1

    .line 246
    .line 247
    int-to-long v3, p1

    .line 248
    invoke-static {v3, v4, v8}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    invoke-interface {p0, p1}, Lvq1;->g(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    move-result p0

    .line 256
    if-nez p0, :cond_a

    .line 257
    .line 258
    :goto_3
    return v0

    .line 259
    :cond_a
    :goto_4
    add-int/lit8 v2, v2, 0x1

    .line 260
    .line 261
    move-object p0, v7

    .line 262
    move-object p1, v8

    .line 263
    move v3, v10

    .line 264
    move v4, v11

    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :cond_b
    return v6
.end method

.method public final h(Lnp1;Lnp1;)Z
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lnq1;->a:[I

    .line 4
    .line 5
    array-length v3, v2

    .line 6
    const v4, 0xfffff

    .line 7
    .line 8
    .line 9
    if-ge v1, v3, :cond_3

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Lnq1;->k(I)I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    invoke-static {v3}, Lnq1;->l(I)I

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    const/16 v6, 0x32

    .line 20
    .line 21
    if-le v5, v6, :cond_0

    .line 22
    .line 23
    const/16 v6, 0x45

    .line 24
    .line 25
    if-ge v5, v6, :cond_0

    .line 26
    .line 27
    goto/16 :goto_2

    .line 28
    .line 29
    :cond_0
    and-int/2addr v3, v4

    .line 30
    int-to-long v6, v3

    .line 31
    packed-switch v5, :pswitch_data_0

    .line 32
    .line 33
    .line 34
    goto/16 :goto_2

    .line 35
    .line 36
    :pswitch_0
    add-int/lit8 v3, v1, 0x2

    .line 37
    .line 38
    aget v2, v2, v3

    .line 39
    .line 40
    and-int/2addr v2, v4

    .line 41
    int-to-long v2, v2

    .line 42
    invoke-static {v2, v3, p1}, Ler1;->d(JLjava/lang/Object;)I

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    invoke-static {v2, v3, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-ne v4, v2, :cond_1

    .line 51
    .line 52
    invoke-static {v6, v7, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-static {v6, v7, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-static {v2, v3}, Lwq1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_8

    .line 65
    .line 66
    goto/16 :goto_2

    .line 67
    .line 68
    :cond_1
    return v0

    .line 69
    :pswitch_1
    invoke-static {v6, v7, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-static {v6, v7, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-static {v2, v3}, Lwq1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    goto :goto_1

    .line 82
    :pswitch_2
    invoke-static {v6, v7, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-static {v6, v7, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-static {v2, v3}, Lwq1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    :goto_1
    if-nez v2, :cond_2

    .line 95
    .line 96
    goto/16 :goto_5

    .line 97
    .line 98
    :pswitch_3
    invoke-virtual {p0, p1, p2, v1}, Lnq1;->q(Lnp1;Lnp1;I)Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-eqz v2, :cond_8

    .line 103
    .line 104
    invoke-static {v6, v7, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-static {v6, v7, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-static {v2, v3}, Lwq1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-eqz v2, :cond_8

    .line 117
    .line 118
    goto/16 :goto_2

    .line 119
    .line 120
    :pswitch_4
    invoke-virtual {p0, p1, p2, v1}, Lnq1;->q(Lnp1;Lnp1;I)Z

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    if-eqz v2, :cond_8

    .line 125
    .line 126
    invoke-static {v6, v7, p1}, Ler1;->f(JLjava/lang/Object;)J

    .line 127
    .line 128
    .line 129
    move-result-wide v2

    .line 130
    invoke-static {v6, v7, p2}, Ler1;->f(JLjava/lang/Object;)J

    .line 131
    .line 132
    .line 133
    move-result-wide v4

    .line 134
    cmp-long v2, v2, v4

    .line 135
    .line 136
    if-nez v2, :cond_8

    .line 137
    .line 138
    goto/16 :goto_2

    .line 139
    .line 140
    :pswitch_5
    invoke-virtual {p0, p1, p2, v1}, Lnq1;->q(Lnp1;Lnp1;I)Z

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    if-eqz v2, :cond_8

    .line 145
    .line 146
    invoke-static {v6, v7, p1}, Ler1;->d(JLjava/lang/Object;)I

    .line 147
    .line 148
    .line 149
    move-result v2

    .line 150
    invoke-static {v6, v7, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 151
    .line 152
    .line 153
    move-result v3

    .line 154
    if-ne v2, v3, :cond_8

    .line 155
    .line 156
    goto/16 :goto_2

    .line 157
    .line 158
    :pswitch_6
    invoke-virtual {p0, p1, p2, v1}, Lnq1;->q(Lnp1;Lnp1;I)Z

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    if-eqz v2, :cond_8

    .line 163
    .line 164
    invoke-static {v6, v7, p1}, Ler1;->f(JLjava/lang/Object;)J

    .line 165
    .line 166
    .line 167
    move-result-wide v2

    .line 168
    invoke-static {v6, v7, p2}, Ler1;->f(JLjava/lang/Object;)J

    .line 169
    .line 170
    .line 171
    move-result-wide v4

    .line 172
    cmp-long v2, v2, v4

    .line 173
    .line 174
    if-nez v2, :cond_8

    .line 175
    .line 176
    goto/16 :goto_2

    .line 177
    .line 178
    :pswitch_7
    invoke-virtual {p0, p1, p2, v1}, Lnq1;->q(Lnp1;Lnp1;I)Z

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    if-eqz v2, :cond_8

    .line 183
    .line 184
    invoke-static {v6, v7, p1}, Ler1;->d(JLjava/lang/Object;)I

    .line 185
    .line 186
    .line 187
    move-result v2

    .line 188
    invoke-static {v6, v7, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 189
    .line 190
    .line 191
    move-result v3

    .line 192
    if-ne v2, v3, :cond_8

    .line 193
    .line 194
    goto/16 :goto_2

    .line 195
    .line 196
    :pswitch_8
    invoke-virtual {p0, p1, p2, v1}, Lnq1;->q(Lnp1;Lnp1;I)Z

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    if-eqz v2, :cond_8

    .line 201
    .line 202
    invoke-static {v6, v7, p1}, Ler1;->d(JLjava/lang/Object;)I

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    invoke-static {v6, v7, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    if-ne v2, v3, :cond_8

    .line 211
    .line 212
    goto/16 :goto_2

    .line 213
    .line 214
    :pswitch_9
    invoke-virtual {p0, p1, p2, v1}, Lnq1;->q(Lnp1;Lnp1;I)Z

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    if-eqz v2, :cond_8

    .line 219
    .line 220
    invoke-static {v6, v7, p1}, Ler1;->d(JLjava/lang/Object;)I

    .line 221
    .line 222
    .line 223
    move-result v2

    .line 224
    invoke-static {v6, v7, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 225
    .line 226
    .line 227
    move-result v3

    .line 228
    if-ne v2, v3, :cond_8

    .line 229
    .line 230
    goto/16 :goto_2

    .line 231
    .line 232
    :pswitch_a
    invoke-virtual {p0, p1, p2, v1}, Lnq1;->q(Lnp1;Lnp1;I)Z

    .line 233
    .line 234
    .line 235
    move-result v2

    .line 236
    if-eqz v2, :cond_8

    .line 237
    .line 238
    invoke-static {v6, v7, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    invoke-static {v6, v7, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object v3

    .line 246
    invoke-static {v2, v3}, Lwq1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 247
    .line 248
    .line 249
    move-result v2

    .line 250
    if-eqz v2, :cond_8

    .line 251
    .line 252
    goto/16 :goto_2

    .line 253
    .line 254
    :pswitch_b
    invoke-virtual {p0, p1, p2, v1}, Lnq1;->q(Lnp1;Lnp1;I)Z

    .line 255
    .line 256
    .line 257
    move-result v2

    .line 258
    if-eqz v2, :cond_8

    .line 259
    .line 260
    invoke-static {v6, v7, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object v2

    .line 264
    invoke-static {v6, v7, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    move-result-object v3

    .line 268
    invoke-static {v2, v3}, Lwq1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    move-result v2

    .line 272
    if-eqz v2, :cond_8

    .line 273
    .line 274
    goto/16 :goto_2

    .line 275
    .line 276
    :pswitch_c
    invoke-virtual {p0, p1, p2, v1}, Lnq1;->q(Lnp1;Lnp1;I)Z

    .line 277
    .line 278
    .line 279
    move-result v2

    .line 280
    if-eqz v2, :cond_8

    .line 281
    .line 282
    invoke-static {v6, v7, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object v2

    .line 286
    invoke-static {v6, v7, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object v3

    .line 290
    invoke-static {v2, v3}, Lwq1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 291
    .line 292
    .line 293
    move-result v2

    .line 294
    if-eqz v2, :cond_8

    .line 295
    .line 296
    goto/16 :goto_2

    .line 297
    .line 298
    :pswitch_d
    invoke-virtual {p0, p1, p2, v1}, Lnq1;->q(Lnp1;Lnp1;I)Z

    .line 299
    .line 300
    .line 301
    move-result v2

    .line 302
    if-eqz v2, :cond_8

    .line 303
    .line 304
    sget-object v2, Ler1;->c:Llf1;

    .line 305
    .line 306
    invoke-virtual {v2, v6, v7, p1}, Llf1;->l(JLjava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    move-result v3

    .line 310
    invoke-virtual {v2, v6, v7, p2}, Llf1;->l(JLjava/lang/Object;)Z

    .line 311
    .line 312
    .line 313
    move-result v2

    .line 314
    if-ne v3, v2, :cond_8

    .line 315
    .line 316
    goto/16 :goto_2

    .line 317
    .line 318
    :pswitch_e
    invoke-virtual {p0, p1, p2, v1}, Lnq1;->q(Lnp1;Lnp1;I)Z

    .line 319
    .line 320
    .line 321
    move-result v2

    .line 322
    if-eqz v2, :cond_8

    .line 323
    .line 324
    invoke-static {v6, v7, p1}, Ler1;->d(JLjava/lang/Object;)I

    .line 325
    .line 326
    .line 327
    move-result v2

    .line 328
    invoke-static {v6, v7, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 329
    .line 330
    .line 331
    move-result v3

    .line 332
    if-ne v2, v3, :cond_8

    .line 333
    .line 334
    goto/16 :goto_2

    .line 335
    .line 336
    :pswitch_f
    invoke-virtual {p0, p1, p2, v1}, Lnq1;->q(Lnp1;Lnp1;I)Z

    .line 337
    .line 338
    .line 339
    move-result v2

    .line 340
    if-eqz v2, :cond_8

    .line 341
    .line 342
    invoke-static {v6, v7, p1}, Ler1;->f(JLjava/lang/Object;)J

    .line 343
    .line 344
    .line 345
    move-result-wide v2

    .line 346
    invoke-static {v6, v7, p2}, Ler1;->f(JLjava/lang/Object;)J

    .line 347
    .line 348
    .line 349
    move-result-wide v4

    .line 350
    cmp-long v2, v2, v4

    .line 351
    .line 352
    if-nez v2, :cond_8

    .line 353
    .line 354
    goto/16 :goto_2

    .line 355
    .line 356
    :pswitch_10
    invoke-virtual {p0, p1, p2, v1}, Lnq1;->q(Lnp1;Lnp1;I)Z

    .line 357
    .line 358
    .line 359
    move-result v2

    .line 360
    if-eqz v2, :cond_8

    .line 361
    .line 362
    invoke-static {v6, v7, p1}, Ler1;->d(JLjava/lang/Object;)I

    .line 363
    .line 364
    .line 365
    move-result v2

    .line 366
    invoke-static {v6, v7, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 367
    .line 368
    .line 369
    move-result v3

    .line 370
    if-ne v2, v3, :cond_8

    .line 371
    .line 372
    goto :goto_2

    .line 373
    :pswitch_11
    invoke-virtual {p0, p1, p2, v1}, Lnq1;->q(Lnp1;Lnp1;I)Z

    .line 374
    .line 375
    .line 376
    move-result v2

    .line 377
    if-eqz v2, :cond_8

    .line 378
    .line 379
    invoke-static {v6, v7, p1}, Ler1;->f(JLjava/lang/Object;)J

    .line 380
    .line 381
    .line 382
    move-result-wide v2

    .line 383
    invoke-static {v6, v7, p2}, Ler1;->f(JLjava/lang/Object;)J

    .line 384
    .line 385
    .line 386
    move-result-wide v4

    .line 387
    cmp-long v2, v2, v4

    .line 388
    .line 389
    if-nez v2, :cond_8

    .line 390
    .line 391
    goto :goto_2

    .line 392
    :pswitch_12
    invoke-virtual {p0, p1, p2, v1}, Lnq1;->q(Lnp1;Lnp1;I)Z

    .line 393
    .line 394
    .line 395
    move-result v2

    .line 396
    if-eqz v2, :cond_8

    .line 397
    .line 398
    invoke-static {v6, v7, p1}, Ler1;->f(JLjava/lang/Object;)J

    .line 399
    .line 400
    .line 401
    move-result-wide v2

    .line 402
    invoke-static {v6, v7, p2}, Ler1;->f(JLjava/lang/Object;)J

    .line 403
    .line 404
    .line 405
    move-result-wide v4

    .line 406
    cmp-long v2, v2, v4

    .line 407
    .line 408
    if-nez v2, :cond_8

    .line 409
    .line 410
    goto :goto_2

    .line 411
    :pswitch_13
    invoke-virtual {p0, p1, p2, v1}, Lnq1;->q(Lnp1;Lnp1;I)Z

    .line 412
    .line 413
    .line 414
    move-result v2

    .line 415
    if-eqz v2, :cond_8

    .line 416
    .line 417
    sget-object v2, Ler1;->c:Llf1;

    .line 418
    .line 419
    invoke-virtual {v2, v6, v7, p1}, Llf1;->n(JLjava/lang/Object;)F

    .line 420
    .line 421
    .line 422
    move-result v3

    .line 423
    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 424
    .line 425
    .line 426
    move-result v3

    .line 427
    invoke-virtual {v2, v6, v7, p2}, Llf1;->n(JLjava/lang/Object;)F

    .line 428
    .line 429
    .line 430
    move-result v2

    .line 431
    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 432
    .line 433
    .line 434
    move-result v2

    .line 435
    if-ne v3, v2, :cond_8

    .line 436
    .line 437
    goto :goto_2

    .line 438
    :pswitch_14
    invoke-virtual {p0, p1, p2, v1}, Lnq1;->q(Lnp1;Lnp1;I)Z

    .line 439
    .line 440
    .line 441
    move-result v2

    .line 442
    if-eqz v2, :cond_8

    .line 443
    .line 444
    sget-object v2, Ler1;->c:Llf1;

    .line 445
    .line 446
    invoke-virtual {v2, v6, v7, p1}, Llf1;->p(JLjava/lang/Object;)D

    .line 447
    .line 448
    .line 449
    move-result-wide v3

    .line 450
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 451
    .line 452
    .line 453
    move-result-wide v3

    .line 454
    invoke-virtual {v2, v6, v7, p2}, Llf1;->p(JLjava/lang/Object;)D

    .line 455
    .line 456
    .line 457
    move-result-wide v5

    .line 458
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 459
    .line 460
    .line 461
    move-result-wide v5

    .line 462
    cmp-long v2, v3, v5

    .line 463
    .line 464
    if-nez v2, :cond_8

    .line 465
    .line 466
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x3

    .line 467
    .line 468
    goto/16 :goto_0

    .line 469
    .line 470
    :cond_3
    iget v1, p0, Lnq1;->i:I

    .line 471
    .line 472
    :goto_3
    iget-object v3, p0, Lnq1;->g:[I

    .line 473
    .line 474
    array-length v5, v3

    .line 475
    if-ge v1, v5, :cond_7

    .line 476
    .line 477
    aget v3, v3, v1

    .line 478
    .line 479
    add-int/lit8 v5, v3, 0x2

    .line 480
    .line 481
    aget v5, v2, v5

    .line 482
    .line 483
    and-int/2addr v5, v4

    .line 484
    int-to-long v5, v5

    .line 485
    invoke-static {v5, v6, p1}, Ler1;->d(JLjava/lang/Object;)I

    .line 486
    .line 487
    .line 488
    move-result v7

    .line 489
    invoke-static {v5, v6, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 490
    .line 491
    .line 492
    move-result v5

    .line 493
    if-ne v7, v5, :cond_6

    .line 494
    .line 495
    invoke-virtual {p0, v0, p1, v3}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 496
    .line 497
    .line 498
    move-result v5

    .line 499
    if-eqz v5, :cond_4

    .line 500
    .line 501
    goto :goto_4

    .line 502
    :cond_4
    invoke-virtual {p0, v3}, Lnq1;->k(I)I

    .line 503
    .line 504
    .line 505
    move-result v3

    .line 506
    and-int/2addr v3, v4

    .line 507
    int-to-long v5, v3

    .line 508
    invoke-static {v5, v6, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 509
    .line 510
    .line 511
    move-result-object v3

    .line 512
    invoke-static {v5, v6, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 513
    .line 514
    .line 515
    move-result-object v5

    .line 516
    invoke-static {v3, v5}, Lwq1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 517
    .line 518
    .line 519
    move-result v3

    .line 520
    if-nez v3, :cond_5

    .line 521
    .line 522
    goto :goto_5

    .line 523
    :cond_5
    :goto_4
    add-int/lit8 v1, v1, 0x1

    .line 524
    .line 525
    goto :goto_3

    .line 526
    :cond_6
    return v0

    .line 527
    :cond_7
    iget-object p0, p1, Lnp1;->zzc:Lcr1;

    .line 528
    .line 529
    iget-object p1, p2, Lnp1;->zzc:Lcr1;

    .line 530
    .line 531
    invoke-virtual {p0, p1}, Lcr1;->equals(Ljava/lang/Object;)Z

    .line 532
    .line 533
    .line 534
    move-result p0

    .line 535
    if-nez p0, :cond_9

    .line 536
    .line 537
    :cond_8
    :goto_5
    return v0

    .line 538
    :cond_9
    const/4 p0, 0x1

    .line 539
    return p0

    .line 540
    nop

    .line 541
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final i(Ljava/lang/Object;)V
    .locals 8

    .line 1
    invoke-static {p1}, Lnq1;->m(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_2

    .line 8
    .line 9
    :cond_0
    instance-of v0, p1, Lnp1;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    move-object v0, p1

    .line 15
    check-cast v0, Lnp1;

    .line 16
    .line 17
    invoke-virtual {v0}, Lnp1;->j()V

    .line 18
    .line 19
    .line 20
    iput v1, v0, Lqo1;->zza:I

    .line 21
    .line 22
    invoke-virtual {v0}, Lnp1;->f()V

    .line 23
    .line 24
    .line 25
    :cond_1
    move v0, v1

    .line 26
    :goto_0
    iget-object v2, p0, Lnq1;->a:[I

    .line 27
    .line 28
    array-length v3, v2

    .line 29
    if-ge v0, v3, :cond_5

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lnq1;->k(I)I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    const v4, 0xfffff

    .line 36
    .line 37
    .line 38
    and-int/2addr v4, v3

    .line 39
    invoke-static {v3}, Lnq1;->l(I)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    int-to-long v4, v4

    .line 44
    const/16 v6, 0x9

    .line 45
    .line 46
    sget-object v7, Lnq1;->l:Lsun/misc/Unsafe;

    .line 47
    .line 48
    if-eq v3, v6, :cond_3

    .line 49
    .line 50
    const/16 v6, 0x3c

    .line 51
    .line 52
    if-eq v3, v6, :cond_2

    .line 53
    .line 54
    const/16 v6, 0x44

    .line 55
    .line 56
    if-eq v3, v6, :cond_2

    .line 57
    .line 58
    packed-switch v3, :pswitch_data_0

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :pswitch_0
    invoke-virtual {v7, p1, v4, v5}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    if-eqz v2, :cond_4

    .line 67
    .line 68
    move-object v3, v2

    .line 69
    check-cast v3, Lfq1;

    .line 70
    .line 71
    iput-boolean v1, v3, Lfq1;->j:Z

    .line 72
    .line 73
    invoke-virtual {v7, p1, v4, v5, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :pswitch_1
    invoke-static {v4, v5, p1}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Lyp1;

    .line 82
    .line 83
    check-cast v2, Lro1;

    .line 84
    .line 85
    iget-boolean v3, v2, Lro1;->j:Z

    .line 86
    .line 87
    if-eqz v3, :cond_4

    .line 88
    .line 89
    iput-boolean v1, v2, Lro1;->j:Z

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_2
    aget v2, v2, v0

    .line 93
    .line 94
    invoke-virtual {p0, v2, p1, v0}, Lnq1;->u(ILjava/lang/Object;I)Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_4

    .line 99
    .line 100
    invoke-virtual {p0, v0}, Lnq1;->C(I)Lvq1;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {v7, p1, v4, v5}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-interface {v2, v3}, Lvq1;->i(Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_3
    :pswitch_2
    invoke-virtual {p0, v0, p1}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-eqz v2, :cond_4

    .line 117
    .line 118
    invoke-virtual {p0, v0}, Lnq1;->C(I)Lvq1;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    invoke-virtual {v7, p1, v4, v5}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-interface {v2, v3}, Lvq1;->i(Ljava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    :cond_4
    :goto_1
    add-int/lit8 v0, v0, 0x3

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_5
    iget-object p0, p0, Lnq1;->j:Ltb0;

    .line 133
    .line 134
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 135
    .line 136
    .line 137
    check-cast p1, Lnp1;

    .line 138
    .line 139
    iget-object p0, p1, Lnp1;->zzc:Lcr1;

    .line 140
    .line 141
    iget-boolean p1, p0, Lcr1;->e:Z

    .line 142
    .line 143
    if-eqz p1, :cond_6

    .line 144
    .line 145
    iput-boolean v1, p0, Lcr1;->e:Z

    .line 146
    .line 147
    :cond_6
    :goto_2
    return-void

    .line 148
    nop

    .line 149
    :pswitch_data_0
    .packed-switch 0x11
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final j(Ljava/lang/Object;[BIILto1;)V
    .locals 7

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move-object v6, p5

    .line 8
    invoke-virtual/range {v0 .. v6}, Lnq1;->y(Ljava/lang/Object;[BIIILto1;)I

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final k(I)I
    .locals 0

    .line 1
    add-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    iget-object p0, p0, Lnq1;->a:[I

    .line 4
    .line 5
    aget p0, p0, p1

    .line 6
    .line 7
    return p0
.end method

.method public final q(Lnp1;Lnp1;I)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p3, p1}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p3, p2}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ne p1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final r(Ljava/lang/Object;IIII)Z
    .locals 1

    .line 1
    const v0, 0xfffff

    .line 2
    .line 3
    .line 4
    if-ne p3, v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, p2, p1}, Lnq1;->s(ILjava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0

    .line 11
    :cond_0
    and-int p0, p4, p5

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final s(ILjava/lang/Object;)Z
    .locals 6

    .line 1
    add-int/lit8 v0, p1, 0x2

    .line 2
    .line 3
    iget-object v1, p0, Lnq1;->a:[I

    .line 4
    .line 5
    aget v0, v1, v0

    .line 6
    .line 7
    const v1, 0xfffff

    .line 8
    .line 9
    .line 10
    and-int v2, v0, v1

    .line 11
    .line 12
    int-to-long v2, v2

    .line 13
    const-wide/32 v4, 0xfffff

    .line 14
    .line 15
    .line 16
    cmp-long v4, v2, v4

    .line 17
    .line 18
    const/4 v5, 0x1

    .line 19
    if-nez v4, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lnq1;->k(I)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    and-int p1, p0, v1

    .line 26
    .line 27
    invoke-static {p0}, Lnq1;->l(I)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    int-to-long v0, p1

    .line 32
    const-wide/16 v2, 0x0

    .line 33
    .line 34
    packed-switch p0, :pswitch_data_0

    .line 35
    .line 36
    .line 37
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 38
    .line 39
    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 40
    .line 41
    .line 42
    throw p0

    .line 43
    :pswitch_0
    invoke-static {v0, v1, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    if-eqz p0, :cond_3

    .line 48
    .line 49
    goto/16 :goto_0

    .line 50
    .line 51
    :pswitch_1
    invoke-static {v0, v1, p2}, Ler1;->f(JLjava/lang/Object;)J

    .line 52
    .line 53
    .line 54
    move-result-wide p0

    .line 55
    cmp-long p0, p0, v2

    .line 56
    .line 57
    if-eqz p0, :cond_3

    .line 58
    .line 59
    goto/16 :goto_0

    .line 60
    .line 61
    :pswitch_2
    invoke-static {v0, v1, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-eqz p0, :cond_3

    .line 66
    .line 67
    goto/16 :goto_0

    .line 68
    .line 69
    :pswitch_3
    invoke-static {v0, v1, p2}, Ler1;->f(JLjava/lang/Object;)J

    .line 70
    .line 71
    .line 72
    move-result-wide p0

    .line 73
    cmp-long p0, p0, v2

    .line 74
    .line 75
    if-eqz p0, :cond_3

    .line 76
    .line 77
    goto/16 :goto_0

    .line 78
    .line 79
    :pswitch_4
    invoke-static {v0, v1, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-eqz p0, :cond_3

    .line 84
    .line 85
    goto/16 :goto_0

    .line 86
    .line 87
    :pswitch_5
    invoke-static {v0, v1, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-eqz p0, :cond_3

    .line 92
    .line 93
    goto/16 :goto_0

    .line 94
    .line 95
    :pswitch_6
    invoke-static {v0, v1, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    if-eqz p0, :cond_3

    .line 100
    .line 101
    goto/16 :goto_0

    .line 102
    .line 103
    :pswitch_7
    sget-object p0, Lxo1;->k:Lwo1;

    .line 104
    .line 105
    invoke-static {v0, v1, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p0, p1}, Lxo1;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-nez p0, :cond_3

    .line 114
    .line 115
    goto/16 :goto_0

    .line 116
    .line 117
    :pswitch_8
    invoke-static {v0, v1, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    if-eqz p0, :cond_3

    .line 122
    .line 123
    goto/16 :goto_0

    .line 124
    .line 125
    :pswitch_9
    invoke-static {v0, v1, p2}, Ler1;->h(JLjava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    instance-of p1, p0, Ljava/lang/String;

    .line 130
    .line 131
    if-eqz p1, :cond_0

    .line 132
    .line 133
    check-cast p0, Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    if-nez p0, :cond_3

    .line 140
    .line 141
    goto/16 :goto_0

    .line 142
    .line 143
    :cond_0
    instance-of p1, p0, Lxo1;

    .line 144
    .line 145
    if-eqz p1, :cond_1

    .line 146
    .line 147
    sget-object p1, Lxo1;->k:Lwo1;

    .line 148
    .line 149
    invoke-virtual {p1, p0}, Lxo1;->equals(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    if-nez p0, :cond_3

    .line 154
    .line 155
    goto :goto_0

    .line 156
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 157
    .line 158
    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 159
    .line 160
    .line 161
    throw p0

    .line 162
    :pswitch_a
    sget-object p0, Ler1;->c:Llf1;

    .line 163
    .line 164
    invoke-virtual {p0, v0, v1, p2}, Llf1;->l(JLjava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result p0

    .line 168
    return p0

    .line 169
    :pswitch_b
    invoke-static {v0, v1, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    if-eqz p0, :cond_3

    .line 174
    .line 175
    goto :goto_0

    .line 176
    :pswitch_c
    invoke-static {v0, v1, p2}, Ler1;->f(JLjava/lang/Object;)J

    .line 177
    .line 178
    .line 179
    move-result-wide p0

    .line 180
    cmp-long p0, p0, v2

    .line 181
    .line 182
    if-eqz p0, :cond_3

    .line 183
    .line 184
    goto :goto_0

    .line 185
    :pswitch_d
    invoke-static {v0, v1, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 186
    .line 187
    .line 188
    move-result p0

    .line 189
    if-eqz p0, :cond_3

    .line 190
    .line 191
    goto :goto_0

    .line 192
    :pswitch_e
    invoke-static {v0, v1, p2}, Ler1;->f(JLjava/lang/Object;)J

    .line 193
    .line 194
    .line 195
    move-result-wide p0

    .line 196
    cmp-long p0, p0, v2

    .line 197
    .line 198
    if-eqz p0, :cond_3

    .line 199
    .line 200
    goto :goto_0

    .line 201
    :pswitch_f
    invoke-static {v0, v1, p2}, Ler1;->f(JLjava/lang/Object;)J

    .line 202
    .line 203
    .line 204
    move-result-wide p0

    .line 205
    cmp-long p0, p0, v2

    .line 206
    .line 207
    if-eqz p0, :cond_3

    .line 208
    .line 209
    goto :goto_0

    .line 210
    :pswitch_10
    sget-object p0, Ler1;->c:Llf1;

    .line 211
    .line 212
    invoke-virtual {p0, v0, v1, p2}, Llf1;->n(JLjava/lang/Object;)F

    .line 213
    .line 214
    .line 215
    move-result p0

    .line 216
    invoke-static {p0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    .line 217
    .line 218
    .line 219
    move-result p0

    .line 220
    if-eqz p0, :cond_3

    .line 221
    .line 222
    goto :goto_0

    .line 223
    :pswitch_11
    sget-object p0, Ler1;->c:Llf1;

    .line 224
    .line 225
    invoke-virtual {p0, v0, v1, p2}, Llf1;->p(JLjava/lang/Object;)D

    .line 226
    .line 227
    .line 228
    move-result-wide p0

    .line 229
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    .line 230
    .line 231
    .line 232
    move-result-wide p0

    .line 233
    cmp-long p0, p0, v2

    .line 234
    .line 235
    if-eqz p0, :cond_3

    .line 236
    .line 237
    goto :goto_0

    .line 238
    :cond_2
    ushr-int/lit8 p0, v0, 0x14

    .line 239
    .line 240
    shl-int p0, v5, p0

    .line 241
    .line 242
    invoke-static {v2, v3, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 243
    .line 244
    .line 245
    move-result p1

    .line 246
    and-int/2addr p0, p1

    .line 247
    if-eqz p0, :cond_3

    .line 248
    .line 249
    :goto_0
    return v5

    .line 250
    :cond_3
    const/4 p0, 0x0

    .line 251
    return p0

    .line 252
    nop

    .line 253
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
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final t(ILjava/lang/Object;)V
    .locals 4

    .line 1
    add-int/lit8 p1, p1, 0x2

    .line 2
    .line 3
    iget-object p0, p0, Lnq1;->a:[I

    .line 4
    .line 5
    aget p0, p0, p1

    .line 6
    .line 7
    const p1, 0xfffff

    .line 8
    .line 9
    .line 10
    and-int/2addr p1, p0

    .line 11
    int-to-long v0, p1

    .line 12
    const-wide/32 v2, 0xfffff

    .line 13
    .line 14
    .line 15
    cmp-long p1, v0, v2

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    ushr-int/lit8 p0, p0, 0x14

    .line 21
    .line 22
    invoke-static {v0, v1, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const/4 v2, 0x1

    .line 27
    shl-int p0, v2, p0

    .line 28
    .line 29
    or-int/2addr p0, p1

    .line 30
    invoke-static {p2, v0, v1, p0}, Ler1;->e(Ljava/lang/Object;JI)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final u(ILjava/lang/Object;I)Z
    .locals 2

    .line 1
    add-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    iget-object p0, p0, Lnq1;->a:[I

    .line 4
    .line 5
    aget p0, p0, p3

    .line 6
    .line 7
    const p3, 0xfffff

    .line 8
    .line 9
    .line 10
    and-int/2addr p0, p3

    .line 11
    int-to-long v0, p0

    .line 12
    invoke-static {v0, v1, p2}, Ler1;->d(JLjava/lang/Object;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-ne p0, p1, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public final v(ILjava/lang/Object;I)V
    .locals 2

    .line 1
    add-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    iget-object p0, p0, Lnq1;->a:[I

    .line 4
    .line 5
    aget p0, p0, p3

    .line 6
    .line 7
    const p3, 0xfffff

    .line 8
    .line 9
    .line 10
    and-int/2addr p0, p3

    .line 11
    int-to-long v0, p0

    .line 12
    invoke-static {p2, v0, v1, p1}, Ler1;->e(Ljava/lang/Object;JI)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final w(II)I
    .locals 5

    .line 1
    iget-object p0, p0, Lnq1;->a:[I

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    div-int/lit8 v0, v0, 0x3

    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    add-int/2addr v0, v1

    .line 8
    :goto_0
    if-gt p2, v0, :cond_2

    .line 9
    .line 10
    add-int v2, v0, p2

    .line 11
    .line 12
    ushr-int/lit8 v2, v2, 0x1

    .line 13
    .line 14
    mul-int/lit8 v3, v2, 0x3

    .line 15
    .line 16
    aget v4, p0, v3

    .line 17
    .line 18
    if-ne p1, v4, :cond_0

    .line 19
    .line 20
    return v3

    .line 21
    :cond_0
    if-ge p1, v4, :cond_1

    .line 22
    .line 23
    add-int/lit8 v0, v2, -0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    add-int/lit8 p2, v2, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    return v1
.end method

.method public final y(Ljava/lang/Object;[BIIILto1;)I
    .locals 39

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v5, p4

    move-object/from16 v6, p6

    .line 1
    invoke-static {v2}, Lnq1;->n(Ljava/lang/Object;)V

    move/from16 v1, p3

    const/4 v4, -0x1

    const/4 v7, 0x0

    const v8, 0xfffff

    const/4 v9, 0x0

    const/4 v14, 0x0

    :goto_0
    const-string v15, "Failed to parse the message."

    const v16, 0xfffff

    sget-object v13, Lnq1;->l:Lsun/misc/Unsafe;

    if-ge v1, v5, :cond_7e

    add-int/lit8 v14, v1, 0x1

    .line 2
    aget-byte v1, v3, v1

    if-gez v1, :cond_0

    .line 3
    invoke-static {v1, v3, v14, v6}, Les0;->q(I[BILto1;)I

    move-result v14

    iget v1, v6, Lto1;->a:I

    :cond_0
    move v6, v14

    move v14, v1

    ushr-int/lit8 v1, v14, 0x3

    iget v12, v0, Lnq1;->d:I

    const/16 p3, 0x3

    iget v11, v0, Lnq1;->c:I

    if-le v1, v4, :cond_2

    div-int/lit8 v7, v7, 0x3

    if-lt v1, v11, :cond_1

    if-gt v1, v12, :cond_1

    .line 4
    invoke-virtual {v0, v1, v7}, Lnq1;->w(II)I

    move-result v4

    goto :goto_1

    :cond_1
    const/4 v4, -0x1

    :goto_1
    move v11, v4

    goto :goto_3

    :cond_2
    if-lt v1, v11, :cond_3

    if-gt v1, v12, :cond_3

    const/4 v4, 0x0

    .line 5
    invoke-virtual {v0, v1, v4}, Lnq1;->w(II)I

    move-result v7

    goto :goto_2

    :cond_3
    const/4 v7, -0x1

    :goto_2
    move v11, v7

    .line 6
    :goto_3
    sget-object v12, Lcr1;->f:Lcr1;

    const/4 v4, -0x1

    if-ne v11, v4, :cond_4

    move v10, v1

    move/from16 v19, v4

    move v1, v6

    move-object v11, v12

    move v12, v14

    move-object/from16 v28, v15

    const/4 v7, 0x0

    move/from16 v15, p5

    move-object/from16 v4, p6

    move-object v14, v13

    move-object v13, v2

    goto/16 :goto_50

    :cond_4
    and-int/lit8 v7, v14, 0x7

    add-int/lit8 v17, v11, 0x1

    .line 7
    iget-object v4, v0, Lnq1;->a:[I

    move/from16 v20, v1

    aget v1, v4, v17

    invoke-static {v1}, Lnq1;->l(I)I

    move-result v3

    move-object/from16 v17, v4

    and-int v4, v1, v16

    int-to-long v4, v4

    move-wide/from16 v21, v4

    const/16 v4, 0x11

    const-wide/16 v23, 0x0

    const/high16 v25, 0x20000000

    const-string v5, ""

    const-string v27, "CodedInputStream encountered an embedded string or message which claimed to have negative size."

    move-object/from16 v28, v15

    const/16 v29, 0x1

    if-gt v3, v4, :cond_18

    add-int/lit8 v4, v11, 0x2

    .line 8
    aget v4, v17, v4

    ushr-int/lit8 v17, v4, 0x14

    shl-int v17, v29, v17

    and-int v4, v4, v16

    if-eq v4, v8, :cond_7

    move/from16 v15, v16

    move-object/from16 v32, v5

    move/from16 v31, v6

    if-eq v8, v15, :cond_5

    int-to-long v5, v8

    .line 9
    invoke-virtual {v13, v2, v5, v6, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    :cond_5
    if-ne v4, v15, :cond_6

    const/4 v5, 0x0

    goto :goto_4

    :cond_6
    int-to-long v5, v4

    .line 10
    invoke-virtual {v13, v2, v5, v6}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v5

    :goto_4
    move v15, v4

    move v9, v5

    goto :goto_5

    :cond_7
    move-object/from16 v32, v5

    move/from16 v31, v6

    move v15, v8

    :goto_5
    packed-switch v3, :pswitch_data_0

    move/from16 v3, p3

    if-ne v7, v3, :cond_8

    or-int v1, v9, v17

    .line 11
    invoke-virtual {v0, v11, v2}, Lnq1;->F(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    shl-int/lit8 v4, v20, 0x3

    or-int/lit8 v8, v4, 0x4

    .line 12
    invoke-virtual {v0, v11}, Lnq1;->C(I)Lvq1;

    move-result-object v4

    move-object/from16 v5, p2

    move/from16 v7, p4

    move-object/from16 v9, p6

    move/from16 v6, v31

    const/16 v19, -0x1

    .line 13
    invoke-static/range {v3 .. v9}, Les0;->x(Ljava/lang/Object;Lvq1;[BIIILto1;)I

    move-result v4

    move-object v8, v5

    move-object v5, v3

    move-object v3, v9

    .line 14
    invoke-virtual {v0, v2, v11, v5}, Lnq1;->G(Ljava/lang/Object;ILjava/lang/Object;)V

    move/from16 v5, p4

    move v9, v1

    move-object v6, v3

    move v1, v4

    move-object v3, v8

    :goto_6
    move v7, v11

    :goto_7
    move v8, v15

    :goto_8
    move/from16 v4, v20

    goto/16 :goto_0

    :cond_8
    const/16 v19, -0x1

    move-object/from16 v8, p6

    move-object v5, v2

    move/from16 p3, v9

    move-object v4, v13

    move/from16 v2, v31

    move-object/from16 v13, p2

    goto/16 :goto_16

    :pswitch_0
    move-object/from16 v8, p2

    move-object/from16 v3, p6

    move/from16 v4, v31

    const/16 v19, -0x1

    if-nez v7, :cond_9

    or-int v9, v9, v17

    .line 15
    invoke-static {v8, v4, v3}, Les0;->r([BILto1;)I

    move-result v7

    iget-wide v4, v3, Lto1;->b:J

    .line 16
    invoke-static {v4, v5}, Lap1;->k(J)J

    move-result-wide v5

    move-object v1, v13

    move-object v13, v3

    move-wide/from16 v3, v21

    .line 17
    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    move/from16 v5, p4

    move v1, v7

    :goto_9
    move-object v3, v8

    move v7, v11

    move-object v6, v13

    goto :goto_7

    :cond_9
    move-object/from16 v37, v13

    move-object v13, v3

    move-object/from16 v3, v37

    :cond_a
    move-object/from16 p3, v13

    move-object v13, v8

    move-object/from16 v8, p3

    move-object v5, v2

    move v2, v4

    move/from16 p3, v9

    :goto_a
    move-object v4, v3

    goto/16 :goto_16

    :pswitch_1
    move-object/from16 v8, p2

    move-object v3, v13

    move-wide/from16 v5, v21

    move/from16 v4, v31

    const/16 v19, -0x1

    move-object/from16 v13, p6

    if-nez v7, :cond_a

    or-int v9, v9, v17

    .line 18
    invoke-static {v8, v4, v13}, Les0;->o([BILto1;)I

    move-result v1

    iget v4, v13, Lto1;->a:I

    .line 19
    invoke-static {v4}, Lap1;->j(I)I

    move-result v4

    .line 20
    invoke-virtual {v3, v2, v5, v6, v4}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    :goto_b
    move/from16 v5, p4

    goto :goto_9

    :pswitch_2
    move-object/from16 v8, p2

    move-object v3, v13

    move-wide/from16 v5, v21

    move/from16 v4, v31

    const/16 v19, -0x1

    move-object/from16 v13, p6

    if-nez v7, :cond_a

    .line 21
    invoke-static {v8, v4, v13}, Les0;->o([BILto1;)I

    move-result v4

    iget v7, v13, Lto1;->a:I

    move/from16 p3, v4

    .line 22
    invoke-virtual {v0, v11}, Lnq1;->E(I)Llo1;

    move-result-object v4

    const/high16 v21, -0x80000000

    and-int v1, v1, v21

    if-eqz v1, :cond_d

    if-eqz v4, :cond_d

    invoke-virtual {v4, v7}, Llo1;->a(I)Z

    move-result v1

    if-eqz v1, :cond_b

    goto :goto_d

    .line 23
    :cond_b
    move-object v1, v2

    check-cast v1, Lnp1;

    iget-object v3, v1, Lnp1;->zzc:Lcr1;

    if-ne v3, v12, :cond_c

    invoke-static {}, Lcr1;->a()Lcr1;

    move-result-object v3

    .line 24
    iput-object v3, v1, Lnp1;->zzc:Lcr1;

    :cond_c
    int-to-long v4, v7

    .line 25
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v3, v14, v1}, Lcr1;->d(ILjava/lang/Object;)V

    :goto_c
    move/from16 v1, p3

    goto :goto_b

    :cond_d
    :goto_d
    or-int v9, v9, v17

    .line 26
    invoke-virtual {v3, v2, v5, v6, v7}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_c

    :pswitch_3
    move-object/from16 v8, p2

    move-object v3, v13

    move-wide/from16 v5, v21

    move/from16 v4, v31

    const/4 v1, 0x2

    const/16 v19, -0x1

    move-object/from16 v13, p6

    if-ne v7, v1, :cond_a

    or-int v9, v9, v17

    .line 27
    invoke-static {v8, v4, v13}, Les0;->v([BILto1;)I

    move-result v1

    iget-object v4, v13, Lto1;->c:Ljava/lang/Object;

    .line 28
    invoke-virtual {v3, v2, v5, v6, v4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_b

    :pswitch_4
    move-object/from16 v8, p2

    move-object v3, v13

    move/from16 v4, v31

    const/4 v1, 0x2

    const/16 v19, -0x1

    move-object/from16 v13, p6

    if-ne v7, v1, :cond_e

    or-int v9, v9, v17

    .line 29
    invoke-virtual {v0, v11, v2}, Lnq1;->F(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 30
    invoke-virtual {v0, v11}, Lnq1;->C(I)Lvq1;

    move-result-object v2

    move/from16 v5, p4

    move-object v3, v8

    move-object v6, v13

    move-object/from16 v8, p1

    .line 31
    invoke-static/range {v1 .. v6}, Les0;->w(Ljava/lang/Object;Lvq1;[BIILto1;)I

    move-result v2

    move-object v13, v3

    move-object v4, v6

    .line 32
    invoke-virtual {v0, v8, v11, v1}, Lnq1;->G(Ljava/lang/Object;ILjava/lang/Object;)V

    move v1, v2

    move-object v2, v8

    goto/16 :goto_6

    :cond_e
    move-object/from16 v37, v8

    move-object v8, v2

    move v2, v4

    move-object v4, v13

    move-object/from16 v13, v37

    move-object v5, v8

    move/from16 p3, v9

    :goto_e
    move-object v8, v4

    goto/16 :goto_a

    :pswitch_5
    move-object/from16 v4, p6

    move-object v8, v2

    move/from16 p3, v9

    move-object v3, v13

    move-wide/from16 v5, v21

    move/from16 v2, v31

    const/4 v9, 0x2

    const/16 v19, -0x1

    move-object/from16 v13, p2

    if-ne v7, v9, :cond_12

    and-int v1, v1, v25

    if-eqz v1, :cond_f

    or-int v1, p3, v17

    .line 33
    invoke-static {v13, v2, v4}, Les0;->u([BILto1;)I

    move-result v2

    move v9, v1

    move v1, v2

    goto :goto_10

    .line 34
    :cond_f
    invoke-static {v13, v2, v4}, Les0;->o([BILto1;)I

    move-result v1

    iget v2, v4, Lto1;->a:I

    if-ltz v2, :cond_11

    or-int v7, p3, v17

    if-nez v2, :cond_10

    move-object/from16 v9, v32

    .line 35
    iput-object v9, v4, Lto1;->c:Ljava/lang/Object;

    :goto_f
    move v9, v7

    goto :goto_10

    :cond_10
    new-instance v9, Ljava/lang/String;

    .line 36
    sget-object v12, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v9, v13, v1, v2, v12}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    iput-object v9, v4, Lto1;->c:Ljava/lang/Object;

    add-int/2addr v1, v2

    goto :goto_f

    .line 37
    :goto_10
    iget-object v2, v4, Lto1;->c:Ljava/lang/Object;

    .line 38
    invoke-virtual {v3, v8, v5, v6, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :goto_11
    move/from16 v5, p4

    move-object v6, v4

    move-object v2, v8

    :goto_12
    move v7, v11

    move-object v3, v13

    goto/16 :goto_7

    .line 39
    :cond_11
    invoke-static/range {v27 .. v27}, Lwd1;->f(Ljava/lang/String;)V

    const/16 v18, 0x0

    return v18

    :cond_12
    move-object v5, v8

    goto :goto_e

    :pswitch_6
    move-object/from16 v4, p6

    move-object v8, v2

    move/from16 p3, v9

    move-object v3, v13

    move-wide/from16 v5, v21

    move/from16 v2, v31

    const/16 v19, -0x1

    move-object/from16 v13, p2

    if-nez v7, :cond_12

    or-int v9, p3, v17

    .line 40
    invoke-static {v13, v2, v4}, Les0;->r([BILto1;)I

    move-result v1

    iget-wide v2, v4, Lto1;->b:J

    cmp-long v2, v2, v23

    if-eqz v2, :cond_13

    move/from16 v2, v29

    goto :goto_13

    :cond_13
    const/4 v2, 0x0

    .line 41
    :goto_13
    sget-object v3, Ler1;->c:Llf1;

    invoke-virtual {v3, v8, v5, v6, v2}, Llf1;->m(Ljava/lang/Object;JZ)V

    goto :goto_11

    :pswitch_7
    move-object/from16 v4, p6

    move-object v8, v2

    move/from16 p3, v9

    move-object v3, v13

    move-wide/from16 v5, v21

    move/from16 v2, v31

    const/4 v1, 0x5

    const/16 v19, -0x1

    move-object/from16 v13, p2

    if-ne v7, v1, :cond_12

    add-int/lit8 v1, v2, 0x4

    or-int v9, p3, v17

    .line 42
    invoke-static {v2, v13}, Les0;->s(I[B)I

    move-result v2

    invoke-virtual {v3, v8, v5, v6, v2}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_11

    :pswitch_8
    move-object/from16 v4, p6

    move-object v8, v2

    move/from16 p3, v9

    move-object v3, v13

    move-wide/from16 v5, v21

    move/from16 v1, v29

    move/from16 v2, v31

    const/16 v19, -0x1

    move-object/from16 v13, p2

    if-ne v7, v1, :cond_14

    add-int/lit8 v7, v2, 0x8

    or-int v9, p3, v17

    move-wide/from16 v21, v5

    .line 43
    invoke-static {v2, v13}, Les0;->t(I[B)J

    move-result-wide v5

    move-object v1, v3

    move-object v2, v8

    move-object v8, v4

    move-wide/from16 v3, v21

    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    :goto_14
    move/from16 v5, p4

    move v1, v7

    :goto_15
    move-object v6, v8

    goto :goto_12

    :cond_14
    move-object v1, v8

    move-object v8, v4

    :cond_15
    move-object v5, v1

    goto/16 :goto_a

    :pswitch_9
    move-object/from16 v8, p6

    move-object v1, v2

    move/from16 p3, v9

    move-object v3, v13

    move-wide/from16 v5, v21

    move/from16 v2, v31

    const/16 v19, -0x1

    move-object/from16 v13, p2

    if-nez v7, :cond_15

    or-int v9, p3, v17

    .line 44
    invoke-static {v13, v2, v8}, Les0;->o([BILto1;)I

    move-result v2

    iget v4, v8, Lto1;->a:I

    .line 45
    invoke-virtual {v3, v1, v5, v6, v4}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    move v3, v2

    move-object v2, v1

    move v1, v3

    move/from16 v5, p4

    goto :goto_15

    :pswitch_a
    move-object/from16 v8, p6

    move-object v1, v2

    move/from16 p3, v9

    move-object v3, v13

    move-wide/from16 v5, v21

    move/from16 v2, v31

    const/16 v19, -0x1

    move-object/from16 v13, p2

    if-nez v7, :cond_16

    or-int v9, p3, v17

    .line 46
    invoke-static {v13, v2, v8}, Les0;->r([BILto1;)I

    move-result v7

    move-wide/from16 v21, v5

    iget-wide v5, v8, Lto1;->b:J

    move-object v2, v1

    move-object v1, v3

    move-wide/from16 v3, v21

    .line 47
    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    goto :goto_14

    :cond_16
    move-object v4, v3

    :cond_17
    move-object v5, v1

    goto :goto_16

    :pswitch_b
    move-object/from16 v8, p6

    move-object v1, v2

    move/from16 p3, v9

    move-object v4, v13

    move-wide/from16 v5, v21

    move/from16 v2, v31

    const/4 v3, 0x5

    const/16 v19, -0x1

    move-object/from16 v13, p2

    if-ne v7, v3, :cond_17

    add-int/lit8 v3, v2, 0x4

    or-int v9, p3, v17

    .line 48
    invoke-static {v2, v13}, Les0;->s(I[B)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v2

    .line 49
    sget-object v4, Ler1;->c:Llf1;

    invoke-virtual {v4, v1, v5, v6, v2}, Llf1;->o(Ljava/lang/Object;JF)V

    move/from16 v5, p4

    move-object v2, v1

    move v1, v3

    goto :goto_15

    :pswitch_c
    move-object/from16 v8, p6

    move-object v1, v2

    move/from16 p3, v9

    move-object v4, v13

    move-wide/from16 v5, v21

    move/from16 v3, v29

    move/from16 v2, v31

    const/16 v19, -0x1

    move-object/from16 v13, p2

    if-ne v7, v3, :cond_17

    add-int/lit8 v7, v2, 0x8

    or-int v9, p3, v17

    .line 50
    invoke-static {v2, v13}, Les0;->t(I[B)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v2

    .line 51
    sget-object v1, Ler1;->c:Llf1;

    move-wide/from16 v37, v5

    move-wide v5, v2

    move-wide/from16 v3, v37

    move-object/from16 v2, p1

    invoke-virtual/range {v1 .. v6}, Llf1;->q(Ljava/lang/Object;JD)V

    goto/16 :goto_14

    :goto_16
    move/from16 v9, p3

    move v1, v2

    move v7, v11

    move-object v11, v12

    move-object v3, v13

    move v12, v14

    move/from16 v10, v20

    move-object v14, v4

    move-object v13, v5

    move-object v4, v8

    move v8, v15

    :goto_17
    move/from16 v15, p5

    goto/16 :goto_50

    :cond_18
    move/from16 v31, v6

    move v15, v8

    move-object v4, v13

    const/16 v19, -0x1

    move-object/from16 v13, p2

    move-object v6, v5

    move-object v5, v2

    move-wide/from16 v37, v21

    move/from16 v21, v9

    move-wide/from16 v8, v37

    const/16 v2, 0x1b

    if-ne v3, v2, :cond_1c

    const/4 v2, 0x2

    if-ne v7, v2, :cond_1b

    .line 52
    invoke-virtual {v4, v5, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lyp1;

    .line 53
    move-object v2, v1

    check-cast v2, Lro1;

    .line 54
    iget-boolean v2, v2, Lro1;->j:Z

    if-nez v2, :cond_1a

    .line 55
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_19

    const/16 v13, 0xa

    goto :goto_18

    :cond_19
    add-int v13, v2, v2

    .line 56
    :goto_18
    invoke-interface {v1, v13}, Lyp1;->l(I)Lyp1;

    move-result-object v1

    .line 57
    invoke-virtual {v4, v5, v8, v9, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :cond_1a
    move-object v6, v1

    .line 58
    invoke-virtual {v0, v11}, Lnq1;->C(I)Lvq1;

    move-result-object v1

    move-object/from16 v3, p2

    move-object/from16 v7, p6

    move v2, v14

    move/from16 v4, v31

    move-object v14, v5

    move/from16 v5, p4

    .line 59
    invoke-static/range {v1 .. v7}, Les0;->A(Lvq1;I[BIILyp1;Lto1;)I

    move-result v1

    move-object v3, v14

    move v14, v2

    move-object v2, v3

    move-object/from16 v3, p2

    move-object/from16 v6, p6

    move v7, v11

    move v8, v15

    move/from16 v4, v20

    move/from16 v9, v21

    goto/16 :goto_0

    :cond_1b
    move/from16 v3, v31

    move/from16 v31, v15

    move v15, v3

    move-object/from16 v3, p6

    move-object v13, v5

    move/from16 v33, v14

    move-object/from16 v5, p2

    move-object v14, v4

    move/from16 v4, p4

    goto/16 :goto_41

    :cond_1c
    move v2, v14

    move-object v14, v5

    const/16 v5, 0x31

    const-string v22, "Protocol message had invalid UTF-8."

    const-string v32, "While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length."

    if-gt v3, v5, :cond_60

    move v5, v2

    int-to-long v1, v1

    .line 60
    invoke-virtual {v4, v14, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v13, v17

    check-cast v13, Lyp1;

    move-wide/from16 v34, v1

    .line 61
    move-object v1, v13

    check-cast v1, Lro1;

    .line 62
    iget-boolean v1, v1, Lro1;->j:Z

    if-nez v1, :cond_1d

    .line 63
    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v1, v1

    .line 64
    invoke-interface {v13, v1}, Lyp1;->l(I)Lyp1;

    move-result-object v13

    .line 65
    invoke-virtual {v4, v14, v8, v9, v13}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :cond_1d
    packed-switch v3, :pswitch_data_1

    const/4 v3, 0x3

    if-ne v7, v3, :cond_20

    and-int/lit8 v1, v5, -0x8

    or-int/lit8 v6, v1, 0x4

    .line 66
    invoke-virtual {v0, v11}, Lnq1;->C(I)Lvq1;

    move-result-object v2

    .line 67
    invoke-interface {v2}, Lvq1;->a()Lnp1;

    move-result-object v1

    move-object/from16 v3, p2

    move-object/from16 v7, p6

    move-object v9, v4

    move v8, v5

    move/from16 v4, v31

    move/from16 v5, p4

    .line 68
    invoke-static/range {v1 .. v7}, Les0;->x(Ljava/lang/Object;Lvq1;[BIIILto1;)I

    move-result v17

    move-object/from16 v37, v7

    move-object v7, v1

    move v1, v6

    move-object/from16 v6, v37

    .line 69
    invoke-interface {v2, v7}, Lvq1;->i(Ljava/lang/Object;)V

    iput-object v7, v6, Lto1;->c:Ljava/lang/Object;

    .line 70
    invoke-interface {v13, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move/from16 v7, v17

    :goto_19
    if-ge v7, v5, :cond_1f

    move/from16 v31, v4

    .line 71
    invoke-static {v3, v7, v6}, Les0;->o([BILto1;)I

    move-result v4

    move/from16 p3, v1

    iget v1, v6, Lto1;->a:I

    if-ne v8, v1, :cond_1e

    .line 72
    invoke-interface {v2}, Lvq1;->a()Lnp1;

    move-result-object v1

    move-object v7, v6

    move-object/from16 v17, v9

    move/from16 v9, v31

    move/from16 v6, p3

    .line 73
    invoke-static/range {v1 .. v7}, Les0;->x(Ljava/lang/Object;Lvq1;[BIIILto1;)I

    move-result v4

    move-object/from16 v37, v7

    move-object v7, v1

    move v1, v6

    move-object/from16 v6, v37

    .line 74
    invoke-interface {v2, v7}, Lvq1;->i(Ljava/lang/Object;)V

    iput-object v7, v6, Lto1;->c:Ljava/lang/Object;

    .line 75
    invoke-interface {v13, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v7, v4

    move v4, v9

    move-object/from16 v9, v17

    goto :goto_19

    :cond_1e
    move-object/from16 v17, v9

    move/from16 v9, v31

    goto :goto_1a

    :cond_1f
    move-object/from16 v17, v9

    move v9, v4

    :goto_1a
    move-object v2, v3

    move v4, v5

    move-object v10, v6

    move v1, v7

    move-object v13, v14

    move/from16 v31, v15

    const/16 v18, 0x0

    move v14, v8

    move v15, v9

    goto/16 :goto_3b

    :cond_20
    move-object/from16 v17, v4

    move v8, v5

    move/from16 v2, v31

    move/from16 v31, v15

    move v15, v2

    move-object/from16 v2, p2

    move/from16 v4, p4

    move-object/from16 v10, p6

    move-object v13, v14

    const/16 v18, 0x0

    move v14, v8

    goto/16 :goto_3a

    :pswitch_d
    move-object/from16 v3, p2

    move-object/from16 v6, p6

    move-object/from16 v17, v4

    move v8, v5

    move/from16 v9, v31

    const/4 v1, 0x2

    move/from16 v5, p4

    if-ne v7, v1, :cond_24

    .line 76
    check-cast v13, Ldq1;

    .line 77
    invoke-static {v3, v9, v6}, Les0;->o([BILto1;)I

    move-result v1

    iget v2, v6, Lto1;->a:I

    add-int/2addr v2, v1

    :goto_1b
    if-ge v1, v2, :cond_21

    .line 78
    invoke-static {v3, v1, v6}, Les0;->r([BILto1;)I

    move-result v1

    move/from16 v31, v15

    iget-wide v14, v6, Lto1;->b:J

    .line 79
    invoke-static {v14, v15}, Lap1;->k(J)J

    move-result-wide v14

    invoke-virtual {v13, v14, v15}, Ldq1;->e(J)V

    move-object/from16 v14, p1

    move/from16 v15, v31

    goto :goto_1b

    :cond_21
    move/from16 v31, v15

    if-ne v1, v2, :cond_23

    :cond_22
    :goto_1c
    move-object/from16 v13, p1

    move-object v2, v3

    move v4, v5

    move-object v10, v6

    move v14, v8

    move v15, v9

    :goto_1d
    const/16 v18, 0x0

    goto/16 :goto_3b

    .line 80
    :cond_23
    invoke-static/range {v32 .. v32}, Lwd1;->f(Ljava/lang/String;)V

    const/16 v18, 0x0

    return v18

    :cond_24
    move/from16 v31, v15

    if-nez v7, :cond_25

    .line 81
    check-cast v13, Ldq1;

    .line 82
    invoke-static {v3, v9, v6}, Les0;->r([BILto1;)I

    move-result v1

    iget-wide v14, v6, Lto1;->b:J

    .line 83
    invoke-static {v14, v15}, Lap1;->k(J)J

    move-result-wide v14

    invoke-virtual {v13, v14, v15}, Ldq1;->e(J)V

    :goto_1e
    if-ge v1, v5, :cond_22

    .line 84
    invoke-static {v3, v1, v6}, Les0;->o([BILto1;)I

    move-result v2

    iget v4, v6, Lto1;->a:I

    if-ne v8, v4, :cond_22

    .line 85
    invoke-static {v3, v2, v6}, Les0;->r([BILto1;)I

    move-result v1

    iget-wide v14, v6, Lto1;->b:J

    invoke-static {v14, v15}, Lap1;->k(J)J

    move-result-wide v14

    .line 86
    invoke-virtual {v13, v14, v15}, Ldq1;->e(J)V

    goto :goto_1e

    :cond_25
    move-object/from16 v13, p1

    move-object v2, v3

    move v4, v5

    move-object v10, v6

    move v14, v8

    :goto_1f
    move v15, v9

    :cond_26
    :goto_20
    const/16 v18, 0x0

    goto/16 :goto_3a

    :pswitch_e
    move-object/from16 v3, p2

    move-object/from16 v6, p6

    move-object/from16 v17, v4

    move v8, v5

    move/from16 v9, v31

    const/4 v1, 0x2

    move/from16 v5, p4

    move/from16 v31, v15

    if-ne v7, v1, :cond_29

    .line 87
    check-cast v13, Lop1;

    .line 88
    invoke-static {v3, v9, v6}, Les0;->o([BILto1;)I

    move-result v1

    iget v2, v6, Lto1;->a:I

    add-int/2addr v2, v1

    :goto_21
    if-ge v1, v2, :cond_27

    .line 89
    invoke-static {v3, v1, v6}, Les0;->o([BILto1;)I

    move-result v1

    iget v4, v6, Lto1;->a:I

    .line 90
    invoke-static {v4}, Lap1;->j(I)I

    move-result v4

    invoke-virtual {v13, v4}, Lop1;->e(I)V

    goto :goto_21

    :cond_27
    if-ne v1, v2, :cond_28

    goto :goto_1c

    .line 91
    :cond_28
    invoke-static/range {v32 .. v32}, Lwd1;->f(Ljava/lang/String;)V

    const/16 v18, 0x0

    return v18

    :cond_29
    if-nez v7, :cond_25

    .line 92
    check-cast v13, Lop1;

    .line 93
    invoke-static {v3, v9, v6}, Les0;->o([BILto1;)I

    move-result v1

    iget v2, v6, Lto1;->a:I

    .line 94
    invoke-static {v2}, Lap1;->j(I)I

    move-result v2

    invoke-virtual {v13, v2}, Lop1;->e(I)V

    :goto_22
    if-ge v1, v5, :cond_22

    .line 95
    invoke-static {v3, v1, v6}, Les0;->o([BILto1;)I

    move-result v2

    iget v4, v6, Lto1;->a:I

    if-ne v8, v4, :cond_22

    .line 96
    invoke-static {v3, v2, v6}, Les0;->o([BILto1;)I

    move-result v1

    iget v2, v6, Lto1;->a:I

    invoke-static {v2}, Lap1;->j(I)I

    move-result v2

    .line 97
    invoke-virtual {v13, v2}, Lop1;->e(I)V

    goto :goto_22

    :pswitch_f
    move-object/from16 v3, p2

    move-object/from16 v6, p6

    move-object/from16 v17, v4

    move v8, v5

    move/from16 v9, v31

    const/4 v1, 0x2

    move/from16 v5, p4

    move/from16 v31, v15

    if-ne v7, v1, :cond_2a

    .line 98
    invoke-static {v3, v9, v13, v6}, Les0;->z([BILyp1;Lto1;)I

    move-result v1

    move v7, v1

    move v14, v8

    move v15, v9

    move v8, v5

    move-object v5, v13

    move-object v13, v3

    :goto_23
    move-object v9, v6

    goto :goto_24

    :cond_2a
    if-nez v7, :cond_2b

    move-object v2, v3

    move v4, v5

    move v1, v8

    move v3, v9

    move-object v5, v13

    .line 99
    invoke-static/range {v1 .. v6}, Les0;->y(I[BIILyp1;Lto1;)I

    move-result v7

    move v14, v1

    move-object v13, v2

    move v15, v3

    move v8, v4

    goto :goto_23

    .line 100
    :goto_24
    invoke-virtual {v0, v11}, Lnq1;->E(I)Llo1;

    move-result-object v4

    move-object v3, v5

    const/4 v5, 0x0

    iget-object v6, v0, Lnq1;->j:Ltb0;

    move-object/from16 v1, p1

    move/from16 v2, v20

    .line 101
    invoke-static/range {v1 .. v6}, Lwq1;->c(Ljava/lang/Object;ILyp1;Llo1;Ljava/lang/Object;Ltb0;)Ljava/lang/Object;

    move v1, v7

    move v4, v8

    move-object v10, v9

    move-object v2, v13

    const/16 v18, 0x0

    :goto_25
    move-object/from16 v13, p1

    goto/16 :goto_3b

    :cond_2b
    move v14, v8

    move-object/from16 v13, p1

    move-object v2, v3

    move v4, v5

    move-object v10, v6

    goto/16 :goto_1f

    :pswitch_10
    move/from16 v1, v31

    move/from16 v31, v15

    move v15, v1

    move/from16 v8, p4

    move-object/from16 v9, p6

    move-object/from16 v17, v4

    move v14, v5

    move-object v5, v13

    const/4 v1, 0x2

    move-object/from16 v13, p2

    if-ne v7, v1, :cond_33

    .line 102
    invoke-static {v13, v15, v9}, Les0;->o([BILto1;)I

    move-result v1

    iget v2, v9, Lto1;->a:I

    if-ltz v2, :cond_32

    .line 103
    array-length v3, v13

    sub-int/2addr v3, v1

    if-gt v2, v3, :cond_31

    if-nez v2, :cond_2c

    .line 104
    sget-object v2, Lxo1;->k:Lwo1;

    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_27

    .line 105
    :cond_2c
    invoke-static {v13, v1, v2}, Lxo1;->k([BII)Lwo1;

    move-result-object v3

    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_26
    add-int/2addr v1, v2

    :goto_27
    if-ge v1, v8, :cond_30

    .line 106
    invoke-static {v13, v1, v9}, Les0;->o([BILto1;)I

    move-result v2

    iget v3, v9, Lto1;->a:I

    if-ne v14, v3, :cond_30

    .line 107
    invoke-static {v13, v2, v9}, Les0;->o([BILto1;)I

    move-result v1

    iget v2, v9, Lto1;->a:I

    if-ltz v2, :cond_2f

    .line 108
    array-length v3, v13

    sub-int/2addr v3, v1

    if-gt v2, v3, :cond_2e

    if-nez v2, :cond_2d

    .line 109
    sget-object v2, Lxo1;->k:Lwo1;

    .line 110
    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_27

    .line 111
    :cond_2d
    invoke-static {v13, v1, v2}, Lxo1;->k([BII)Lwo1;

    move-result-object v3

    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_26

    .line 112
    :cond_2e
    invoke-static/range {v32 .. v32}, Lwd1;->f(Ljava/lang/String;)V

    const/16 v18, 0x0

    return v18

    :cond_2f
    const/16 v18, 0x0

    .line 113
    invoke-static/range {v27 .. v27}, Lwd1;->f(Ljava/lang/String;)V

    return v18

    :cond_30
    const/16 v18, 0x0

    move v4, v8

    move-object v10, v9

    move-object v2, v13

    goto :goto_25

    :cond_31
    const/16 v18, 0x0

    .line 114
    invoke-static/range {v32 .. v32}, Lwd1;->f(Ljava/lang/String;)V

    return v18

    :cond_32
    const/16 v18, 0x0

    .line 115
    invoke-static/range {v27 .. v27}, Lwd1;->f(Ljava/lang/String;)V

    return v18

    :cond_33
    move v4, v8

    move-object v10, v9

    move-object v2, v13

    const/16 v18, 0x0

    move-object/from16 v13, p1

    goto/16 :goto_3a

    :pswitch_11
    move/from16 v1, v31

    move/from16 v31, v15

    move v15, v1

    move/from16 v8, p4

    move-object/from16 v9, p6

    move-object/from16 v17, v4

    move v14, v5

    move-object v5, v13

    const/4 v1, 0x2

    move-object/from16 v13, p2

    if-ne v7, v1, :cond_34

    .line 116
    invoke-virtual {v0, v11}, Lnq1;->C(I)Lvq1;

    move-result-object v1

    move-object v6, v5

    move v5, v8

    move-object v7, v9

    move-object v3, v13

    move v2, v14

    move v4, v15

    move/from16 v14, v20

    move-object/from16 v13, p1

    .line 117
    invoke-static/range {v1 .. v7}, Les0;->A(Lvq1;I[BIILyp1;Lto1;)I

    move-result v1

    move v4, v5

    move-object v10, v7

    :goto_28
    const/16 v18, 0x0

    :goto_29
    move v14, v2

    move-object v2, v3

    goto/16 :goto_3b

    :cond_34
    move-object v3, v13

    move-object/from16 v13, p1

    move-object v2, v3

    move v4, v8

    :goto_2a
    move-object v10, v9

    goto/16 :goto_20

    :pswitch_12
    move-object/from16 v3, p2

    move-object/from16 v9, p6

    move-object/from16 v17, v4

    move v2, v5

    move-object v8, v13

    move-object v13, v14

    move/from16 v14, v20

    move/from16 v4, v31

    const/4 v1, 0x2

    move/from16 v5, p4

    move/from16 v31, v15

    if-ne v7, v1, :cond_41

    const-wide/32 v25, 0x20000000

    and-long v25, v34, v25

    cmp-long v1, v25, v23

    if-nez v1, :cond_3a

    .line 118
    invoke-static {v3, v4, v9}, Les0;->o([BILto1;)I

    move-result v1

    iget v7, v9, Lto1;->a:I

    if-ltz v7, :cond_39

    if-nez v7, :cond_35

    .line 119
    invoke-interface {v8, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2c

    .line 120
    :cond_35
    new-instance v15, Ljava/lang/String;

    .line 121
    sget-object v10, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v15, v3, v1, v7, v10}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 122
    invoke-interface {v8, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_2b
    add-int/2addr v1, v7

    :goto_2c
    if-ge v1, v5, :cond_38

    .line 123
    invoke-static {v3, v1, v9}, Les0;->o([BILto1;)I

    move-result v7

    iget v10, v9, Lto1;->a:I

    if-ne v2, v10, :cond_38

    .line 124
    invoke-static {v3, v7, v9}, Les0;->o([BILto1;)I

    move-result v1

    iget v7, v9, Lto1;->a:I

    if-ltz v7, :cond_37

    if-nez v7, :cond_36

    .line 125
    invoke-interface {v8, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2c

    :cond_36
    new-instance v10, Ljava/lang/String;

    .line 126
    sget-object v15, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v10, v3, v1, v7, v15}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 127
    invoke-interface {v8, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2b

    .line 128
    :cond_37
    invoke-static/range {v27 .. v27}, Lwd1;->f(Ljava/lang/String;)V

    const/16 v18, 0x0

    return v18

    :cond_38
    const/16 v18, 0x0

    move v15, v4

    move v4, v5

    move-object v10, v9

    move/from16 v20, v14

    goto :goto_29

    :cond_39
    const/16 v18, 0x0

    .line 129
    invoke-static/range {v27 .. v27}, Lwd1;->f(Ljava/lang/String;)V

    return v18

    .line 130
    :cond_3a
    invoke-static {v3, v4, v9}, Les0;->o([BILto1;)I

    move-result v1

    iget v7, v9, Lto1;->a:I

    if-ltz v7, :cond_40

    if-nez v7, :cond_3b

    .line 131
    invoke-interface {v8, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2e

    :cond_3b
    add-int v10, v1, v7

    .line 132
    invoke-static {v3, v1, v10}, Lgr1;->a([BII)Z

    move-result v15

    if-eqz v15, :cond_3f

    .line 133
    new-instance v15, Ljava/lang/String;

    move/from16 p3, v10

    .line 134
    sget-object v10, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v15, v3, v1, v7, v10}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 135
    invoke-interface {v8, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_2d
    move/from16 v1, p3

    :goto_2e
    if-ge v1, v5, :cond_38

    .line 136
    invoke-static {v3, v1, v9}, Les0;->o([BILto1;)I

    move-result v7

    iget v10, v9, Lto1;->a:I

    if-ne v2, v10, :cond_38

    .line 137
    invoke-static {v3, v7, v9}, Les0;->o([BILto1;)I

    move-result v1

    iget v7, v9, Lto1;->a:I

    if-ltz v7, :cond_3e

    if-nez v7, :cond_3c

    .line 138
    invoke-interface {v8, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2e

    :cond_3c
    add-int v10, v1, v7

    .line 139
    invoke-static {v3, v1, v10}, Lgr1;->a([BII)Z

    move-result v15

    if-eqz v15, :cond_3d

    .line 140
    new-instance v15, Ljava/lang/String;

    move/from16 p3, v10

    .line 141
    sget-object v10, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v15, v3, v1, v7, v10}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 142
    invoke-interface {v8, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2d

    .line 143
    :cond_3d
    invoke-static/range {v22 .. v22}, Lwd1;->f(Ljava/lang/String;)V

    const/16 v18, 0x0

    return v18

    :cond_3e
    const/16 v18, 0x0

    .line 144
    invoke-static/range {v27 .. v27}, Lwd1;->f(Ljava/lang/String;)V

    return v18

    :cond_3f
    const/16 v18, 0x0

    .line 145
    invoke-static/range {v22 .. v22}, Lwd1;->f(Ljava/lang/String;)V

    return v18

    :cond_40
    const/16 v18, 0x0

    .line 146
    invoke-static/range {v27 .. v27}, Lwd1;->f(Ljava/lang/String;)V

    return v18

    :cond_41
    const/16 v18, 0x0

    :goto_2f
    move v15, v4

    move v4, v5

    move-object v10, v9

    move/from16 v20, v14

    :goto_30
    move v14, v2

    move-object v2, v3

    goto/16 :goto_3a

    :pswitch_13
    move-object/from16 v3, p2

    move-object/from16 v9, p6

    move-object/from16 v17, v4

    move v2, v5

    move-object v13, v14

    move/from16 v14, v20

    move/from16 v4, v31

    const/4 v1, 0x2

    const/16 v18, 0x0

    move/from16 v5, p4

    move/from16 v31, v15

    if-eq v7, v1, :cond_43

    if-eqz v7, :cond_42

    goto :goto_2f

    .line 147
    :cond_42
    invoke-static {}, Lz0;->a()V

    return v18

    .line 148
    :cond_43
    invoke-static {}, Lz0;->a()V

    return v18

    :pswitch_14
    move-object/from16 v3, p2

    move-object/from16 v9, p6

    move-object/from16 v17, v4

    move v2, v5

    move-object v8, v13

    move-object v13, v14

    move/from16 v14, v20

    move/from16 v4, v31

    const/4 v1, 0x2

    move/from16 v5, p4

    move/from16 v31, v15

    if-ne v7, v1, :cond_4b

    .line 149
    move-object v1, v8

    check-cast v1, Lop1;

    .line 150
    invoke-static {v3, v4, v9}, Les0;->o([BILto1;)I

    move-result v6

    iget v7, v9, Lto1;->a:I

    add-int v8, v6, v7

    .line 151
    array-length v10, v3

    if-gt v8, v10, :cond_4a

    .line 152
    iget v10, v1, Lop1;->l:I

    .line 153
    div-int/lit8 v7, v7, 0x4

    add-int/2addr v7, v10

    .line 154
    iget-object v10, v1, Lop1;->k:[I

    array-length v10, v10

    if-gt v7, v10, :cond_44

    goto :goto_32

    :cond_44
    if-eqz v10, :cond_46

    :goto_31
    if-ge v10, v7, :cond_45

    mul-int/lit8 v10, v10, 0x3

    const/16 v30, 0x2

    .line 155
    div-int/lit8 v10, v10, 0x2

    const/16 v29, 0x1

    add-int/lit8 v10, v10, 0x1

    const/16 v15, 0xa

    invoke-static {v10, v15}, Ljava/lang/Math;->max(II)I

    move-result v10

    goto :goto_31

    .line 156
    :cond_45
    iget-object v7, v1, Lop1;->k:[I

    .line 157
    invoke-static {v7, v10}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v7

    iput-object v7, v1, Lop1;->k:[I

    goto :goto_32

    :cond_46
    const/16 v15, 0xa

    .line 158
    invoke-static {v7, v15}, Ljava/lang/Math;->max(II)I

    move-result v7

    new-array v7, v7, [I

    iput-object v7, v1, Lop1;->k:[I

    :goto_32
    if-ge v6, v8, :cond_47

    .line 159
    invoke-static {v6, v3}, Les0;->s(I[B)I

    move-result v7

    invoke-virtual {v1, v7}, Lop1;->e(I)V

    add-int/lit8 v6, v6, 0x4

    goto :goto_32

    :cond_47
    if-ne v6, v8, :cond_49

    :cond_48
    move v15, v4

    move v4, v5

    move v1, v6

    move-object v10, v9

    move/from16 v20, v14

    goto/16 :goto_28

    .line 160
    :cond_49
    invoke-static/range {v32 .. v32}, Lwd1;->f(Ljava/lang/String;)V

    const/16 v18, 0x0

    return v18

    :cond_4a
    const/16 v18, 0x0

    .line 161
    invoke-static/range {v32 .. v32}, Lwd1;->f(Ljava/lang/String;)V

    return v18

    :cond_4b
    const/4 v1, 0x5

    if-ne v7, v1, :cond_4c

    add-int/lit8 v6, v4, 0x4

    .line 162
    move-object v1, v8

    check-cast v1, Lop1;

    .line 163
    invoke-static {v4, v3}, Les0;->s(I[B)I

    move-result v7

    invoke-virtual {v1, v7}, Lop1;->e(I)V

    :goto_33
    if-ge v6, v5, :cond_48

    .line 164
    invoke-static {v3, v6, v9}, Les0;->o([BILto1;)I

    move-result v7

    iget v8, v9, Lto1;->a:I

    if-ne v2, v8, :cond_48

    .line 165
    invoke-static {v7, v3}, Les0;->s(I[B)I

    move-result v6

    invoke-virtual {v1, v6}, Lop1;->e(I)V

    add-int/lit8 v6, v7, 0x4

    goto :goto_33

    :cond_4c
    move v15, v4

    move v4, v5

    move-object v10, v9

    move/from16 v20, v14

    const/16 v18, 0x0

    goto/16 :goto_30

    :pswitch_15
    move-object/from16 v3, p2

    move-object/from16 v9, p6

    move-object/from16 v17, v4

    move v2, v5

    move-object v8, v13

    move-object v13, v14

    move/from16 v14, v20

    move/from16 v4, v31

    const/4 v1, 0x2

    move/from16 v5, p4

    move/from16 v31, v15

    if-ne v7, v1, :cond_54

    .line 166
    move-object v1, v8

    check-cast v1, Ldq1;

    .line 167
    invoke-static {v3, v4, v9}, Les0;->o([BILto1;)I

    move-result v6

    iget v7, v9, Lto1;->a:I

    add-int v8, v6, v7

    .line 168
    array-length v10, v3

    if-gt v8, v10, :cond_53

    .line 169
    iget v10, v1, Ldq1;->l:I

    .line 170
    div-int/lit8 v7, v7, 0x8

    add-int/2addr v7, v10

    .line 171
    iget-object v10, v1, Ldq1;->k:[J

    array-length v10, v10

    if-gt v7, v10, :cond_4d

    goto :goto_35

    :cond_4d
    if-eqz v10, :cond_4f

    :goto_34
    if-ge v10, v7, :cond_4e

    mul-int/lit8 v10, v10, 0x3

    const/16 v30, 0x2

    .line 172
    div-int/lit8 v10, v10, 0x2

    const/16 v29, 0x1

    add-int/lit8 v10, v10, 0x1

    const/16 v15, 0xa

    invoke-static {v10, v15}, Ljava/lang/Math;->max(II)I

    move-result v10

    goto :goto_34

    .line 173
    :cond_4e
    iget-object v7, v1, Ldq1;->k:[J

    .line 174
    invoke-static {v7, v10}, Ljava/util/Arrays;->copyOf([JI)[J

    move-result-object v7

    iput-object v7, v1, Ldq1;->k:[J

    goto :goto_35

    :cond_4f
    const/16 v15, 0xa

    .line 175
    invoke-static {v7, v15}, Ljava/lang/Math;->max(II)I

    move-result v7

    new-array v7, v7, [J

    iput-object v7, v1, Ldq1;->k:[J

    :goto_35
    if-ge v6, v8, :cond_50

    move/from16 v20, v14

    .line 176
    invoke-static {v6, v3}, Les0;->t(I[B)J

    move-result-wide v14

    invoke-virtual {v1, v14, v15}, Ldq1;->e(J)V

    add-int/lit8 v6, v6, 0x8

    move/from16 v14, v20

    goto :goto_35

    :cond_50
    move/from16 v20, v14

    if-ne v6, v8, :cond_52

    :cond_51
    move v14, v2

    move-object v2, v3

    move v15, v4

    move v4, v5

    move v1, v6

    :goto_36
    move-object v10, v9

    goto/16 :goto_1d

    .line 177
    :cond_52
    invoke-static/range {v32 .. v32}, Lwd1;->f(Ljava/lang/String;)V

    const/16 v18, 0x0

    return v18

    :cond_53
    const/16 v18, 0x0

    .line 178
    invoke-static/range {v32 .. v32}, Lwd1;->f(Ljava/lang/String;)V

    return v18

    :cond_54
    move/from16 v20, v14

    const/4 v1, 0x1

    if-ne v7, v1, :cond_55

    add-int/lit8 v6, v4, 0x8

    .line 179
    move-object v1, v8

    check-cast v1, Ldq1;

    .line 180
    invoke-static {v4, v3}, Les0;->t(I[B)J

    move-result-wide v7

    invoke-virtual {v1, v7, v8}, Ldq1;->e(J)V

    :goto_37
    if-ge v6, v5, :cond_51

    .line 181
    invoke-static {v3, v6, v9}, Les0;->o([BILto1;)I

    move-result v7

    iget v8, v9, Lto1;->a:I

    if-ne v2, v8, :cond_51

    .line 182
    invoke-static {v7, v3}, Les0;->t(I[B)J

    move-result-wide v14

    invoke-virtual {v1, v14, v15}, Ldq1;->e(J)V

    add-int/lit8 v6, v7, 0x8

    goto :goto_37

    :cond_55
    move v14, v2

    move-object v2, v3

    move v15, v4

    move v4, v5

    goto/16 :goto_2a

    :pswitch_16
    move-object/from16 v3, p2

    move-object/from16 v9, p6

    move-object/from16 v17, v4

    move v2, v5

    move-object v8, v13

    move-object v13, v14

    move/from16 v4, v31

    const/4 v1, 0x2

    move/from16 v5, p4

    move/from16 v31, v15

    if-ne v7, v1, :cond_56

    .line 183
    invoke-static {v3, v4, v8, v9}, Les0;->z([BILyp1;Lto1;)I

    move-result v1

    move v14, v2

    move-object v2, v3

    move v15, v4

    move v4, v5

    goto :goto_36

    :cond_56
    if-nez v7, :cond_55

    move v1, v2

    move-object v2, v3

    move v3, v4

    move v4, v5

    move-object v5, v8

    move-object v6, v9

    .line 184
    invoke-static/range {v1 .. v6}, Les0;->y(I[BIILyp1;Lto1;)I

    move-result v5

    move v14, v1

    move v15, v3

    move-object v10, v6

    move v1, v5

    goto/16 :goto_1d

    :pswitch_17
    move-object v1, v14

    move v14, v5

    move-object v5, v13

    move-object v13, v1

    move/from16 v1, v31

    move/from16 v31, v15

    move v15, v1

    move-object/from16 v2, p2

    move-object/from16 v10, p6

    move-object/from16 v17, v4

    const/4 v1, 0x2

    move/from16 v4, p4

    if-ne v7, v1, :cond_5a

    .line 185
    move-object v1, v5

    check-cast v1, Ldq1;

    .line 186
    invoke-static {v2, v15, v10}, Les0;->o([BILto1;)I

    move-result v3

    iget v5, v10, Lto1;->a:I

    add-int/2addr v5, v3

    :goto_38
    if-ge v3, v5, :cond_57

    .line 187
    invoke-static {v2, v3, v10}, Les0;->r([BILto1;)I

    move-result v3

    iget-wide v6, v10, Lto1;->b:J

    .line 188
    invoke-virtual {v1, v6, v7}, Ldq1;->e(J)V

    goto :goto_38

    :cond_57
    if-ne v3, v5, :cond_59

    :cond_58
    move v1, v3

    goto/16 :goto_1d

    .line 189
    :cond_59
    invoke-static/range {v32 .. v32}, Lwd1;->f(Ljava/lang/String;)V

    const/16 v18, 0x0

    return v18

    :cond_5a
    if-nez v7, :cond_26

    .line 190
    move-object v1, v5

    check-cast v1, Ldq1;

    .line 191
    invoke-static {v2, v15, v10}, Les0;->r([BILto1;)I

    move-result v3

    iget-wide v5, v10, Lto1;->b:J

    .line 192
    invoke-virtual {v1, v5, v6}, Ldq1;->e(J)V

    :goto_39
    if-ge v3, v4, :cond_58

    .line 193
    invoke-static {v2, v3, v10}, Les0;->o([BILto1;)I

    move-result v5

    iget v6, v10, Lto1;->a:I

    if-ne v14, v6, :cond_58

    .line 194
    invoke-static {v2, v5, v10}, Les0;->r([BILto1;)I

    move-result v3

    iget-wide v5, v10, Lto1;->b:J

    .line 195
    invoke-virtual {v1, v5, v6}, Ldq1;->e(J)V

    goto :goto_39

    :pswitch_18
    move/from16 v1, v31

    move/from16 v31, v15

    move v15, v1

    move-object/from16 v2, p2

    move-object/from16 v10, p6

    move-object/from16 v17, v4

    move-object v13, v14

    const/4 v1, 0x2

    move/from16 v4, p4

    move v14, v5

    if-eq v7, v1, :cond_5c

    const/4 v1, 0x5

    if-eq v7, v1, :cond_5b

    goto/16 :goto_20

    .line 196
    :cond_5b
    invoke-static {}, Lz0;->a()V

    const/16 v18, 0x0

    return v18

    :cond_5c
    const/16 v18, 0x0

    .line 197
    invoke-static {}, Lz0;->a()V

    return v18

    :pswitch_19
    move/from16 v1, v31

    move/from16 v31, v15

    move v15, v1

    move-object/from16 v2, p2

    move-object/from16 v10, p6

    move-object/from16 v17, v4

    move-object v13, v14

    const/4 v1, 0x2

    const/16 v18, 0x0

    move/from16 v4, p4

    move v14, v5

    if-eq v7, v1, :cond_5f

    const/4 v1, 0x1

    if-eq v7, v1, :cond_5e

    :goto_3a
    move v1, v15

    :goto_3b
    if-eq v1, v15, :cond_5d

    move-object v3, v2

    move v5, v4

    move-object v6, v10

    move v7, v11

    move-object v2, v13

    move/from16 v4, v20

    :goto_3c
    move/from16 v9, v21

    move/from16 v8, v31

    goto/16 :goto_0

    :cond_5d
    move/from16 v15, p5

    move-object v3, v2

    move-object v4, v10

    move v7, v11

    move-object v11, v12

    move v12, v14

    move-object/from16 v14, v17

    move/from16 v10, v20

    :goto_3d
    move/from16 v9, v21

    move/from16 v8, v31

    goto/16 :goto_50

    .line 198
    :cond_5e
    invoke-static {}, Lz0;->a()V

    return v18

    .line 199
    :cond_5f
    invoke-static {}, Lz0;->a()V

    return v18

    :cond_60
    move/from16 v5, v31

    move/from16 v31, v15

    move v15, v5

    move-object/from16 v10, p6

    move/from16 v27, v1

    move-object v5, v4

    move-object v13, v14

    move/from16 v4, p4

    move v14, v2

    move-object/from16 v2, p2

    const/16 v1, 0x32

    if-ne v3, v1, :cond_6c

    const/4 v1, 0x2

    if-ne v7, v1, :cond_6b

    .line 200
    invoke-virtual {v0, v11}, Lnq1;->D(I)Ljava/lang/Object;

    move-result-object v1

    .line 201
    invoke-virtual {v5, v13, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    .line 202
    move-object v7, v3

    check-cast v7, Lfq1;

    .line 203
    iget-boolean v7, v7, Lfq1;->j:Z

    if-nez v7, :cond_61

    .line 204
    sget-object v7, Lfq1;->k:Lfq1;

    .line 205
    invoke-virtual {v7}, Lfq1;->a()Lfq1;

    move-result-object v7

    .line 206
    invoke-static {v7, v3}, Lmz;->p(Ljava/lang/Object;Ljava/lang/Object;)Lfq1;

    .line 207
    invoke-virtual {v5, v13, v8, v9, v7}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    move-object v3, v7

    .line 208
    :cond_61
    check-cast v1, Leq1;

    .line 209
    iget-object v7, v1, Leq1;->a:Lc9;

    .line 210
    move-object v8, v3

    check-cast v8, Lfq1;

    .line 211
    invoke-static {v2, v15, v10}, Les0;->o([BILto1;)I

    move-result v1

    iget v3, v10, Lto1;->a:I

    if-ltz v3, :cond_6a

    sub-int v9, v4, v1

    if-gt v3, v9, :cond_6a

    add-int v9, v1, v3

    .line 212
    iget-object v3, v7, Lc9;->m:Ljava/lang/Object;

    move-object/from16 v36, v3

    :goto_3e
    if-ge v1, v9, :cond_67

    move-object/from16 v17, v3

    add-int/lit8 v3, v1, 0x1

    .line 213
    aget-byte v1, v2, v1

    if-gez v1, :cond_62

    .line 214
    invoke-static {v1, v2, v3, v10}, Les0;->q(I[BILto1;)I

    move-result v3

    iget v1, v10, Lto1;->a:I

    :cond_62
    ushr-int/lit8 v2, v1, 0x3

    move/from16 p3, v3

    and-int/lit8 v3, v1, 0x7

    const/4 v4, 0x1

    if-eq v2, v4, :cond_65

    const/4 v4, 0x2

    if-eq v2, v4, :cond_63

    move/from16 v2, p3

    move/from16 v4, p4

    move-object v3, v10

    move/from16 v33, v14

    move-object v14, v5

    move-object v10, v6

    move-object/from16 v5, p2

    goto/16 :goto_40

    .line 215
    :cond_63
    iget-object v2, v7, Lc9;->l:Ljava/lang/Object;

    move-object v4, v2

    check-cast v4, Lhr1;

    .line 216
    iget v2, v4, Lhr1;->k:I

    if-ne v3, v2, :cond_64

    move-object v3, v5

    .line 217
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    move-object v1, v10

    move-object v10, v6

    move-object v6, v1

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v33, v14

    move-object v14, v3

    move/from16 v3, p4

    .line 218
    invoke-static/range {v1 .. v6}, Lnq1;->x([BIILhr1;Ljava/lang/Class;Lto1;)I

    move-result v2

    iget-object v1, v6, Lto1;->c:Ljava/lang/Object;

    move-object v3, v10

    move-object v10, v6

    move-object v6, v3

    move/from16 v4, p4

    move-object/from16 v36, v1

    move v1, v2

    move-object v5, v14

    move-object/from16 v3, v17

    move/from16 v14, v33

    move-object/from16 v2, p2

    goto :goto_3e

    :cond_64
    move-object/from16 v33, v10

    move-object v10, v6

    move-object/from16 v6, v33

    move/from16 v33, v14

    move-object v14, v5

    move-object/from16 v5, p2

    move/from16 v2, p3

    :goto_3f
    move/from16 v4, p4

    move-object v3, v6

    goto :goto_40

    :cond_65
    move-object v2, v10

    move-object v10, v6

    move-object v6, v2

    move/from16 v2, p3

    move/from16 v33, v14

    move-object v14, v5

    iget-object v4, v7, Lc9;->k:Ljava/lang/Object;

    check-cast v4, Lhr1;

    .line 219
    iget v5, v4, Lhr1;->k:I

    if-ne v3, v5, :cond_66

    const/4 v5, 0x0

    move-object/from16 v1, p2

    move/from16 v3, p4

    .line 220
    invoke-static/range {v1 .. v6}, Lnq1;->x([BIILhr1;Ljava/lang/Class;Lto1;)I

    move-result v2

    move-object v5, v1

    move v4, v3

    move-object v3, v6

    iget-object v6, v3, Lto1;->c:Ljava/lang/Object;

    move v1, v2

    move-object v10, v3

    move-object v2, v5

    move-object v5, v14

    move-object/from16 v3, v17

    move/from16 v14, v33

    goto/16 :goto_3e

    :cond_66
    move-object/from16 v5, p2

    goto :goto_3f

    .line 221
    :goto_40
    invoke-static {v1, v5, v2, v4, v3}, Les0;->C(I[BIILto1;)I

    move-result v1

    move-object v2, v5

    move-object v6, v10

    move-object v5, v14

    move/from16 v14, v33

    move-object v10, v3

    move-object/from16 v3, v17

    goto/16 :goto_3e

    :cond_67
    move-object v3, v10

    move/from16 v33, v14

    move-object v14, v5

    move-object v10, v6

    move-object v5, v2

    if-ne v1, v9, :cond_69

    move-object/from16 v1, v36

    .line 222
    invoke-virtual {v8, v10, v1}, Lfq1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eq v9, v15, :cond_68

    move-object v6, v3

    move-object v3, v5

    move v1, v9

    move v7, v11

    move-object v2, v13

    move/from16 v9, v21

    move/from16 v8, v31

    move/from16 v14, v33

    move v5, v4

    goto/16 :goto_8

    :cond_68
    move/from16 v15, p5

    move-object v4, v3

    move-object v3, v5

    move v1, v9

    move v7, v11

    move-object v11, v12

    move/from16 v10, v20

    move/from16 v9, v21

    move/from16 v8, v31

    move/from16 v12, v33

    goto/16 :goto_50

    .line 223
    :cond_69
    invoke-static/range {v28 .. v28}, Lwd1;->f(Ljava/lang/String;)V

    const/16 v18, 0x0

    return v18

    :cond_6a
    const/16 v18, 0x0

    .line 224
    invoke-static/range {v32 .. v32}, Lwd1;->f(Ljava/lang/String;)V

    return v18

    :cond_6b
    move-object v3, v10

    move/from16 v33, v14

    move-object v14, v5

    move-object v5, v2

    :goto_41
    move-object v4, v3

    move-object v3, v5

    move v7, v11

    move-object v11, v12

    move v1, v15

    move/from16 v10, v20

    move/from16 v9, v21

    move/from16 v8, v31

    move/from16 v12, v33

    goto/16 :goto_17

    :cond_6c
    move/from16 v33, v14

    move-object v14, v5

    move-object v5, v2

    add-int/lit8 v1, v11, 0x2

    .line 225
    aget v1, v17, v1

    const v16, 0xfffff

    and-int v1, v1, v16

    int-to-long v1, v1

    packed-switch v3, :pswitch_data_2

    move-object/from16 v4, p6

    move-object v3, v5

    move/from16 v17, v11

    move-object v11, v12

    move/from16 v10, v20

    :goto_42
    move/from16 v12, v33

    goto/16 :goto_4e

    :pswitch_1a
    const/4 v3, 0x3

    if-ne v7, v3, :cond_6d

    and-int/lit8 v1, v33, -0x8

    or-int/lit8 v6, v1, 0x4

    move/from16 v10, v20

    .line 226
    invoke-virtual {v0, v10, v13, v11}, Lnq1;->H(ILjava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    .line 227
    invoke-virtual {v0, v11}, Lnq1;->C(I)Lvq1;

    move-result-object v2

    move-object/from16 v7, p6

    move-object v3, v5

    move v5, v4

    move v4, v15

    .line 228
    invoke-static/range {v1 .. v7}, Les0;->x(Ljava/lang/Object;Lvq1;[BIIILto1;)I

    move-result v2

    move-object v6, v7

    .line 229
    invoke-virtual {v0, v13, v10, v11, v1}, Lnq1;->I(Ljava/lang/Object;IILjava/lang/Object;)V

    move v1, v2

    move-object v4, v6

    move/from16 v17, v11

    move-object v11, v12

    move/from16 v12, v33

    goto/16 :goto_4f

    :cond_6d
    move/from16 v10, v20

    move-object/from16 v4, p6

    move-object v3, v5

    :goto_43
    move/from16 v17, v11

    move-object v11, v12

    goto :goto_42

    :pswitch_1b
    move-object/from16 v6, p6

    move-object v3, v5

    move v4, v15

    move/from16 v10, v20

    if-nez v7, :cond_6e

    .line 230
    invoke-static {v3, v4, v6}, Les0;->r([BILto1;)I

    move-result v5

    move v15, v11

    move-object/from16 p3, v12

    iget-wide v11, v6, Lto1;->b:J

    .line 231
    invoke-static {v11, v12}, Lap1;->k(J)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v14, v13, v8, v9, v7}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 232
    invoke-virtual {v14, v13, v1, v2, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    :goto_44
    move-object/from16 v11, p3

    move v1, v5

    move/from16 v17, v15

    move/from16 v12, v33

    :goto_45
    move v15, v4

    move-object v4, v6

    goto/16 :goto_4f

    :cond_6e
    move v15, v4

    move-object v4, v6

    goto :goto_43

    :pswitch_1c
    move-object/from16 v6, p6

    move-object v3, v5

    move-object/from16 p3, v12

    move v4, v15

    move/from16 v10, v20

    move v15, v11

    if-nez v7, :cond_6f

    .line 233
    invoke-static {v3, v4, v6}, Les0;->o([BILto1;)I

    move-result v5

    iget v7, v6, Lto1;->a:I

    .line 234
    invoke-static {v7}, Lap1;->j(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v14, v13, v8, v9, v7}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 235
    invoke-virtual {v14, v13, v1, v2, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_44

    :cond_6f
    move-object/from16 v11, p3

    move/from16 v17, v15

    move/from16 v12, v33

    :goto_46
    move v15, v4

    move-object v4, v6

    goto/16 :goto_4e

    :pswitch_1d
    move-object/from16 v6, p6

    move-object v3, v5

    move-object/from16 p3, v12

    move v4, v15

    move/from16 v10, v20

    move v15, v11

    if-nez v7, :cond_73

    .line 236
    invoke-static {v3, v4, v6}, Les0;->o([BILto1;)I

    move-result v5

    iget v7, v6, Lto1;->a:I

    .line 237
    invoke-virtual {v0, v15}, Lnq1;->E(I)Llo1;

    move-result-object v11

    if-eqz v11, :cond_70

    invoke-virtual {v11, v7}, Llo1;->a(I)Z

    move-result v11

    if-eqz v11, :cond_71

    :cond_70
    move-object/from16 v11, p3

    move/from16 v12, v33

    goto :goto_47

    .line 238
    :cond_71
    move-object v1, v13

    check-cast v1, Lnp1;

    iget-object v2, v1, Lnp1;->zzc:Lcr1;

    move-object/from16 v11, p3

    if-ne v2, v11, :cond_72

    invoke-static {}, Lcr1;->a()Lcr1;

    move-result-object v2

    .line 239
    iput-object v2, v1, Lnp1;->zzc:Lcr1;

    :cond_72
    int-to-long v7, v7

    .line 240
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    move/from16 v12, v33

    invoke-virtual {v2, v12, v1}, Lcr1;->d(ILjava/lang/Object;)V

    goto :goto_48

    .line 241
    :goto_47
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v14, v13, v8, v9, v7}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 242
    invoke-virtual {v14, v13, v1, v2, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    :goto_48
    move v1, v5

    move/from16 v17, v15

    goto :goto_45

    :cond_73
    move-object/from16 v11, p3

    move/from16 v12, v33

    :cond_74
    move/from16 v17, v15

    goto :goto_46

    :pswitch_1e
    move-object/from16 v6, p6

    move-object v3, v5

    move v4, v15

    move/from16 v10, v20

    const/4 v5, 0x2

    move v15, v11

    move-object v11, v12

    move/from16 v12, v33

    if-ne v7, v5, :cond_74

    .line 243
    invoke-static {v3, v4, v6}, Les0;->v([BILto1;)I

    move-result v5

    iget-object v7, v6, Lto1;->c:Ljava/lang/Object;

    .line 244
    invoke-virtual {v14, v13, v8, v9, v7}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 245
    invoke-virtual {v14, v13, v1, v2, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_48

    :pswitch_1f
    move-object/from16 v6, p6

    move-object v3, v5

    move v4, v15

    move/from16 v10, v20

    const/4 v5, 0x2

    move v15, v11

    move-object v11, v12

    move/from16 v12, v33

    if-ne v7, v5, :cond_75

    .line 246
    invoke-virtual {v0, v10, v13, v15}, Lnq1;->H(ILjava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    .line 247
    invoke-virtual {v0, v15}, Lnq1;->C(I)Lvq1;

    move-result-object v2

    move/from16 v5, p4

    .line 248
    invoke-static/range {v1 .. v6}, Les0;->w(Ljava/lang/Object;Lvq1;[BIILto1;)I

    move-result v2

    move v9, v4

    move-object v4, v6

    .line 249
    invoke-virtual {v0, v13, v10, v15, v1}, Lnq1;->I(Ljava/lang/Object;IILjava/lang/Object;)V

    move v1, v2

    move/from16 v17, v15

    move v15, v9

    goto/16 :goto_4f

    :cond_75
    move v9, v4

    move-object v4, v6

    move/from16 v17, v15

    move v15, v9

    goto/16 :goto_4e

    :pswitch_20
    move-object/from16 v4, p6

    move-object v3, v5

    move/from16 v17, v11

    move-object v11, v12

    move/from16 v10, v20

    move/from16 v12, v33

    const/4 v5, 0x2

    if-ne v7, v5, :cond_7a

    .line 250
    invoke-static {v3, v15, v4}, Les0;->o([BILto1;)I

    move-result v5

    iget v7, v4, Lto1;->a:I

    if-nez v7, :cond_76

    .line 251
    invoke-virtual {v14, v13, v8, v9, v6}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_4a

    :cond_76
    add-int v6, v5, v7

    and-int v20, v27, v25

    if-eqz v20, :cond_77

    .line 252
    invoke-static {v3, v5, v6}, Lgr1;->a([BII)Z

    move-result v20

    if-eqz v20, :cond_78

    :cond_77
    move/from16 p3, v6

    goto :goto_49

    .line 253
    :cond_78
    invoke-static/range {v22 .. v22}, Lwd1;->f(Ljava/lang/String;)V

    const/16 v18, 0x0

    return v18

    :goto_49
    new-instance v6, Ljava/lang/String;

    .line 254
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v6, v3, v5, v7, v0}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 255
    invoke-virtual {v14, v13, v8, v9, v6}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    move/from16 v5, p3

    .line 256
    :goto_4a
    invoke-virtual {v14, v13, v1, v2, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    move v1, v5

    goto/16 :goto_4f

    :pswitch_21
    move-object/from16 v4, p6

    move-object v3, v5

    move/from16 v17, v11

    move-object v11, v12

    move/from16 v10, v20

    move/from16 v12, v33

    if-nez v7, :cond_7a

    .line 257
    invoke-static {v3, v15, v4}, Les0;->r([BILto1;)I

    move-result v0

    iget-wide v5, v4, Lto1;->b:J

    cmp-long v5, v5, v23

    if-eqz v5, :cond_79

    const/16 v29, 0x1

    goto :goto_4b

    :cond_79
    const/16 v29, 0x0

    .line 258
    :goto_4b
    invoke-static/range {v29 .. v29}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v14, v13, v8, v9, v5}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 259
    invoke-virtual {v14, v13, v1, v2, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    :goto_4c
    move v1, v0

    goto/16 :goto_4f

    :pswitch_22
    move-object/from16 v4, p6

    move-object v3, v5

    move/from16 v17, v11

    move-object v11, v12

    move/from16 v10, v20

    move/from16 v12, v33

    const/4 v0, 0x5

    if-ne v7, v0, :cond_7a

    add-int/lit8 v6, v15, 0x4

    .line 260
    invoke-static {v15, v3}, Les0;->s(I[B)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v14, v13, v8, v9, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 261
    invoke-virtual {v14, v13, v1, v2, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    :goto_4d
    move v1, v6

    goto/16 :goto_4f

    :pswitch_23
    move-object/from16 v4, p6

    move-object v3, v5

    move/from16 v17, v11

    move-object v11, v12

    move/from16 v10, v20

    move/from16 v12, v33

    const/4 v0, 0x1

    if-ne v7, v0, :cond_7a

    add-int/lit8 v6, v15, 0x8

    .line 262
    invoke-static {v15, v3}, Les0;->t(I[B)J

    move-result-wide v22

    invoke-static/range {v22 .. v23}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v14, v13, v8, v9, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 263
    invoke-virtual {v14, v13, v1, v2, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_4d

    :pswitch_24
    move-object/from16 v4, p6

    move-object v3, v5

    move/from16 v17, v11

    move-object v11, v12

    move/from16 v10, v20

    move/from16 v12, v33

    if-nez v7, :cond_7a

    .line 264
    invoke-static {v3, v15, v4}, Les0;->o([BILto1;)I

    move-result v0

    iget v5, v4, Lto1;->a:I

    .line 265
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v14, v13, v8, v9, v5}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 266
    invoke-virtual {v14, v13, v1, v2, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_4c

    :pswitch_25
    move-object/from16 v4, p6

    move-object v3, v5

    move/from16 v17, v11

    move-object v11, v12

    move/from16 v10, v20

    move/from16 v12, v33

    if-nez v7, :cond_7a

    .line 267
    invoke-static {v3, v15, v4}, Les0;->r([BILto1;)I

    move-result v0

    iget-wide v5, v4, Lto1;->b:J

    .line 268
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v14, v13, v8, v9, v5}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 269
    invoke-virtual {v14, v13, v1, v2, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_4c

    :pswitch_26
    move-object/from16 v4, p6

    move-object v3, v5

    move/from16 v17, v11

    move-object v11, v12

    move/from16 v10, v20

    move/from16 v12, v33

    const/4 v0, 0x5

    if-ne v7, v0, :cond_7a

    add-int/lit8 v6, v15, 0x4

    .line 270
    invoke-static {v15, v3}, Les0;->s(I[B)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    .line 271
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v14, v13, v8, v9, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 272
    invoke-virtual {v14, v13, v1, v2, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_4d

    :pswitch_27
    move-object/from16 v4, p6

    move-object v3, v5

    move/from16 v17, v11

    move-object v11, v12

    move/from16 v10, v20

    move/from16 v12, v33

    const/4 v0, 0x1

    if-ne v7, v0, :cond_7a

    add-int/lit8 v6, v15, 0x8

    .line 273
    invoke-static {v15, v3}, Les0;->t(I[B)J

    move-result-wide v22

    invoke-static/range {v22 .. v23}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v22

    .line 274
    invoke-static/range {v22 .. v23}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v14, v13, v8, v9, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 275
    invoke-virtual {v14, v13, v1, v2, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto/16 :goto_4d

    :cond_7a
    :goto_4e
    move v1, v15

    :goto_4f
    if-eq v1, v15, :cond_7b

    move-object/from16 v0, p0

    move/from16 v5, p4

    move-object v6, v4

    move v4, v10

    move v14, v12

    move-object v2, v13

    move/from16 v7, v17

    goto/16 :goto_3c

    :cond_7b
    move/from16 v15, p5

    move/from16 v7, v17

    goto/16 :goto_3d

    :goto_50
    if-ne v12, v15, :cond_7c

    if-eqz v15, :cond_7c

    move/from16 v6, p4

    :goto_51
    move v7, v1

    const v0, 0xfffff

    goto :goto_52

    .line 276
    :cond_7c
    move-object v0, v13

    check-cast v0, Lnp1;

    iget-object v2, v0, Lnp1;->zzc:Lcr1;

    if-ne v2, v11, :cond_7d

    invoke-static {}, Lcr1;->a()Lcr1;

    move-result-object v2

    .line 277
    iput-object v2, v0, Lnp1;->zzc:Lcr1;

    :cond_7d
    move-object v5, v2

    move-object v2, v3

    move-object v6, v4

    move/from16 v4, p4

    move v3, v1

    move v1, v12

    .line 278
    invoke-static/range {v1 .. v6}, Les0;->B(I[BIILcr1;Lto1;)I

    move-result v0

    move v2, v1

    move-object/from16 v3, p2

    move-object/from16 v6, p6

    move v1, v0

    move v14, v2

    move v5, v4

    move v4, v10

    move-object v2, v13

    move-object/from16 v0, p0

    goto/16 :goto_0

    :cond_7e
    move-object v6, v13

    move-object v13, v2

    move v2, v14

    move-object v14, v6

    move v6, v5

    move/from16 v31, v8

    move/from16 v21, v9

    move-object/from16 v28, v15

    move/from16 v15, p5

    move v12, v2

    goto :goto_51

    :goto_52
    if-eq v8, v0, :cond_7f

    int-to-long v0, v8

    .line 279
    invoke-virtual {v14, v13, v0, v1, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    :cond_7f
    const/4 v0, 0x0

    move-object/from16 v1, p0

    iget v2, v1, Lnq1;->h:I

    move-object v3, v0

    move v8, v2

    :goto_53
    iget v0, v1, Lnq1;->i:I

    if-ge v8, v0, :cond_80

    iget-object v4, v1, Lnq1;->j:Ltb0;

    .line 280
    iget-object v0, v1, Lnq1;->g:[I

    aget v2, v0, v8

    move-object/from16 v5, p1

    move-object v0, v1

    move-object v1, v13

    .line 281
    invoke-virtual/range {v0 .. v5}, Lnq1;->J(Ljava/lang/Object;ILjava/lang/Object;Ltb0;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lcr1;

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v13, p1

    move-object v1, v0

    goto :goto_53

    :cond_80
    move-object v0, v1

    if-eqz v3, :cond_81

    iget-object v0, v0, Lnq1;->j:Ltb0;

    .line 282
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 283
    move-object/from16 v0, p1

    check-cast v0, Lnp1;

    iput-object v3, v0, Lnp1;->zzc:Lcr1;

    :cond_81
    if-nez v15, :cond_83

    if-ne v7, v6, :cond_82

    goto :goto_54

    .line 284
    :cond_82
    invoke-static/range {v28 .. v28}, Lwd1;->f(Ljava/lang/String;)V

    const/16 v18, 0x0

    return v18

    :cond_83
    const/16 v18, 0x0

    if-gt v7, v6, :cond_84

    if-ne v12, v15, :cond_84

    :goto_54
    return v7

    .line 285
    :cond_84
    invoke-static/range {v28 .. v28}, Lwd1;->f(Ljava/lang/String;)V

    return v18

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_9
        :pswitch_2
        :pswitch_7
        :pswitch_8
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x12
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_16
        :pswitch_f
        :pswitch_14
        :pswitch_15
        :pswitch_e
        :pswitch_d
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_16
        :pswitch_f
        :pswitch_14
        :pswitch_15
        :pswitch_e
        :pswitch_d
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x33
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_24
        :pswitch_1d
        :pswitch_22
        :pswitch_23
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
    .end packed-switch
.end method
