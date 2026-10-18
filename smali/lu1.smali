.class public final Llu1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljava/lang/String;

.field public final synthetic k:J

.field public final synthetic l:Lfw1;


# direct methods
.method public constructor <init>(Lfw1;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Llu1;->j:Ljava/lang/String;

    .line 5
    .line 6
    iput-wide p3, p0, Llu1;->k:J

    .line 7
    .line 8
    iput-object p1, p0, Llu1;->l:Lfw1;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    .line 1
    iget-object v0, p0, Llu1;->l:Lfw1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lgx1;->l()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Llu1;->j:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v1}, Lbh;->e(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v2, v0, Lfw1;->l:Lda;

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-virtual {v2, v1, v3}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    check-cast v4, Ljava/lang/Integer;

    .line 19
    .line 20
    iget-object v5, v0, Let;->j:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v5, Ly02;

    .line 23
    .line 24
    if-eqz v4, :cond_4

    .line 25
    .line 26
    iget-object v6, v5, Ly02;->u:Lz52;

    .line 27
    .line 28
    iget-object v5, v5, Ly02;->o:Lzy1;

    .line 29
    .line 30
    invoke-static {v6}, Ly02;->k(Lay1;)V

    .line 31
    .line 32
    .line 33
    const/4 v7, 0x0

    .line 34
    invoke-virtual {v6, v7}, Lz52;->p(Z)Lm52;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    add-int/lit8 v4, v4, -0x1

    .line 43
    .line 44
    if-nez v4, :cond_3

    .line 45
    .line 46
    invoke-virtual {v2, v1}, Lu71;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    iget-object v4, v0, Lfw1;->k:Lda;

    .line 50
    .line 51
    invoke-virtual {v4, v1, v3}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    check-cast v3, Ljava/lang/Long;

    .line 56
    .line 57
    iget-wide v7, p0, Llu1;->k:J

    .line 58
    .line 59
    if-nez v3, :cond_0

    .line 60
    .line 61
    invoke-static {v5}, Ly02;->l(Lm22;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, v5, Lzy1;->o:Lso;

    .line 65
    .line 66
    const-string v1, "First ad unit exposure time was never set"

    .line 67
    .line 68
    invoke-virtual {p0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 73
    .line 74
    .line 75
    move-result-wide v9

    .line 76
    sub-long v9, v7, v9

    .line 77
    .line 78
    invoke-virtual {v4, v1}, Lu71;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1, v9, v10, v6}, Lfw1;->q(Ljava/lang/String;JLm52;)V

    .line 82
    .line 83
    .line 84
    :goto_0
    invoke-virtual {v2}, Lu71;->isEmpty()Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    if-eqz p0, :cond_2

    .line 89
    .line 90
    iget-wide v1, v0, Lfw1;->m:J

    .line 91
    .line 92
    const-wide/16 v3, 0x0

    .line 93
    .line 94
    cmp-long p0, v1, v3

    .line 95
    .line 96
    if-nez p0, :cond_1

    .line 97
    .line 98
    invoke-static {v5}, Ly02;->l(Lm22;)V

    .line 99
    .line 100
    .line 101
    iget-object p0, v5, Lzy1;->o:Lso;

    .line 102
    .line 103
    const-string v0, "First ad exposure time was never set"

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Lso;->b(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_1
    sub-long/2addr v7, v1

    .line 110
    invoke-virtual {v0, v7, v8, v6}, Lfw1;->p(JLm52;)V

    .line 111
    .line 112
    .line 113
    iput-wide v3, v0, Lfw1;->m:J

    .line 114
    .line 115
    :cond_2
    return-void

    .line 116
    :cond_3
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {v2, v1, p0}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_4
    iget-object p0, v5, Ly02;->o:Lzy1;

    .line 125
    .line 126
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 130
    .line 131
    const-string v0, "Call to endAdUnitExposure for unknown ad unit id"

    .line 132
    .line 133
    invoke-virtual {p0, v1, v0}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    return-void
.end method
