.class public final Ldw0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final c:Ldw0;


# instance fields
.field public final a:Lpa0;

.field public final b:Ljava/util/concurrent/ConcurrentHashMap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ldw0;

    .line 2
    .line 3
    invoke-direct {v0}, Ldw0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ldw0;->c:Ldw0;

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
    iput-object v0, p0, Ldw0;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    new-instance v0, Lpa0;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-direct {v0, v1}, Lpa0;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ldw0;->a:Lpa0;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Class;)Lc31;
    .locals 10

    .line 1
    const-string v0, "messageType"

    .line 2
    .line 3
    invoke-static {p1, v0}, Llf0;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ldw0;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lc31;

    .line 13
    .line 14
    if-nez v1, :cond_b

    .line 15
    .line 16
    sget-object v1, Lg31;->a:Ljava/lang/Class;

    .line 17
    .line 18
    const-class v1, Lja0;

    .line 19
    .line 20
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const/4 v3, 0x0

    .line 25
    if-nez v2, :cond_1

    .line 26
    .line 27
    sget-object v2, Lg31;->a:Ljava/lang/Class;

    .line 28
    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    invoke-virtual {v2, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const-string p0, "Message classes must extend GeneratedMessage or GeneratedMessageLite"

    .line 39
    .line 40
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-object v3

    .line 44
    :cond_1
    :goto_0
    iget-object p0, p0, Ldw0;->a:Lpa0;

    .line 45
    .line 46
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast p0, Lfl0;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lfl0;->a(Ljava/lang/Class;)Lpx0;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    iget p0, v4, Lpx0;->d:I

    .line 55
    .line 56
    const/4 v2, 0x2

    .line 57
    and-int/2addr p0, v2

    .line 58
    const/4 v5, 0x1

    .line 59
    if-ne p0, v2, :cond_2

    .line 60
    .line 61
    move p0, v5

    .line 62
    goto :goto_1

    .line 63
    :cond_2
    const/4 p0, 0x0

    .line 64
    :goto_1
    const-string v2, "Protobuf runtime is not correctly loaded."

    .line 65
    .line 66
    if-eqz p0, :cond_5

    .line 67
    .line 68
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-eqz p0, :cond_3

    .line 73
    .line 74
    sget-object p0, Lg31;->c:Laf1;

    .line 75
    .line 76
    sget-object v1, Lj20;->a:Lh20;

    .line 77
    .line 78
    iget-object v2, v4, Lpx0;->a:Li0;

    .line 79
    .line 80
    new-instance v3, Lun0;

    .line 81
    .line 82
    invoke-direct {v3, p0, v1, v2}, Lun0;-><init>(Laf1;Lh20;Li0;)V

    .line 83
    .line 84
    .line 85
    goto :goto_3

    .line 86
    :cond_3
    sget-object p0, Lg31;->b:Laf1;

    .line 87
    .line 88
    sget-object v1, Lj20;->b:Lh20;

    .line 89
    .line 90
    if-eqz v1, :cond_4

    .line 91
    .line 92
    iget-object v2, v4, Lpx0;->a:Li0;

    .line 93
    .line 94
    new-instance v3, Lun0;

    .line 95
    .line 96
    invoke-direct {v3, p0, v1, v2}, Lun0;-><init>(Laf1;Lh20;Li0;)V

    .line 97
    .line 98
    .line 99
    goto :goto_3

    .line 100
    :cond_4
    invoke-static {v2}, Lz0;->g(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-object v3

    .line 104
    :cond_5
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-eqz p0, :cond_7

    .line 109
    .line 110
    move p0, v5

    .line 111
    sget-object v5, Lup0;->b:Lsp0;

    .line 112
    .line 113
    sget-object v6, Lbj0;->b:Laj0;

    .line 114
    .line 115
    sget-object v7, Lg31;->c:Laf1;

    .line 116
    .line 117
    invoke-virtual {v4}, Lpx0;->a()I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    invoke-static {v1}, Loq;->t(I)I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-eq v1, p0, :cond_6

    .line 126
    .line 127
    sget-object v3, Lj20;->a:Lh20;

    .line 128
    .line 129
    :cond_6
    move-object v8, v3

    .line 130
    sget-object v9, Lrl0;->b:Lpl0;

    .line 131
    .line 132
    invoke-static/range {v4 .. v9}, Lsn0;->w(Lpx0;Lsp0;Laj0;Laf1;Lh20;Lpl0;)Lsn0;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    goto :goto_3

    .line 137
    :cond_7
    move p0, v5

    .line 138
    sget-object v5, Lup0;->a:Lsp0;

    .line 139
    .line 140
    sget-object v6, Lbj0;->a:Laj0;

    .line 141
    .line 142
    sget-object v7, Lg31;->b:Laf1;

    .line 143
    .line 144
    invoke-virtual {v4}, Lpx0;->a()I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    invoke-static {v1}, Loq;->t(I)I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    if-eq v1, p0, :cond_9

    .line 153
    .line 154
    sget-object p0, Lj20;->b:Lh20;

    .line 155
    .line 156
    if-eqz p0, :cond_8

    .line 157
    .line 158
    move-object v8, p0

    .line 159
    goto :goto_2

    .line 160
    :cond_8
    invoke-static {v2}, Lz0;->g(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    return-object v3

    .line 164
    :cond_9
    move-object v8, v3

    .line 165
    :goto_2
    sget-object v9, Lrl0;->a:Lpl0;

    .line 166
    .line 167
    invoke-static/range {v4 .. v9}, Lsn0;->w(Lpx0;Lsp0;Laj0;Laf1;Lh20;Lpl0;)Lsn0;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    :goto_3
    invoke-virtual {v0, p1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    check-cast p0, Lc31;

    .line 176
    .line 177
    if-eqz p0, :cond_a

    .line 178
    .line 179
    return-object p0

    .line 180
    :cond_a
    return-object v3

    .line 181
    :cond_b
    return-object v1
.end method
