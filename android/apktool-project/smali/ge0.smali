.class public final Lge0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lp81;


# instance fields
.field public final j:Lsx0;

.field public final k:Ljava/util/zip/Inflater;

.field public l:I

.field public m:Z


# direct methods
.method public constructor <init>(Lsx0;Ljava/util/zip/Inflater;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lge0;->j:Lsx0;

    .line 5
    .line 6
    iput-object p2, p0, Lge0;->k:Ljava/util/zip/Inflater;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final b()Lnc1;
    .locals 0

    .line 1
    iget-object p0, p0, Lge0;->j:Lsx0;

    .line 2
    .line 3
    iget-object p0, p0, Lsx0;->j:Lp81;

    .line 4
    .line 5
    invoke-interface {p0}, Lp81;->b()Lnc1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final c(JLeh;)J
    .locals 7

    .line 1
    iget-object p1, p0, Lge0;->k:Ljava/util/zip/Inflater;

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    :goto_0
    iget-boolean p2, p0, Lge0;->m:Z

    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    if-nez p2, :cond_9

    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    :try_start_0
    invoke-virtual {p3, p2}, Leh;->v(I)Lp31;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    iget v2, p2, Lp31;->c:I

    .line 18
    .line 19
    rsub-int v2, v2, 0x2000

    .line 20
    .line 21
    int-to-long v2, v2

    .line 22
    const-wide/16 v4, 0x2000

    .line 23
    .line 24
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 25
    .line 26
    .line 27
    move-result-wide v2

    .line 28
    long-to-int v2, v2

    .line 29
    invoke-virtual {p1}, Ljava/util/zip/Inflater;->needsInput()Z

    .line 30
    .line 31
    .line 32
    move-result v3
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    iget-object v4, p0, Lge0;->j:Lsx0;

    .line 34
    .line 35
    if-nez v3, :cond_0

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_1
    invoke-virtual {v4}, Lsx0;->a()Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    iget-object v3, v4, Lsx0;->k:Leh;

    .line 46
    .line 47
    iget-object v3, v3, Leh;->j:Lp31;

    .line 48
    .line 49
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    iget v5, v3, Lp31;->c:I

    .line 53
    .line 54
    iget v6, v3, Lp31;->b:I

    .line 55
    .line 56
    sub-int/2addr v5, v6

    .line 57
    iput v5, p0, Lge0;->l:I

    .line 58
    .line 59
    iget-object v3, v3, Lp31;->a:[B

    .line 60
    .line 61
    invoke-virtual {p1, v3, v6, v5}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 62
    .line 63
    .line 64
    :goto_1
    iget-object v3, p2, Lp31;->a:[B

    .line 65
    .line 66
    iget v5, p2, Lp31;->c:I

    .line 67
    .line 68
    invoke-virtual {p1, v3, v5, v2}, Ljava/util/zip/Inflater;->inflate([BII)I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    iget v3, p0, Lge0;->l:I

    .line 73
    .line 74
    if-nez v3, :cond_2

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_2
    invoke-virtual {p1}, Ljava/util/zip/Inflater;->getRemaining()I

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    sub-int/2addr v3, v5

    .line 82
    iget v5, p0, Lge0;->l:I

    .line 83
    .line 84
    sub-int/2addr v5, v3

    .line 85
    iput v5, p0, Lge0;->l:I

    .line 86
    .line 87
    int-to-long v5, v3

    .line 88
    invoke-virtual {v4, v5, v6}, Lsx0;->skip(J)V

    .line 89
    .line 90
    .line 91
    :goto_2
    if-lez v2, :cond_3

    .line 92
    .line 93
    iget v3, p2, Lp31;->c:I

    .line 94
    .line 95
    add-int/2addr v3, v2

    .line 96
    iput v3, p2, Lp31;->c:I

    .line 97
    .line 98
    iget-wide v5, p3, Leh;->k:J

    .line 99
    .line 100
    int-to-long v2, v2

    .line 101
    add-long/2addr v5, v2

    .line 102
    iput-wide v5, p3, Leh;->k:J

    .line 103
    .line 104
    goto :goto_3

    .line 105
    :cond_3
    iget v2, p2, Lp31;->b:I

    .line 106
    .line 107
    iget v3, p2, Lp31;->c:I

    .line 108
    .line 109
    if-ne v2, v3, :cond_4

    .line 110
    .line 111
    invoke-virtual {p2}, Lp31;->a()Lp31;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    iput-object v2, p3, Leh;->j:Lp31;

    .line 116
    .line 117
    invoke-static {p2}, Lr31;->a(Lp31;)V
    :try_end_1
    .catch Ljava/util/zip/DataFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 118
    .line 119
    .line 120
    :cond_4
    move-wide v2, v0

    .line 121
    :goto_3
    cmp-long p2, v2, v0

    .line 122
    .line 123
    if-lez p2, :cond_5

    .line 124
    .line 125
    return-wide v2

    .line 126
    :cond_5
    invoke-virtual {p1}, Ljava/util/zip/Inflater;->finished()Z

    .line 127
    .line 128
    .line 129
    move-result p2

    .line 130
    if-nez p2, :cond_8

    .line 131
    .line 132
    invoke-virtual {p1}, Ljava/util/zip/Inflater;->needsDictionary()Z

    .line 133
    .line 134
    .line 135
    move-result p2

    .line 136
    if-eqz p2, :cond_6

    .line 137
    .line 138
    goto :goto_4

    .line 139
    :cond_6
    invoke-virtual {v4}, Lsx0;->a()Z

    .line 140
    .line 141
    .line 142
    move-result p2

    .line 143
    if-nez p2, :cond_7

    .line 144
    .line 145
    goto/16 :goto_0

    .line 146
    .line 147
    :cond_7
    new-instance p0, Ljava/io/EOFException;

    .line 148
    .line 149
    const-string p1, "source exhausted prematurely"

    .line 150
    .line 151
    invoke-direct {p0, p1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    throw p0

    .line 155
    :cond_8
    :goto_4
    const-wide/16 p0, -0x1

    .line 156
    .line 157
    return-wide p0

    .line 158
    :catch_0
    move-exception p0

    .line 159
    new-instance p1, Ljava/io/IOException;

    .line 160
    .line 161
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 162
    .line 163
    .line 164
    throw p1

    .line 165
    :cond_9
    const-string p0, "closed"

    .line 166
    .line 167
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    return-wide v0
.end method

.method public final close()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lge0;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lge0;->k:Ljava/util/zip/Inflater;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/zip/Inflater;->end()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lge0;->m:Z

    .line 13
    .line 14
    iget-object p0, p0, Lge0;->j:Lsx0;

    .line 15
    .line 16
    invoke-virtual {p0}, Lsx0;->close()V

    .line 17
    .line 18
    .line 19
    return-void
.end method
