.class public final Lcw0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final c:Lcw0;


# instance fields
.field public final a:Lbv1;

.field public final b:Ljava/util/concurrent/ConcurrentHashMap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcw0;

    .line 2
    .line 3
    invoke-direct {v0}, Lcw0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcw0;->c:Lcw0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcw0;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    new-instance v0, Lbv1;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-direct {v0, v1}, Lbv1;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcw0;->a:Lbv1;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Class;)Lb31;
    .locals 9

    .line 1
    sget-object v0, Lkf0;->a:Ljava/nio/charset/Charset;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p1, :cond_c

    .line 5
    .line 6
    iget-object v1, p0, Lcw0;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 7
    .line 8
    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    check-cast v2, Lb31;

    .line 13
    .line 14
    if-nez v2, :cond_b

    .line 15
    .line 16
    sget-object v2, Lf31;->a:Ljava/lang/Class;

    .line 17
    .line 18
    const-class v2, Lia0;

    .line 19
    .line 20
    invoke-virtual {v2, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-nez v3, :cond_1

    .line 25
    .line 26
    sget-object v3, Lf31;->a:Ljava/lang/Class;

    .line 27
    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    invoke-virtual {v3, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-eqz v3, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const-string p0, "Message classes must extend GeneratedMessageV3 or GeneratedMessageLite"

    .line 38
    .line 39
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-object v0

    .line 43
    :cond_1
    :goto_0
    iget-object p0, p0, Lcw0;->a:Lbv1;

    .line 44
    .line 45
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast p0, Lel0;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lel0;->a(Ljava/lang/Class;)Lox0;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    iget p0, v3, Lox0;->d:I

    .line 54
    .line 55
    const/4 v4, 0x2

    .line 56
    and-int/2addr p0, v4

    .line 57
    const/4 v5, 0x1

    .line 58
    if-ne p0, v4, :cond_2

    .line 59
    .line 60
    move p0, v5

    .line 61
    goto :goto_1

    .line 62
    :cond_2
    const/4 p0, 0x0

    .line 63
    :goto_1
    const-string v4, "Protobuf runtime is not correctly loaded."

    .line 64
    .line 65
    if-eqz p0, :cond_5

    .line 66
    .line 67
    invoke-virtual {v2, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_3

    .line 72
    .line 73
    sget-object p0, Lf31;->c:Lze1;

    .line 74
    .line 75
    sget-object v0, Li20;->a:Lg20;

    .line 76
    .line 77
    iget-object v2, v3, Lox0;->a:Lh0;

    .line 78
    .line 79
    new-instance v3, Ltn0;

    .line 80
    .line 81
    invoke-direct {v3, p0, v0, v2}, Ltn0;-><init>(Lze1;Lg20;Lh0;)V

    .line 82
    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    sget-object p0, Lf31;->b:Lze1;

    .line 86
    .line 87
    sget-object v2, Li20;->b:Lg20;

    .line 88
    .line 89
    if-eqz v2, :cond_4

    .line 90
    .line 91
    iget-object v0, v3, Lox0;->a:Lh0;

    .line 92
    .line 93
    new-instance v3, Ltn0;

    .line 94
    .line 95
    invoke-direct {v3, p0, v2, v0}, Ltn0;-><init>(Lze1;Lg20;Lh0;)V

    .line 96
    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_4
    invoke-static {v4}, Lz0;->g(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    return-object v0

    .line 103
    :cond_5
    invoke-virtual {v2, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-eqz p0, :cond_7

    .line 108
    .line 109
    invoke-virtual {v3}, Lox0;->a()I

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    invoke-static {p0}, Loq;->t(I)I

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-eq p0, v5, :cond_6

    .line 118
    .line 119
    sget-object v4, Ltp0;->b:Lrp0;

    .line 120
    .line 121
    sget-object v5, Lzi0;->b:Lyi0;

    .line 122
    .line 123
    sget-object v6, Lf31;->c:Lze1;

    .line 124
    .line 125
    sget-object v7, Li20;->a:Lg20;

    .line 126
    .line 127
    sget-object v8, Lql0;->b:Lol0;

    .line 128
    .line 129
    invoke-static/range {v3 .. v8}, Lrn0;->q(Lox0;Lrp0;Lzi0;Lze1;Lg20;Lol0;)Lrn0;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    goto :goto_2

    .line 134
    :cond_6
    sget-object v4, Ltp0;->b:Lrp0;

    .line 135
    .line 136
    sget-object v5, Lzi0;->b:Lyi0;

    .line 137
    .line 138
    sget-object v6, Lf31;->c:Lze1;

    .line 139
    .line 140
    const/4 v7, 0x0

    .line 141
    sget-object v8, Lql0;->b:Lol0;

    .line 142
    .line 143
    invoke-static/range {v3 .. v8}, Lrn0;->q(Lox0;Lrp0;Lzi0;Lze1;Lg20;Lol0;)Lrn0;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    goto :goto_2

    .line 148
    :cond_7
    invoke-virtual {v3}, Lox0;->a()I

    .line 149
    .line 150
    .line 151
    move-result p0

    .line 152
    invoke-static {p0}, Loq;->t(I)I

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    if-eq p0, v5, :cond_9

    .line 157
    .line 158
    move-object p0, v4

    .line 159
    sget-object v4, Ltp0;->a:Lrp0;

    .line 160
    .line 161
    sget-object v5, Lzi0;->a:Lxi0;

    .line 162
    .line 163
    sget-object v6, Lf31;->b:Lze1;

    .line 164
    .line 165
    sget-object v7, Li20;->b:Lg20;

    .line 166
    .line 167
    if-eqz v7, :cond_8

    .line 168
    .line 169
    sget-object v8, Lql0;->a:Lol0;

    .line 170
    .line 171
    invoke-static/range {v3 .. v8}, Lrn0;->q(Lox0;Lrp0;Lzi0;Lze1;Lg20;Lol0;)Lrn0;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    goto :goto_2

    .line 176
    :cond_8
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    return-object v0

    .line 180
    :cond_9
    sget-object v4, Ltp0;->a:Lrp0;

    .line 181
    .line 182
    sget-object v5, Lzi0;->a:Lxi0;

    .line 183
    .line 184
    sget-object v6, Lf31;->b:Lze1;

    .line 185
    .line 186
    const/4 v7, 0x0

    .line 187
    sget-object v8, Lql0;->a:Lol0;

    .line 188
    .line 189
    invoke-static/range {v3 .. v8}, Lrn0;->q(Lox0;Lrp0;Lzi0;Lze1;Lg20;Lol0;)Lrn0;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    :goto_2
    invoke-virtual {v1, p1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    check-cast p0, Lb31;

    .line 198
    .line 199
    if-eqz p0, :cond_a

    .line 200
    .line 201
    return-object p0

    .line 202
    :cond_a
    return-object v3

    .line 203
    :cond_b
    return-object v2

    .line 204
    :cond_c
    const-string p0, "messageType"

    .line 205
    .line 206
    invoke-static {p0}, Lwd1;->d(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    return-object v0
.end method
