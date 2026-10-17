.class public final Lw72;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final c:Lw72;


# instance fields
.field public final a:Li72;

.field public final b:Lz62;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lw72;

    .line 2
    .line 3
    sget-object v1, Li72;->b:Li72;

    .line 4
    .line 5
    invoke-static {}, Lz62;->y()Lz62;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-direct {v0, v1, v2}, Lw72;-><init>(Li72;Lz62;)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lw72;->c:Lw72;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Li72;Lz62;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lw72;->a:Li72;

    .line 8
    .line 9
    iput-object p2, p0, Lw72;->b:Lz62;

    .line 10
    .line 11
    return-void
.end method

.method public static a(Lap1;Z)Lw72;
    .locals 7

    .line 1
    invoke-virtual {p0}, Lap1;->C()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-gt v0, v1, :cond_3

    .line 7
    .line 8
    invoke-virtual {p0}, Lap1;->C()I

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lap1;->A()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0, v0}, Lap1;->a(I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    sget-object v1, Lgp1;->a:Lgp1;

    .line 20
    .line 21
    sget v1, Lso1;->a:I

    .line 22
    .line 23
    sget-object v1, Lgp1;->b:Lgp1;

    .line 24
    .line 25
    invoke-static {p0, v1}, Lz62;->x(Lap1;Lgp1;)Lz62;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p0, v0}, Lap1;->b(I)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Le72;

    .line 33
    .line 34
    invoke-direct {v0}, Le72;-><init>()V

    .line 35
    .line 36
    .line 37
    iget-object v2, v0, Le72;->j:Ljava/util/zip/Inflater;

    .line 38
    .line 39
    const/16 v3, 0x1000

    .line 40
    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    :try_start_0
    invoke-virtual {p0}, Lap1;->A()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    invoke-virtual {p0, p1}, Lap1;->a(I)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-virtual {p0}, Lap1;->c()I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    if-gez v4, :cond_0

    .line 56
    .line 57
    move v4, v3

    .line 58
    goto :goto_0

    .line 59
    :cond_0
    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    .line 60
    .line 61
    .line 62
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    :goto_0
    :try_start_1
    new-instance v5, Ljava/util/zip/InflaterInputStream;

    .line 64
    .line 65
    new-instance v6, Ldh;

    .line 66
    .line 67
    invoke-direct {v6, v0, p0}, Ldh;-><init>(Le72;Lap1;)V

    .line 68
    .line 69
    .line 70
    invoke-direct {v5, v6, v2, v4}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;I)V

    .line 71
    .line 72
    .line 73
    invoke-static {v5, v3}, Lap1;->h(Ljava/io/InputStream;I)Lap1;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-static {v3}, Li72;->a(Lap1;)Li72;

    .line 78
    .line 79
    .line 80
    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 81
    :try_start_2
    invoke-virtual {v2}, Ljava/util/zip/Inflater;->reset()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Lap1;->c()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    if-nez v2, :cond_1

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Lap1;->b(I)V

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :catchall_0
    move-exception p0

    .line 95
    goto :goto_2

    .line 96
    :cond_1
    new-instance p0, Laq1;

    .line 97
    .line 98
    const-string p1, "Unexpected bytes remaining after FlagsBlob parsing."

    .line 99
    .line 100
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    throw p0

    .line 104
    :catchall_1
    move-exception p0

    .line 105
    invoke-virtual {v2}, Ljava/util/zip/Inflater;->reset()V

    .line 106
    .line 107
    .line 108
    throw p0

    .line 109
    :cond_2
    invoke-virtual {p0}, Lap1;->z()[B

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {v2, p0}, Ljava/util/zip/Inflater;->setInput([B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 114
    .line 115
    .line 116
    :try_start_3
    new-instance p0, Ldh;

    .line 117
    .line 118
    const/4 p1, 0x2

    .line 119
    invoke-direct {p0, v0, p1}, Ldh;-><init>(Ljava/io/Closeable;I)V

    .line 120
    .line 121
    .line 122
    invoke-static {p0, v3}, Lap1;->h(Ljava/io/InputStream;I)Lap1;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-static {p0}, Li72;->a(Lap1;)Li72;

    .line 127
    .line 128
    .line 129
    move-result-object v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 130
    :try_start_4
    invoke-virtual {v2}, Ljava/util/zip/Inflater;->reset()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 131
    .line 132
    .line 133
    :goto_1
    invoke-virtual {v0}, Le72;->close()V

    .line 134
    .line 135
    .line 136
    new-instance p0, Lw72;

    .line 137
    .line 138
    invoke-direct {p0, v3, v1}, Lw72;-><init>(Li72;Lz62;)V

    .line 139
    .line 140
    .line 141
    return-object p0

    .line 142
    :catchall_2
    move-exception p0

    .line 143
    :try_start_5
    invoke-virtual {v2}, Ljava/util/zip/Inflater;->reset()V

    .line 144
    .line 145
    .line 146
    throw p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 147
    :goto_2
    :try_start_6
    invoke-virtual {v0}, Le72;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 148
    .line 149
    .line 150
    goto :goto_3

    .line 151
    :catchall_3
    move-exception p1

    .line 152
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 153
    .line 154
    .line 155
    :goto_3
    throw p0

    .line 156
    :cond_3
    new-instance p0, Laq1;

    .line 157
    .line 158
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    add-int/lit8 p1, p1, 0x2c

    .line 167
    .line 168
    new-instance v1, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 171
    .line 172
    .line 173
    const-string p1, "Unsupported version: "

    .line 174
    .line 175
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    const-string p1, ". Current version is: 1"

    .line 182
    .line 183
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    throw p0
.end method
