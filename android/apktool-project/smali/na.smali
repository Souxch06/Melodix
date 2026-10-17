.class public final Lna;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lp81;


# instance fields
.field public final synthetic j:I

.field public final k:Ljava/lang/Object;

.field public final l:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Lnc1;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Lna;->j:I

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lna;->k:Ljava/lang/Object;

    .line 11
    .line 12
    iput-object p2, p0, Lna;->l:Ljava/lang/Object;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Lk81;Lna;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lna;->j:I

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lna;->k:Ljava/lang/Object;

    iput-object p2, p0, Lna;->l:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final b()Lnc1;
    .locals 1

    .line 1
    iget v0, p0, Lna;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lna;->l:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Lnc1;

    .line 9
    .line 10
    return-object p0

    .line 11
    :pswitch_0
    iget-object p0, p0, Lna;->k:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Lk81;

    .line 14
    .line 15
    return-object p0

    .line 16
    nop

    .line 17
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final c(JLeh;)J
    .locals 4

    .line 1
    iget p1, p0, Lna;->j:I

    .line 2
    .line 3
    iget-object p2, p0, Lna;->k:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object p0, p0, Lna;->l:Ljava/lang/Object;

    .line 6
    .line 7
    const-wide/16 v0, 0x2000

    .line 8
    .line 9
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    packed-switch p1, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    :try_start_0
    check-cast p0, Lnc1;

    .line 16
    .line 17
    invoke-virtual {p0}, Lnc1;->f()V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    invoke-virtual {p3, p0}, Leh;->v(I)Lp31;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget p1, p0, Lp31;->c:I

    .line 26
    .line 27
    rsub-int p1, p1, 0x2000

    .line 28
    .line 29
    int-to-long v2, p1

    .line 30
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    long-to-int p1, v0

    .line 35
    check-cast p2, Ljava/io/InputStream;

    .line 36
    .line 37
    iget-object v0, p0, Lp31;->a:[B

    .line 38
    .line 39
    iget v1, p0, Lp31;->c:I

    .line 40
    .line 41
    invoke-virtual {p2, v0, v1, p1}, Ljava/io/InputStream;->read([BII)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    const/4 p2, -0x1

    .line 46
    if-ne p1, p2, :cond_1

    .line 47
    .line 48
    iget p1, p0, Lp31;->b:I

    .line 49
    .line 50
    iget p2, p0, Lp31;->c:I

    .line 51
    .line 52
    if-ne p1, p2, :cond_0

    .line 53
    .line 54
    invoke-virtual {p0}, Lp31;->a()Lp31;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p3, Leh;->j:Lp31;

    .line 59
    .line 60
    invoke-static {p0}, Lr31;->a(Lp31;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    const-wide/16 p0, -0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    iget p2, p0, Lp31;->c:I

    .line 67
    .line 68
    add-int/2addr p2, p1

    .line 69
    iput p2, p0, Lp31;->c:I

    .line 70
    .line 71
    iget-wide v0, p3, Leh;->k:J

    .line 72
    .line 73
    int-to-long p0, p1

    .line 74
    add-long/2addr v0, p0

    .line 75
    iput-wide v0, p3, Leh;->k:J
    :try_end_0
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .line 77
    :goto_0
    return-wide p0

    .line 78
    :catch_0
    move-exception p0

    .line 79
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    if-eqz p1, :cond_3

    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    const/4 p2, 0x0

    .line 90
    if-eqz p1, :cond_2

    .line 91
    .line 92
    const-string p3, "getsockname failed"

    .line 93
    .line 94
    invoke-static {p1, p3, p2}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    :cond_2
    if-eqz p2, :cond_3

    .line 99
    .line 100
    new-instance p1, Ljava/io/IOException;

    .line 101
    .line 102
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 103
    .line 104
    .line 105
    throw p1

    .line 106
    :cond_3
    throw p0

    .line 107
    :pswitch_0
    check-cast p2, Lk81;

    .line 108
    .line 109
    check-cast p0, Lna;

    .line 110
    .line 111
    invoke-virtual {p2}, Loa;->h()V

    .line 112
    .line 113
    .line 114
    :try_start_1
    invoke-virtual {p0, v0, v1, p3}, Lna;->c(JLeh;)J

    .line 115
    .line 116
    .line 117
    move-result-wide p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 118
    invoke-virtual {p2}, Loa;->i()Z

    .line 119
    .line 120
    .line 121
    move-result p3

    .line 122
    if-nez p3, :cond_4

    .line 123
    .line 124
    return-wide p0

    .line 125
    :cond_4
    const/4 p0, 0x0

    .line 126
    invoke-virtual {p2, p0}, Lk81;->k(Ljava/io/IOException;)Ljava/io/IOException;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    throw p0

    .line 131
    :catchall_0
    move-exception p0

    .line 132
    goto :goto_2

    .line 133
    :catch_1
    move-exception p0

    .line 134
    :try_start_2
    invoke-virtual {p2}, Loa;->i()Z

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    if-nez p1, :cond_5

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_5
    invoke-virtual {p2, p0}, Lk81;->k(Ljava/io/IOException;)Ljava/io/IOException;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    :goto_1
    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 146
    :goto_2
    invoke-virtual {p2}, Loa;->i()Z

    .line 147
    .line 148
    .line 149
    throw p0

    .line 150
    nop

    .line 151
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final close()V
    .locals 2

    .line 1
    iget v0, p0, Lna;->j:I

    .line 2
    .line 3
    iget-object v1, p0, Lna;->k:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast v1, Ljava/io/InputStream;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    check-cast v1, Lk81;

    .line 15
    .line 16
    iget-object p0, p0, Lna;->l:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p0, Lna;

    .line 19
    .line 20
    invoke-virtual {v1}, Loa;->h()V

    .line 21
    .line 22
    .line 23
    :try_start_0
    invoke-virtual {p0}, Lna;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Loa;->i()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_0

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    invoke-virtual {v1, p0}, Lk81;->k(Ljava/io/IOException;)Ljava/io/IOException;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    throw p0

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto :goto_1

    .line 41
    :catch_0
    move-exception p0

    .line 42
    :try_start_1
    invoke-virtual {v1}, Loa;->i()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-virtual {v1, p0}, Lk81;->k(Ljava/io/IOException;)Ljava/io/IOException;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    :goto_0
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    :goto_1
    invoke-virtual {v1}, Loa;->i()Z

    .line 55
    .line 56
    .line 57
    throw p0

    .line 58
    nop

    .line 59
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .line 1
    iget v0, p0, Lna;->j:I

    .line 2
    .line 3
    const/16 v1, 0x29

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v2, "source("

    .line 11
    .line 12
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lna;->k:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p0, Ljava/io/InputStream;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :pswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v2, "AsyncTimeout.source("

    .line 33
    .line 34
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lna;->l:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast p0, Lna;

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0

    .line 52
    nop

    .line 53
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
