.class public final Lu10;
.super Ljava/io/InputStream;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/io/DataInput;


# static fields
.field public static final n:Ljava/nio/ByteOrder;

.field public static final o:Ljava/nio/ByteOrder;


# instance fields
.field public final j:Ljava/io/DataInputStream;

.field public k:Ljava/nio/ByteOrder;

.field public final l:I

.field public m:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 2
    .line 3
    sput-object v0, Lu10;->n:Ljava/nio/ByteOrder;

    .line 4
    .line 5
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 6
    .line 7
    sput-object v0, Lu10;->o:Ljava/nio/ByteOrder;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 5
    .line 6
    iput-object v0, p0, Lu10;->k:Ljava/nio/ByteOrder;

    .line 7
    .line 8
    new-instance v0, Ljava/io/DataInputStream;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lu10;->j:Ljava/io/DataInputStream;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iput p1, p0, Lu10;->l:I

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    iput v1, p0, Lu10;->m:I

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/io/InputStream;->mark(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>([B)V
    .locals 1

    .line 28
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Lu10;-><init>(Ljava/io/InputStream;)V

    return-void
.end method


# virtual methods
.method public final a(J)V
    .locals 3

    .line 1
    iget v0, p0, Lu10;->m:I

    .line 2
    .line 3
    int-to-long v1, v0

    .line 4
    cmp-long v1, v1, p1

    .line 5
    .line 6
    if-lez v1, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lu10;->m:I

    .line 10
    .line 11
    iget-object v0, p0, Lu10;->j:Ljava/io/DataInputStream;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V

    .line 14
    .line 15
    .line 16
    iget v1, p0, Lu10;->l:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->mark(I)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    int-to-long v0, v0

    .line 23
    sub-long/2addr p1, v0

    .line 24
    :goto_0
    long-to-int p1, p1

    .line 25
    invoke-virtual {p0, p1}, Lu10;->skipBytes(I)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-ne p0, p1, :cond_1

    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    const-string p0, "Couldn\'t seek up to the byteCount"

    .line 33
    .line 34
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final available()I
    .locals 0

    .line 1
    iget-object p0, p0, Lu10;->j:Ljava/io/DataInputStream;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final read()I
    .locals 1

    .line 1
    iget v0, p0, Lu10;->m:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lu10;->m:I

    .line 6
    .line 7
    iget-object p0, p0, Lu10;->j:Ljava/io/DataInputStream;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final read([BII)I
    .locals 1

    .line 14
    iget-object v0, p0, Lu10;->j:Ljava/io/DataInputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/DataInputStream;->read([BII)I

    move-result p1

    .line 15
    iget p2, p0, Lu10;->m:I

    add-int/2addr p2, p1

    iput p2, p0, Lu10;->m:I

    return p1
.end method

.method public final readBoolean()Z
    .locals 1

    .line 1
    iget v0, p0, Lu10;->m:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lu10;->m:I

    .line 6
    .line 7
    iget-object p0, p0, Lu10;->j:Ljava/io/DataInputStream;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readBoolean()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final readByte()B
    .locals 2

    .line 1
    iget v0, p0, Lu10;->m:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lu10;->m:I

    .line 6
    .line 7
    iget v1, p0, Lu10;->l:I

    .line 8
    .line 9
    if-gt v0, v1, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lu10;->j:Ljava/io/DataInputStream;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-ltz p0, :cond_0

    .line 18
    .line 19
    int-to-byte p0, p0

    .line 20
    return p0

    .line 21
    :cond_0
    new-instance p0, Ljava/io/EOFException;

    .line 22
    .line 23
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 24
    .line 25
    .line 26
    throw p0

    .line 27
    :cond_1
    new-instance p0, Ljava/io/EOFException;

    .line 28
    .line 29
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 30
    .line 31
    .line 32
    throw p0
.end method

.method public final readChar()C
    .locals 1

    .line 1
    iget v0, p0, Lu10;->m:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    iput v0, p0, Lu10;->m:I

    .line 6
    .line 7
    iget-object p0, p0, Lu10;->j:Ljava/io/DataInputStream;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readChar()C

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final readDouble()D
    .locals 2

    .line 1
    invoke-virtual {p0}, Lu10;->readLong()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public final readFloat()F
    .locals 0

    .line 1
    invoke-virtual {p0}, Lu10;->readInt()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Float;->intBitsToFloat(I)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final readFully([B)V
    .locals 2

    .line 1
    iget v0, p0, Lu10;->m:I

    .line 2
    .line 3
    array-length v1, p1

    .line 4
    add-int/2addr v0, v1

    .line 5
    iput v0, p0, Lu10;->m:I

    .line 6
    .line 7
    iget v1, p0, Lu10;->l:I

    .line 8
    .line 9
    if-gt v0, v1, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    array-length v1, p1

    .line 13
    iget-object p0, p0, Lu10;->j:Ljava/io/DataInputStream;

    .line 14
    .line 15
    invoke-virtual {p0, p1, v0, v1}, Ljava/io/DataInputStream;->read([BII)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    array-length p1, p1

    .line 20
    if-ne p0, p1, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string p0, "Couldn\'t read up to the length of buffer"

    .line 24
    .line 25
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    new-instance p0, Ljava/io/EOFException;

    .line 30
    .line 31
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 32
    .line 33
    .line 34
    throw p0
.end method

.method public final readFully([BII)V
    .locals 2

    .line 35
    iget v0, p0, Lu10;->m:I

    add-int/2addr v0, p3

    iput v0, p0, Lu10;->m:I

    .line 36
    iget v1, p0, Lu10;->l:I

    if-gt v0, v1, :cond_1

    .line 37
    iget-object p0, p0, Lu10;->j:Ljava/io/DataInputStream;

    invoke-virtual {p0, p1, p2, p3}, Ljava/io/DataInputStream;->read([BII)I

    move-result p0

    if-ne p0, p3, :cond_0

    return-void

    .line 38
    :cond_0
    const-string p0, "Couldn\'t read up to the length of buffer"

    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    return-void

    .line 39
    :cond_1
    new-instance p0, Ljava/io/EOFException;

    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    throw p0
.end method

.method public final readInt()I
    .locals 6

    .line 1
    iget v0, p0, Lu10;->m:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x4

    .line 4
    .line 5
    iput v0, p0, Lu10;->m:I

    .line 6
    .line 7
    iget v1, p0, Lu10;->l:I

    .line 8
    .line 9
    if-gt v0, v1, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Lu10;->j:Ljava/io/DataInputStream;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    or-int v4, v1, v2

    .line 30
    .line 31
    or-int/2addr v4, v3

    .line 32
    or-int/2addr v4, v0

    .line 33
    if-ltz v4, :cond_2

    .line 34
    .line 35
    iget-object v4, p0, Lu10;->k:Ljava/nio/ByteOrder;

    .line 36
    .line 37
    sget-object v5, Lu10;->n:Ljava/nio/ByteOrder;

    .line 38
    .line 39
    if-ne v4, v5, :cond_0

    .line 40
    .line 41
    shl-int/lit8 p0, v0, 0x18

    .line 42
    .line 43
    shl-int/lit8 v0, v3, 0x10

    .line 44
    .line 45
    add-int/2addr p0, v0

    .line 46
    shl-int/lit8 v0, v2, 0x8

    .line 47
    .line 48
    add-int/2addr p0, v0

    .line 49
    add-int/2addr p0, v1

    .line 50
    return p0

    .line 51
    :cond_0
    sget-object v5, Lu10;->o:Ljava/nio/ByteOrder;

    .line 52
    .line 53
    if-ne v4, v5, :cond_1

    .line 54
    .line 55
    shl-int/lit8 p0, v1, 0x18

    .line 56
    .line 57
    shl-int/lit8 v1, v2, 0x10

    .line 58
    .line 59
    add-int/2addr p0, v1

    .line 60
    shl-int/lit8 v1, v3, 0x8

    .line 61
    .line 62
    add-int/2addr p0, v1

    .line 63
    add-int/2addr p0, v0

    .line 64
    return p0

    .line 65
    :cond_1
    const-string v0, "Invalid byte order: "

    .line 66
    .line 67
    iget-object p0, p0, Lu10;->k:Ljava/nio/ByteOrder;

    .line 68
    .line 69
    invoke-static {p0, v0}, Lz0;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x0

    .line 73
    return p0

    .line 74
    :cond_2
    new-instance p0, Ljava/io/EOFException;

    .line 75
    .line 76
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 77
    .line 78
    .line 79
    throw p0

    .line 80
    :cond_3
    new-instance p0, Ljava/io/EOFException;

    .line 81
    .line 82
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 83
    .line 84
    .line 85
    throw p0
.end method

.method public final readLine()Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final readLong()J
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lu10;->m:I

    .line 4
    .line 5
    const/16 v2, 0x8

    .line 6
    .line 7
    add-int/2addr v1, v2

    .line 8
    iput v1, v0, Lu10;->m:I

    .line 9
    .line 10
    iget v3, v0, Lu10;->l:I

    .line 11
    .line 12
    if-gt v1, v3, :cond_3

    .line 13
    .line 14
    iget-object v1, v0, Lu10;->j:Ljava/io/DataInputStream;

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    .line 29
    .line 30
    .line 31
    move-result v6

    .line 32
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    .line 33
    .line 34
    .line 35
    move-result v7

    .line 36
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    .line 37
    .line 38
    .line 39
    move-result v8

    .line 40
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    .line 41
    .line 42
    .line 43
    move-result v9

    .line 44
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    or-int v10, v3, v4

    .line 49
    .line 50
    or-int/2addr v10, v5

    .line 51
    or-int/2addr v10, v6

    .line 52
    or-int/2addr v10, v7

    .line 53
    or-int/2addr v10, v8

    .line 54
    or-int/2addr v10, v9

    .line 55
    or-int/2addr v10, v1

    .line 56
    if-ltz v10, :cond_2

    .line 57
    .line 58
    iget-object v10, v0, Lu10;->k:Ljava/nio/ByteOrder;

    .line 59
    .line 60
    sget-object v11, Lu10;->n:Ljava/nio/ByteOrder;

    .line 61
    .line 62
    const/16 v12, 0x10

    .line 63
    .line 64
    const/16 v13, 0x18

    .line 65
    .line 66
    const/16 v14, 0x20

    .line 67
    .line 68
    const/16 v15, 0x28

    .line 69
    .line 70
    const/16 v16, 0x30

    .line 71
    .line 72
    const/16 v17, 0x38

    .line 73
    .line 74
    if-ne v10, v11, :cond_0

    .line 75
    .line 76
    int-to-long v0, v1

    .line 77
    shl-long v0, v0, v17

    .line 78
    .line 79
    int-to-long v9, v9

    .line 80
    shl-long v9, v9, v16

    .line 81
    .line 82
    add-long/2addr v0, v9

    .line 83
    int-to-long v8, v8

    .line 84
    shl-long/2addr v8, v15

    .line 85
    add-long/2addr v0, v8

    .line 86
    int-to-long v7, v7

    .line 87
    shl-long/2addr v7, v14

    .line 88
    add-long/2addr v0, v7

    .line 89
    int-to-long v6, v6

    .line 90
    shl-long/2addr v6, v13

    .line 91
    add-long/2addr v0, v6

    .line 92
    int-to-long v5, v5

    .line 93
    shl-long/2addr v5, v12

    .line 94
    add-long/2addr v0, v5

    .line 95
    int-to-long v4, v4

    .line 96
    shl-long/2addr v4, v2

    .line 97
    add-long/2addr v0, v4

    .line 98
    int-to-long v2, v3

    .line 99
    add-long/2addr v0, v2

    .line 100
    return-wide v0

    .line 101
    :cond_0
    sget-object v11, Lu10;->o:Ljava/nio/ByteOrder;

    .line 102
    .line 103
    if-ne v10, v11, :cond_1

    .line 104
    .line 105
    int-to-long v10, v3

    .line 106
    shl-long v10, v10, v17

    .line 107
    .line 108
    int-to-long v3, v4

    .line 109
    shl-long v3, v3, v16

    .line 110
    .line 111
    add-long/2addr v10, v3

    .line 112
    int-to-long v3, v5

    .line 113
    shl-long/2addr v3, v15

    .line 114
    add-long/2addr v10, v3

    .line 115
    int-to-long v3, v6

    .line 116
    shl-long/2addr v3, v14

    .line 117
    add-long/2addr v10, v3

    .line 118
    int-to-long v3, v7

    .line 119
    shl-long/2addr v3, v13

    .line 120
    add-long/2addr v10, v3

    .line 121
    int-to-long v3, v8

    .line 122
    shl-long/2addr v3, v12

    .line 123
    add-long/2addr v10, v3

    .line 124
    int-to-long v3, v9

    .line 125
    shl-long v2, v3, v2

    .line 126
    .line 127
    add-long/2addr v10, v2

    .line 128
    int-to-long v0, v1

    .line 129
    add-long/2addr v10, v0

    .line 130
    return-wide v10

    .line 131
    :cond_1
    const-string v1, "Invalid byte order: "

    .line 132
    .line 133
    iget-object v0, v0, Lu10;->k:Ljava/nio/ByteOrder;

    .line 134
    .line 135
    invoke-static {v0, v1}, Lz0;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    const-wide/16 v0, 0x0

    .line 139
    .line 140
    return-wide v0

    .line 141
    :cond_2
    new-instance v0, Ljava/io/EOFException;

    .line 142
    .line 143
    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    .line 144
    .line 145
    .line 146
    throw v0

    .line 147
    :cond_3
    new-instance v0, Ljava/io/EOFException;

    .line 148
    .line 149
    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    .line 150
    .line 151
    .line 152
    throw v0
.end method

.method public final readShort()S
    .locals 4

    .line 1
    iget v0, p0, Lu10;->m:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    iput v0, p0, Lu10;->m:I

    .line 6
    .line 7
    iget v1, p0, Lu10;->l:I

    .line 8
    .line 9
    if-gt v0, v1, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Lu10;->j:Ljava/io/DataInputStream;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    or-int v2, v1, v0

    .line 22
    .line 23
    if-ltz v2, :cond_2

    .line 24
    .line 25
    iget-object v2, p0, Lu10;->k:Ljava/nio/ByteOrder;

    .line 26
    .line 27
    sget-object v3, Lu10;->n:Ljava/nio/ByteOrder;

    .line 28
    .line 29
    if-ne v2, v3, :cond_0

    .line 30
    .line 31
    shl-int/lit8 p0, v0, 0x8

    .line 32
    .line 33
    add-int/2addr p0, v1

    .line 34
    int-to-short p0, p0

    .line 35
    return p0

    .line 36
    :cond_0
    sget-object v3, Lu10;->o:Ljava/nio/ByteOrder;

    .line 37
    .line 38
    if-ne v2, v3, :cond_1

    .line 39
    .line 40
    shl-int/lit8 p0, v1, 0x8

    .line 41
    .line 42
    add-int/2addr p0, v0

    .line 43
    int-to-short p0, p0

    .line 44
    return p0

    .line 45
    :cond_1
    const-string v0, "Invalid byte order: "

    .line 46
    .line 47
    iget-object p0, p0, Lu10;->k:Ljava/nio/ByteOrder;

    .line 48
    .line 49
    invoke-static {p0, v0}, Lz0;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x0

    .line 53
    return p0

    .line 54
    :cond_2
    new-instance p0, Ljava/io/EOFException;

    .line 55
    .line 56
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 57
    .line 58
    .line 59
    throw p0

    .line 60
    :cond_3
    new-instance p0, Ljava/io/EOFException;

    .line 61
    .line 62
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 63
    .line 64
    .line 65
    throw p0
.end method

.method public final readUTF()Ljava/lang/String;
    .locals 1

    .line 1
    iget v0, p0, Lu10;->m:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    iput v0, p0, Lu10;->m:I

    .line 6
    .line 7
    iget-object p0, p0, Lu10;->j:Ljava/io/DataInputStream;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final readUnsignedByte()I
    .locals 1

    .line 1
    iget v0, p0, Lu10;->m:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lu10;->m:I

    .line 6
    .line 7
    iget-object p0, p0, Lu10;->j:Ljava/io/DataInputStream;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedByte()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final readUnsignedShort()I
    .locals 4

    .line 1
    iget v0, p0, Lu10;->m:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    iput v0, p0, Lu10;->m:I

    .line 6
    .line 7
    iget v1, p0, Lu10;->l:I

    .line 8
    .line 9
    if-gt v0, v1, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Lu10;->j:Ljava/io/DataInputStream;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    or-int v2, v1, v0

    .line 22
    .line 23
    if-ltz v2, :cond_2

    .line 24
    .line 25
    iget-object v2, p0, Lu10;->k:Ljava/nio/ByteOrder;

    .line 26
    .line 27
    sget-object v3, Lu10;->n:Ljava/nio/ByteOrder;

    .line 28
    .line 29
    if-ne v2, v3, :cond_0

    .line 30
    .line 31
    shl-int/lit8 p0, v0, 0x8

    .line 32
    .line 33
    add-int/2addr p0, v1

    .line 34
    return p0

    .line 35
    :cond_0
    sget-object v3, Lu10;->o:Ljava/nio/ByteOrder;

    .line 36
    .line 37
    if-ne v2, v3, :cond_1

    .line 38
    .line 39
    shl-int/lit8 p0, v1, 0x8

    .line 40
    .line 41
    add-int/2addr p0, v0

    .line 42
    return p0

    .line 43
    :cond_1
    const-string v0, "Invalid byte order: "

    .line 44
    .line 45
    iget-object p0, p0, Lu10;->k:Ljava/nio/ByteOrder;

    .line 46
    .line 47
    invoke-static {p0, v0}, Lz0;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const/4 p0, 0x0

    .line 51
    return p0

    .line 52
    :cond_2
    new-instance p0, Ljava/io/EOFException;

    .line 53
    .line 54
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 55
    .line 56
    .line 57
    throw p0

    .line 58
    :cond_3
    new-instance p0, Ljava/io/EOFException;

    .line 59
    .line 60
    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    .line 61
    .line 62
    .line 63
    throw p0
.end method

.method public final skipBytes(I)I
    .locals 3

    .line 1
    iget v0, p0, Lu10;->l:I

    .line 2
    .line 3
    iget v1, p0, Lu10;->m:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    const/4 v0, 0x0

    .line 11
    :goto_0
    if-ge v0, p1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lu10;->j:Ljava/io/DataInputStream;

    .line 14
    .line 15
    sub-int v2, p1, v0

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/io/DataInputStream;->skipBytes(I)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    add-int/2addr v0, v1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget p1, p0, Lu10;->m:I

    .line 24
    .line 25
    add-int/2addr p1, v0

    .line 26
    iput p1, p0, Lu10;->m:I

    .line 27
    .line 28
    return v0
.end method
