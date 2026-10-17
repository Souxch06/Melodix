.class public final Lvc0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lp81;


# instance fields
.field public final j:Llh;

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I


# direct methods
.method public constructor <init>(Llh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lvc0;->j:Llh;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final b()Lnc1;
    .locals 0

    .line 1
    iget-object p0, p0, Lvc0;->j:Llh;

    .line 2
    .line 3
    invoke-interface {p0}, Lp81;->b()Lnc1;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final c(JLeh;)J
    .locals 6

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :goto_0
    iget p1, p0, Lvc0;->n:I

    .line 5
    .line 6
    iget-object p2, p0, Lvc0;->j:Llh;

    .line 7
    .line 8
    const-wide/16 v0, -0x1

    .line 9
    .line 10
    if-nez p1, :cond_4

    .line 11
    .line 12
    iget p1, p0, Lvc0;->o:I

    .line 13
    .line 14
    int-to-long v2, p1

    .line 15
    invoke-interface {p2, v2, v3}, Llh;->skip(J)V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput p1, p0, Lvc0;->o:I

    .line 20
    .line 21
    iget p1, p0, Lvc0;->l:I

    .line 22
    .line 23
    and-int/lit8 p1, p1, 0x4

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    iget p1, p0, Lvc0;->m:I

    .line 29
    .line 30
    invoke-static {p2}, Ljg1;->m(Llh;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, Lvc0;->n:I

    .line 35
    .line 36
    iput v0, p0, Lvc0;->k:I

    .line 37
    .line 38
    invoke-interface {p2}, Llh;->readByte()B

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    and-int/lit16 v0, v0, 0xff

    .line 43
    .line 44
    invoke-interface {p2}, Llh;->readByte()B

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    and-int/lit16 v1, v1, 0xff

    .line 49
    .line 50
    iput v1, p0, Lvc0;->l:I

    .line 51
    .line 52
    sget-object v1, Lwc0;->m:Ljava/util/logging/Logger;

    .line 53
    .line 54
    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-eqz v2, :cond_1

    .line 61
    .line 62
    sget-object v2, Lkc0;->a:Lth;

    .line 63
    .line 64
    iget v2, p0, Lvc0;->m:I

    .line 65
    .line 66
    iget v3, p0, Lvc0;->k:I

    .line 67
    .line 68
    iget v4, p0, Lvc0;->l:I

    .line 69
    .line 70
    const/4 v5, 0x1

    .line 71
    invoke-static {v5, v2, v3, v0, v4}, Lkc0;->a(ZIIII)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    invoke-interface {p2}, Llh;->readInt()I

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    const v1, 0x7fffffff

    .line 83
    .line 84
    .line 85
    and-int/2addr p2, v1

    .line 86
    iput p2, p0, Lvc0;->m:I

    .line 87
    .line 88
    const/16 v1, 0x9

    .line 89
    .line 90
    if-ne v0, v1, :cond_3

    .line 91
    .line 92
    if-ne p2, p1, :cond_2

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    const-string p0, "TYPE_CONTINUATION streamId changed"

    .line 96
    .line 97
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    const-wide/16 p0, 0x0

    .line 101
    .line 102
    return-wide p0

    .line 103
    :cond_3
    new-instance p0, Ljava/io/IOException;

    .line 104
    .line 105
    new-instance p1, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string p2, " != TYPE_CONTINUATION"

    .line 114
    .line 115
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    throw p0

    .line 126
    :cond_4
    int-to-long v2, p1

    .line 127
    const-wide/16 v4, 0x2000

    .line 128
    .line 129
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 130
    .line 131
    .line 132
    move-result-wide v2

    .line 133
    invoke-interface {p2, v2, v3, p3}, Lp81;->c(JLeh;)J

    .line 134
    .line 135
    .line 136
    move-result-wide p1

    .line 137
    cmp-long p3, p1, v0

    .line 138
    .line 139
    if-nez p3, :cond_5

    .line 140
    .line 141
    :goto_1
    return-wide v0

    .line 142
    :cond_5
    iget p3, p0, Lvc0;->n:I

    .line 143
    .line 144
    long-to-int v0, p1

    .line 145
    sub-int/2addr p3, v0

    .line 146
    iput p3, p0, Lvc0;->n:I

    .line 147
    .line 148
    return-wide p1
.end method

.method public final close()V
    .locals 0

    .line 1
    return-void
.end method
