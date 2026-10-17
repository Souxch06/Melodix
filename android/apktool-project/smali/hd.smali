.class public final Lhd;
.super Lts;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:J

.field public final e:Ljava/lang/Long;

.field public final f:Z

.field public final g:Lbs;

.field public final h:Lss;

.field public final i:Lrs;

.field public final j:Lcs;

.field public final k:Ljava/util/List;

.field public final l:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Long;ZLbs;Lss;Lrs;Lcs;Ljava/util/List;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lhd;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lhd;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lhd;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-wide p4, p0, Lhd;->d:J

    .line 11
    .line 12
    iput-object p6, p0, Lhd;->e:Ljava/lang/Long;

    .line 13
    .line 14
    iput-boolean p7, p0, Lhd;->f:Z

    .line 15
    .line 16
    iput-object p8, p0, Lhd;->g:Lbs;

    .line 17
    .line 18
    iput-object p9, p0, Lhd;->h:Lss;

    .line 19
    .line 20
    iput-object p10, p0, Lhd;->i:Lrs;

    .line 21
    .line 22
    iput-object p11, p0, Lhd;->j:Lcs;

    .line 23
    .line 24
    iput-object p12, p0, Lhd;->k:Ljava/util/List;

    .line 25
    .line 26
    iput p13, p0, Lhd;->l:I

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public final a()Lgd;
    .locals 3

    .line 1
    new-instance v0, Lgd;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lhd;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lgd;->a:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lhd;->b:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lgd;->b:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lhd;->c:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lgd;->c:Ljava/lang/String;

    .line 17
    .line 18
    iget-wide v1, p0, Lhd;->d:J

    .line 19
    .line 20
    iput-wide v1, v0, Lgd;->d:J

    .line 21
    .line 22
    iget-object v1, p0, Lhd;->e:Ljava/lang/Long;

    .line 23
    .line 24
    iput-object v1, v0, Lgd;->e:Ljava/lang/Long;

    .line 25
    .line 26
    iget-boolean v1, p0, Lhd;->f:Z

    .line 27
    .line 28
    iput-boolean v1, v0, Lgd;->f:Z

    .line 29
    .line 30
    iget-object v1, p0, Lhd;->g:Lbs;

    .line 31
    .line 32
    iput-object v1, v0, Lgd;->g:Lbs;

    .line 33
    .line 34
    iget-object v1, p0, Lhd;->h:Lss;

    .line 35
    .line 36
    iput-object v1, v0, Lgd;->h:Lss;

    .line 37
    .line 38
    iget-object v1, p0, Lhd;->i:Lrs;

    .line 39
    .line 40
    iput-object v1, v0, Lgd;->i:Lrs;

    .line 41
    .line 42
    iget-object v1, p0, Lhd;->j:Lcs;

    .line 43
    .line 44
    iput-object v1, v0, Lgd;->j:Lcs;

    .line 45
    .line 46
    iget-object v1, p0, Lhd;->k:Ljava/util/List;

    .line 47
    .line 48
    iput-object v1, v0, Lgd;->k:Ljava/util/List;

    .line 49
    .line 50
    iget p0, p0, Lhd;->l:I

    .line 51
    .line 52
    iput p0, v0, Lgd;->l:I

    .line 53
    .line 54
    const/4 p0, 0x7

    .line 55
    iput-byte p0, v0, Lgd;->m:B

    .line 56
    .line 57
    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lts;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_7

    .line 9
    .line 10
    check-cast p1, Lts;

    .line 11
    .line 12
    check-cast p1, Lhd;

    .line 13
    .line 14
    iget-object v1, p1, Lhd;->a:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v3, p0, Lhd;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_7

    .line 23
    .line 24
    iget-object v1, p0, Lhd;->b:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v3, p1, Lhd;->b:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_7

    .line 33
    .line 34
    iget-object v1, p1, Lhd;->c:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v3, p0, Lhd;->c:Ljava/lang/String;

    .line 37
    .line 38
    if-nez v3, :cond_1

    .line 39
    .line 40
    if-nez v1, :cond_7

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_7

    .line 48
    .line 49
    :goto_0
    iget-wide v3, p0, Lhd;->d:J

    .line 50
    .line 51
    iget-wide v5, p1, Lhd;->d:J

    .line 52
    .line 53
    cmp-long v1, v3, v5

    .line 54
    .line 55
    if-nez v1, :cond_7

    .line 56
    .line 57
    iget-object v1, p1, Lhd;->e:Ljava/lang/Long;

    .line 58
    .line 59
    iget-object v3, p0, Lhd;->e:Ljava/lang/Long;

    .line 60
    .line 61
    if-nez v3, :cond_2

    .line 62
    .line 63
    if-nez v1, :cond_7

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    invoke-virtual {v3, v1}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_7

    .line 71
    .line 72
    :goto_1
    iget-boolean v1, p0, Lhd;->f:Z

    .line 73
    .line 74
    iget-boolean v3, p1, Lhd;->f:Z

    .line 75
    .line 76
    if-ne v1, v3, :cond_7

    .line 77
    .line 78
    iget-object v1, p0, Lhd;->g:Lbs;

    .line 79
    .line 80
    iget-object v3, p1, Lhd;->g:Lbs;

    .line 81
    .line 82
    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-eqz v1, :cond_7

    .line 87
    .line 88
    iget-object v1, p1, Lhd;->h:Lss;

    .line 89
    .line 90
    iget-object v3, p0, Lhd;->h:Lss;

    .line 91
    .line 92
    if-nez v3, :cond_3

    .line 93
    .line 94
    if-nez v1, :cond_7

    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_3
    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    :goto_2
    iget-object v1, p1, Lhd;->i:Lrs;

    .line 104
    .line 105
    iget-object v3, p0, Lhd;->i:Lrs;

    .line 106
    .line 107
    if-nez v3, :cond_4

    .line 108
    .line 109
    if-nez v1, :cond_7

    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_4
    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-eqz v1, :cond_7

    .line 117
    .line 118
    :goto_3
    iget-object v1, p1, Lhd;->j:Lcs;

    .line 119
    .line 120
    iget-object v3, p0, Lhd;->j:Lcs;

    .line 121
    .line 122
    if-nez v3, :cond_5

    .line 123
    .line 124
    if-nez v1, :cond_7

    .line 125
    .line 126
    goto :goto_4

    .line 127
    :cond_5
    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    if-eqz v1, :cond_7

    .line 132
    .line 133
    :goto_4
    iget-object v1, p1, Lhd;->k:Ljava/util/List;

    .line 134
    .line 135
    iget-object v3, p0, Lhd;->k:Ljava/util/List;

    .line 136
    .line 137
    if-nez v3, :cond_6

    .line 138
    .line 139
    if-nez v1, :cond_7

    .line 140
    .line 141
    goto :goto_5

    .line 142
    :cond_6
    invoke-interface {v3, v1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    if-eqz v1, :cond_7

    .line 147
    .line 148
    :goto_5
    iget p0, p0, Lhd;->l:I

    .line 149
    .line 150
    iget p1, p1, Lhd;->l:I

    .line 151
    .line 152
    if-ne p0, p1, :cond_7

    .line 153
    .line 154
    return v0

    .line 155
    :cond_7
    return v2
.end method

.method public final hashCode()I
    .locals 8

    .line 1
    iget-object v0, p0, Lhd;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const v1, 0xf4243

    .line 8
    .line 9
    .line 10
    xor-int/2addr v0, v1

    .line 11
    mul-int/2addr v0, v1

    .line 12
    iget-object v2, p0, Lhd;->b:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    xor-int/2addr v0, v2

    .line 19
    mul-int/2addr v0, v1

    .line 20
    const/4 v2, 0x0

    .line 21
    iget-object v3, p0, Lhd;->c:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v3, :cond_0

    .line 24
    .line 25
    move v3, v2

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    :goto_0
    xor-int/2addr v0, v3

    .line 32
    mul-int/2addr v0, v1

    .line 33
    const/16 v3, 0x20

    .line 34
    .line 35
    iget-wide v4, p0, Lhd;->d:J

    .line 36
    .line 37
    ushr-long v6, v4, v3

    .line 38
    .line 39
    xor-long v3, v6, v4

    .line 40
    .line 41
    long-to-int v3, v3

    .line 42
    xor-int/2addr v0, v3

    .line 43
    mul-int/2addr v0, v1

    .line 44
    iget-object v3, p0, Lhd;->e:Ljava/lang/Long;

    .line 45
    .line 46
    if-nez v3, :cond_1

    .line 47
    .line 48
    move v3, v2

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    invoke-virtual {v3}, Ljava/lang/Long;->hashCode()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    :goto_1
    xor-int/2addr v0, v3

    .line 55
    mul-int/2addr v0, v1

    .line 56
    iget-boolean v3, p0, Lhd;->f:Z

    .line 57
    .line 58
    if-eqz v3, :cond_2

    .line 59
    .line 60
    const/16 v3, 0x4cf

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_2
    const/16 v3, 0x4d5

    .line 64
    .line 65
    :goto_2
    xor-int/2addr v0, v3

    .line 66
    mul-int/2addr v0, v1

    .line 67
    iget-object v3, p0, Lhd;->g:Lbs;

    .line 68
    .line 69
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    xor-int/2addr v0, v3

    .line 74
    mul-int/2addr v0, v1

    .line 75
    iget-object v3, p0, Lhd;->h:Lss;

    .line 76
    .line 77
    if-nez v3, :cond_3

    .line 78
    .line 79
    move v3, v2

    .line 80
    goto :goto_3

    .line 81
    :cond_3
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    :goto_3
    xor-int/2addr v0, v3

    .line 86
    mul-int/2addr v0, v1

    .line 87
    iget-object v3, p0, Lhd;->i:Lrs;

    .line 88
    .line 89
    if-nez v3, :cond_4

    .line 90
    .line 91
    move v3, v2

    .line 92
    goto :goto_4

    .line 93
    :cond_4
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    :goto_4
    xor-int/2addr v0, v3

    .line 98
    mul-int/2addr v0, v1

    .line 99
    iget-object v3, p0, Lhd;->j:Lcs;

    .line 100
    .line 101
    if-nez v3, :cond_5

    .line 102
    .line 103
    move v3, v2

    .line 104
    goto :goto_5

    .line 105
    :cond_5
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    :goto_5
    xor-int/2addr v0, v3

    .line 110
    mul-int/2addr v0, v1

    .line 111
    iget-object v3, p0, Lhd;->k:Ljava/util/List;

    .line 112
    .line 113
    if-nez v3, :cond_6

    .line 114
    .line 115
    goto :goto_6

    .line 116
    :cond_6
    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    :goto_6
    xor-int/2addr v0, v2

    .line 121
    mul-int/2addr v0, v1

    .line 122
    iget p0, p0, Lhd;->l:I

    .line 123
    .line 124
    xor-int/2addr p0, v0

    .line 125
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Session{generator="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lhd;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", identifier="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lhd;->b:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", appQualitySessionId="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lhd;->c:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", startedAt="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-wide v1, p0, Lhd;->d:J

    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", endedAt="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lhd;->e:Ljava/lang/Long;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", crashed="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-boolean v1, p0, Lhd;->f:Z

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", app="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lhd;->g:Lbs;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", user="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lhd;->h:Lss;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", os="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lhd;->i:Lrs;

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ", device="

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-object v1, p0, Lhd;->j:Lcs;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, ", events="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Lhd;->k:Ljava/util/List;

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, ", generatorType="

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget p0, p0, Lhd;->l:I

    .line 119
    .line 120
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string p0, "}"

    .line 124
    .line 125
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    return-object p0
.end method
