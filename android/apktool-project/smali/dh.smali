.class public final Ldh;
.super Ljava/io/InputStream;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Le72;Lap1;)V
    .locals 0

    .line 1
    const/4 p1, 0x3

    .line 2
    iput p1, p0, Ldh;->j:I

    .line 3
    .line 4
    iput-object p2, p0, Ldh;->k:Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public synthetic constructor <init>(Ljava/io/Closeable;I)V
    .locals 0

    .line 10
    iput p2, p0, Ldh;->j:I

    iput-object p1, p0, Ldh;->k:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    return-void
.end method

.method private final a()V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public available()I
    .locals 5

    .line 1
    iget v0, p0, Ldh;->j:I

    .line 2
    .line 3
    const-wide/32 v1, 0x7fffffff

    .line 4
    .line 5
    .line 6
    iget-object v3, p0, Ldh;->k:Ljava/lang/Object;

    .line 7
    .line 8
    packed-switch v0, :pswitch_data_0

    .line 9
    .line 10
    .line 11
    invoke-super {p0}, Ljava/io/InputStream;->available()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :pswitch_0
    check-cast v3, Lsx0;

    .line 17
    .line 18
    iget-boolean p0, v3, Lsx0;->l:Z

    .line 19
    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    iget-object p0, v3, Lsx0;->k:Leh;

    .line 23
    .line 24
    iget-wide v3, p0, Leh;->k:J

    .line 25
    .line 26
    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    long-to-int p0, v0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string p0, "closed"

    .line 33
    .line 34
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    :goto_0
    return p0

    .line 39
    :pswitch_1
    check-cast v3, Leh;

    .line 40
    .line 41
    iget-wide v3, v3, Leh;->k:J

    .line 42
    .line 43
    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    long-to-int p0, v0

    .line 48
    return p0

    .line 49
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public close()V
    .locals 1

    .line 1
    iget v0, p0, Ldh;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ljava/io/InputStream;->close()V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :pswitch_0
    iget-object p0, p0, Ldh;->k:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p0, Lsx0;

    .line 13
    .line 14
    invoke-virtual {p0}, Lsx0;->close()V

    .line 15
    .line 16
    .line 17
    :pswitch_1
    return-void

    .line 18
    nop

    .line 19
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final read()I
    .locals 7

    iget v0, p0, Ldh;->j:I

    const-wide/16 v1, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-object v5, p0, Ldh;->k:Ljava/lang/Object;

    const/4 v6, -0x1

    packed-switch v0, :pswitch_data_0

    .line 165
    check-cast v5, Lap1;

    new-array p0, v3, [B

    invoke-virtual {v5, p0, v4, v3}, Lap1;->f([BII)I

    move-result v0

    if-ne v0, v6, :cond_0

    goto :goto_0

    :cond_0
    aget-byte v6, p0, v4

    :goto_0
    return v6

    .line 166
    :pswitch_0
    new-array v0, v3, [B

    invoke-virtual {p0, v0, v4, v3}, Ldh;->read([BII)I

    move-result p0

    if-ne p0, v6, :cond_1

    goto :goto_1

    :cond_1
    aget-byte v6, v0, v4

    :goto_1
    return v6

    .line 167
    :pswitch_1
    check-cast v5, Lsx0;

    iget-object p0, v5, Lsx0;->k:Leh;

    iget-boolean v0, v5, Lsx0;->l:Z

    if-nez v0, :cond_3

    .line 168
    iget-wide v3, p0, Leh;->k:J

    cmp-long v0, v3, v1

    if-nez v0, :cond_2

    .line 169
    iget-object v0, v5, Lsx0;->j:Lp81;

    const-wide/16 v1, 0x2000

    invoke-interface {v0, v1, v2, p0}, Lp81;->c(JLeh;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    move v4, v6

    goto :goto_2

    .line 170
    :cond_2
    invoke-virtual {p0}, Leh;->readByte()B

    move-result p0

    and-int/lit16 v4, p0, 0xff

    goto :goto_2

    .line 171
    :cond_3
    const-string p0, "closed"

    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    :goto_2
    return v4

    .line 172
    :pswitch_2
    check-cast v5, Leh;

    .line 173
    iget-wide v3, v5, Leh;->k:J

    cmp-long p0, v3, v1

    if-lez p0, :cond_4

    .line 174
    invoke-virtual {v5}, Leh;->readByte()B

    move-result p0

    and-int/lit16 v6, p0, 0xff

    :cond_4
    return v6

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final read([BII)I
    .locals 9

    .line 1
    iget v0, p0, Ldh;->j:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, -0x1

    .line 5
    iget-object p0, p0, Ldh;->k:Ljava/lang/Object;

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    check-cast p0, Lap1;

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2, p3}, Lap1;->f([BII)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :pswitch_0
    check-cast p0, Le72;

    .line 18
    .line 19
    iget-object p0, p0, Le72;->j:Ljava/util/zip/Inflater;

    .line 20
    .line 21
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Ljava/util/zip/Inflater;->inflate([BII)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-lez p1, :cond_0

    .line 26
    .line 27
    move v1, p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    if-eqz p3, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/util/zip/Inflater;->getRemaining()I

    .line 32
    .line 33
    .line 34
    move-result p1
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    move v1, v2

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    new-instance p1, Ljava/io/IOException;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/util/zip/Inflater;->getRemaining()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    add-int/lit8 p2, p2, 0x46

    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p2, v0

    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 67
    .line 68
    .line 69
    const-string p2, "Read no bytes (requested up to "

    .line 70
    .line 71
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string p2, ") but did not reach end of stream, had "

    .line 78
    .line 79
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    throw p1

    .line 93
    :cond_2
    :goto_0
    return v1

    .line 94
    :catch_0
    move-exception v0

    .line 95
    move-object p0, v0

    .line 96
    new-instance p1, Ljava/io/IOException;

    .line 97
    .line 98
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 99
    .line 100
    .line 101
    throw p1

    .line 102
    :pswitch_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 103
    .line 104
    .line 105
    check-cast p0, Lsx0;

    .line 106
    .line 107
    iget-object v0, p0, Lsx0;->k:Leh;

    .line 108
    .line 109
    iget-boolean v3, p0, Lsx0;->l:Z

    .line 110
    .line 111
    if-nez v3, :cond_4

    .line 112
    .line 113
    array-length v1, p1

    .line 114
    int-to-long v3, v1

    .line 115
    int-to-long v5, p2

    .line 116
    int-to-long v7, p3

    .line 117
    invoke-static/range {v3 .. v8}, Lkp1;->b(JJJ)V

    .line 118
    .line 119
    .line 120
    iget-wide v3, v0, Leh;->k:J

    .line 121
    .line 122
    const-wide/16 v5, 0x0

    .line 123
    .line 124
    cmp-long v1, v3, v5

    .line 125
    .line 126
    if-nez v1, :cond_3

    .line 127
    .line 128
    iget-object p0, p0, Lsx0;->j:Lp81;

    .line 129
    .line 130
    const-wide/16 v3, 0x2000

    .line 131
    .line 132
    invoke-interface {p0, v3, v4, v0}, Lp81;->c(JLeh;)J

    .line 133
    .line 134
    .line 135
    move-result-wide v3

    .line 136
    const-wide/16 v5, -0x1

    .line 137
    .line 138
    cmp-long p0, v3, v5

    .line 139
    .line 140
    if-nez p0, :cond_3

    .line 141
    .line 142
    move v1, v2

    .line 143
    goto :goto_1

    .line 144
    :cond_3
    invoke-virtual {v0, p1, p2, p3}, Leh;->read([BII)I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    goto :goto_1

    .line 149
    :cond_4
    const-string p0, "closed"

    .line 150
    .line 151
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    :goto_1
    return v1

    .line 155
    :pswitch_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 156
    .line 157
    .line 158
    check-cast p0, Leh;

    .line 159
    .line 160
    invoke-virtual {p0, p1, p2, p3}, Leh;->read([BII)I

    .line 161
    .line 162
    .line 163
    move-result p0

    .line 164
    return p0

    .line 165
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public skip(J)J
    .locals 3

    .line 1
    iget v0, p0, Ldh;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    .line 7
    .line 8
    .line 9
    move-result-wide p0

    .line 10
    return-wide p0

    .line 11
    :pswitch_0
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    cmp-long v2, p1, v0

    .line 14
    .line 15
    if-gtz v2, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const-wide/32 v0, 0x7fffffff

    .line 19
    .line 20
    .line 21
    cmp-long v0, p1, v0

    .line 22
    .line 23
    if-lez v0, :cond_1

    .line 24
    .line 25
    const p1, 0x7fffffff

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    long-to-int p1, p1

    .line 30
    :goto_0
    iget-object p0, p0, Ldh;->k:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast p0, Lap1;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lap1;->g(I)V

    .line 35
    .line 36
    .line 37
    int-to-long v0, p1

    .line 38
    :goto_1
    return-wide v0

    .line 39
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    iget v0, p0, Ldh;->j:I

    .line 2
    .line 3
    const-string v1, ".inputStream()"

    .line 4
    .line 5
    iget-object v2, p0, Ldh;->k:Ljava/lang/Object;

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :pswitch_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    check-cast v2, Lsx0;

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :pswitch_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    check-cast v2, Leh;

    .line 39
    .line 40
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
