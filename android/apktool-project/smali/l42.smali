.class public final synthetic Ll42;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lf52;
.implements Lcz1;


# static fields
.field public static n:Ljava/lang/Boolean;


# instance fields
.field public final synthetic j:I

.field public final k:Ljava/lang/Object;

.field public final l:Ljava/lang/Object;

.field public final m:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x2

    iput v0, p0, Ll42;->j:I

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Ll42;->k:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 69
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 70
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Ll42;->l:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 71
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 72
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Ll42;->m:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lc52;Ljava/util/concurrent/atomic/AtomicReference;Lt92;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Ll42;->j:I

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll42;->k:Ljava/lang/Object;

    iput-object p2, p0, Ll42;->l:Ljava/lang/Object;

    iput-object p3, p0, Ll42;->m:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Le52;Ljava/lang/String;)V
    .locals 2

    .line 1
    const/4 v0, 0x5

    .line 2
    iput v0, p0, Ll42;->j:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll42;->k:Ljava/lang/Object;

    .line 8
    .line 9
    iput-object p2, p0, Ll42;->m:Ljava/lang/Object;

    .line 10
    .line 11
    iget-object p1, p1, Le52;->b:Landroid/content/Context;

    .line 12
    .line 13
    sget-object v0, Lqc2;->a:Ljava/util/regex/Pattern;

    .line 14
    .line 15
    new-instance v0, Li7;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Li7;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    const-string p1, "phenotype"

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Li7;->t(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    add-int/lit8 p1, p1, 0x4

    .line 36
    .line 37
    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 38
    .line 39
    .line 40
    const-string p1, "/"

    .line 41
    .line 42
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p1, ".pb"

    .line 49
    .line 50
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {v0, p1}, Li7;->u(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Li7;->v()Landroid/net/Uri;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p0, Ll42;->l:Ljava/lang/Object;

    .line 65
    .line 66
    return-void
.end method

.method public synthetic constructor <init>(Lsa2;Ljava/lang/String;Ljava/lang/Object;I)V
    .locals 0

    .line 67
    iput p4, p0, Ll42;->j:I

    iput-object p2, p0, Ll42;->k:Ljava/lang/Object;

    iput-object p3, p0, Ll42;->l:Ljava/lang/Object;

    iput-object p1, p0, Ll42;->m:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lxo1;Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x1

    iput v0, p0, Ll42;->j:I

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    sget-object v0, Lfg;->c:Leg;

    .line 75
    iput-object v0, p0, Ll42;->k:Ljava/lang/Object;

    new-instance v0, Lxn0;

    const/16 v1, 0x1c

    invoke-direct {v0, p0, v1, p1}, Lxn0;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 76
    invoke-static {v0}, Lkn1;->h(Lsa1;)Lsa1;

    move-result-object p1

    iput-object p1, p0, Ll42;->l:Ljava/lang/Object;

    new-instance p1, Lxn0;

    const/16 v0, 0x1b

    invoke-direct {p1, p0, v0, p2}, Lxn0;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 77
    invoke-static {p1}, Lkn1;->h(Lsa1;)Lsa1;

    move-result-object p1

    iput-object p1, p0, Ll42;->m:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;ILjava/lang/Throwable;[BLjava/util/Map;)V
    .locals 10

    .line 1
    iget p1, p0, Ll42;->j:I

    .line 2
    .line 3
    iget-object v0, p0, Ll42;->k:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object v1, p0, Ll42;->m:Ljava/lang/Object;

    .line 6
    .line 7
    iget-object p0, p0, Ll42;->l:Ljava/lang/Object;

    .line 8
    .line 9
    packed-switch p1, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    check-cast p0, Lua2;

    .line 13
    .line 14
    iget-wide p0, p0, Lua2;->a:J

    .line 15
    .line 16
    check-cast v1, Lsa2;

    .line 17
    .line 18
    check-cast v0, Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v1}, Lsa2;->c()Ls02;

    .line 21
    .line 22
    .line 23
    move-result-object p5

    .line 24
    invoke-virtual {p5}, Ls02;->l()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Lsa2;->l0()V

    .line 28
    .line 29
    .line 30
    const/4 p5, 0x0

    .line 31
    if-nez p4, :cond_0

    .line 32
    .line 33
    :try_start_0
    new-array p4, p5, [B

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    move-object p0, v0

    .line 38
    goto/16 :goto_2

    .line 39
    .line 40
    :cond_0
    :goto_0
    const/16 v2, 0xc8

    .line 41
    .line 42
    if-eq p2, v2, :cond_1

    .line 43
    .line 44
    const/16 v2, 0xcc

    .line 45
    .line 46
    if-ne p2, v2, :cond_3

    .line 47
    .line 48
    move p2, v2

    .line 49
    :cond_1
    if-nez p3, :cond_3

    .line 50
    .line 51
    iget-object p3, v1, Lsa2;->l:Ldu1;

    .line 52
    .line 53
    invoke-static {p3}, Lsa2;->T(Laa2;)V

    .line 54
    .line 55
    .line 56
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p3, p0}, Ldu1;->s(Ljava/lang/Long;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Lsa2;->b()Lzy1;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    iget-object p0, p0, Lzy1;->w:Lso;

    .line 68
    .line 69
    const-string p1, "Successfully uploaded batch from upload queue. appId, status"

    .line 70
    .line 71
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-virtual {p0, p1, v0, p2}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    iget-object p0, v1, Lsa2;->k:Lhz1;

    .line 79
    .line 80
    invoke-static {p0}, Lsa2;->T(Laa2;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Lhz1;->p()Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-eqz p0, :cond_2

    .line 88
    .line 89
    iget-object p0, v1, Lsa2;->l:Ldu1;

    .line 90
    .line 91
    invoke-static {p0}, Lsa2;->T(Laa2;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, v0}, Ldu1;->r(Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    if-eqz p0, :cond_2

    .line 99
    .line 100
    invoke-virtual {v1, v0}, Lsa2;->t(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_2
    invoke-virtual {v1}, Lsa2;->N()V

    .line 105
    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_3
    new-instance v2, Ljava/lang/String;

    .line 109
    .line 110
    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 111
    .line 112
    invoke-direct {v2, p4, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 116
    .line 117
    .line 118
    move-result p4

    .line 119
    const/16 v3, 0x20

    .line 120
    .line 121
    invoke-static {v3, p4}, Ljava/lang/Math;->min(II)I

    .line 122
    .line 123
    .line 124
    move-result p4

    .line 125
    invoke-virtual {v2, p5, p4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p4

    .line 129
    invoke-virtual {v1}, Lsa2;->b()Lzy1;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    iget-object v2, v2, Lzy1;->t:Lso;

    .line 134
    .line 135
    const-string v3, "Network upload failed. Will retry later. appId, status, error"

    .line 136
    .line 137
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    if-nez p3, :cond_4

    .line 142
    .line 143
    move-object p3, p4

    .line 144
    :cond_4
    invoke-virtual {v2, v3, v0, p2, p3}, Lso;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 145
    .line 146
    .line 147
    iget-object p2, v1, Lsa2;->l:Ldu1;

    .line 148
    .line 149
    invoke-static {p2}, Lsa2;->T(Laa2;)V

    .line 150
    .line 151
    .line 152
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p2, p0}, Ldu1;->x(Ljava/lang/Long;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v1}, Lsa2;->N()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 160
    .line 161
    .line 162
    :goto_1
    iput-boolean p5, v1, Lsa2;->D:Z

    .line 163
    .line 164
    invoke-virtual {v1}, Lsa2;->O()V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :goto_2
    iput-boolean p5, v1, Lsa2;->D:Z

    .line 169
    .line 170
    invoke-virtual {v1}, Lsa2;->O()V

    .line 171
    .line 172
    .line 173
    throw p0

    .line 174
    :pswitch_0
    move-object v2, v1

    .line 175
    check-cast v2, Lsa2;

    .line 176
    .line 177
    move-object v7, v0

    .line 178
    check-cast v7, Ljava/lang/String;

    .line 179
    .line 180
    move-object v8, p0

    .line 181
    check-cast v8, Ljava/util/ArrayList;

    .line 182
    .line 183
    const/4 v3, 0x1

    .line 184
    move v4, p2

    .line 185
    move-object v5, p3

    .line 186
    move-object v6, p4

    .line 187
    move-object v9, p5

    .line 188
    invoke-virtual/range {v2 .. v9}, Lsa2;->z(ZILjava/lang/Throwable;[BLjava/lang/String;Ljava/util/List;Ljava/util/Map;)V

    .line 189
    .line 190
    .line 191
    return-void

    .line 192
    nop

    .line 193
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
    .end packed-switch
.end method

.method public b(ILjava/lang/Throwable;[B)V
    .locals 7

    .line 1
    iget-object p3, p0, Ll42;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p3, Lc52;

    .line 4
    .line 5
    invoke-virtual {p3}, Lgx1;->l()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll42;->m:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Lt92;

    .line 11
    .line 12
    const/16 v1, 0xc8

    .line 13
    .line 14
    if-eq p1, v1, :cond_0

    .line 15
    .line 16
    const/16 v1, 0xcc

    .line 17
    .line 18
    if-eq p1, v1, :cond_0

    .line 19
    .line 20
    const/16 v1, 0x130

    .line 21
    .line 22
    if-ne p1, v1, :cond_1

    .line 23
    .line 24
    move p1, v1

    .line 25
    :cond_0
    if-nez p2, :cond_1

    .line 26
    .line 27
    iget-object p1, p3, Let;->j:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p1, Ly02;

    .line 30
    .line 31
    iget-object p1, p1, Ly02;->o:Lzy1;

    .line 32
    .line 33
    invoke-static {p1}, Ly02;->l(Lm22;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p1, Lzy1;->w:Lso;

    .line 37
    .line 38
    iget-wide v1, v0, Lt92;->j:J

    .line 39
    .line 40
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    const-string v1, "[sgtm] Upload succeeded for row_id"

    .line 45
    .line 46
    invoke-virtual {p1, p2, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sget-object p1, Lk52;->l:Lk52;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    iget-object v1, p3, Let;->j:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v1, Ly02;

    .line 55
    .line 56
    iget-object v1, v1, Ly02;->o:Lzy1;

    .line 57
    .line 58
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 59
    .line 60
    .line 61
    iget-object v1, v1, Lzy1;->r:Lso;

    .line 62
    .line 63
    iget-wide v2, v0, Lt92;->j:J

    .line 64
    .line 65
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    const-string v4, "[sgtm] Upload failed for row_id. response, exception"

    .line 74
    .line 75
    invoke-virtual {v1, v4, v2, v3, p2}, Lso;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    sget-object p2, Lxx1;->u:Lwx1;

    .line 79
    .line 80
    const/4 v1, 0x0

    .line 81
    invoke-virtual {p2, v1}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    check-cast p2, Ljava/lang/String;

    .line 86
    .line 87
    const-string v1, ","

    .line 88
    .line 89
    invoke-virtual {p2, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-interface {p2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_2

    .line 106
    .line 107
    sget-object p1, Lk52;->n:Lk52;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_2
    sget-object p1, Lk52;->m:Lk52;

    .line 111
    .line 112
    :goto_0
    iget-object p0, p0, Ll42;->l:Ljava/lang/Object;

    .line 113
    .line 114
    check-cast p0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 115
    .line 116
    iget-object p2, p3, Let;->j:Ljava/lang/Object;

    .line 117
    .line 118
    check-cast p2, Ly02;

    .line 119
    .line 120
    invoke-virtual {p2}, Ly02;->n()Li82;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    new-instance v1, Ljq1;

    .line 125
    .line 126
    iget-wide v2, v0, Lt92;->j:J

    .line 127
    .line 128
    iget v4, p1, Lk52;->j:I

    .line 129
    .line 130
    iget-wide v5, v0, Lt92;->o:J

    .line 131
    .line 132
    invoke-direct/range {v1 .. v6}, Ljq1;-><init>(JIJ)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p2}, Lgx1;->l()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p2}, Lay1;->m()V

    .line 139
    .line 140
    .line 141
    const/4 v0, 0x1

    .line 142
    invoke-virtual {p2, v0}, Li82;->B(Z)Lbc2;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    new-instance v4, Lf82;

    .line 147
    .line 148
    invoke-direct {v4, p2, v0, v1}, Lf82;-><init>(Li82;Lbc2;Ljq1;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p2, v4}, Li82;->z(Ljava/lang/Runnable;)V

    .line 152
    .line 153
    .line 154
    iget-object p2, p3, Let;->j:Ljava/lang/Object;

    .line 155
    .line 156
    check-cast p2, Ly02;

    .line 157
    .line 158
    iget-object p2, p2, Ly02;->o:Lzy1;

    .line 159
    .line 160
    invoke-static {p2}, Ly02;->l(Lm22;)V

    .line 161
    .line 162
    .line 163
    iget-object p2, p2, Lzy1;->w:Lso;

    .line 164
    .line 165
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 166
    .line 167
    .line 168
    move-result-object p3

    .line 169
    const-string v0, "[sgtm] Updated status for row_id"

    .line 170
    .line 171
    invoke-virtual {p2, v0, p3, p1}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    monitor-enter p0

    .line 175
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 179
    .line 180
    .line 181
    monitor-exit p0

    .line 182
    return-void

    .line 183
    :catchall_0
    move-exception v0

    .line 184
    move-object p1, v0

    .line 185
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 186
    throw p1
.end method

.method public c()Lai;
    .locals 15

    .line 1
    iget-object v0, p0, Ll42;->m:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p0, Ll42;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Le52;

    .line 8
    .line 9
    iget-object v2, v1, Le52;->f:Lsa1;

    .line 10
    .line 11
    iget-object v3, v1, Le52;->b:Landroid/content/Context;

    .line 12
    .line 13
    invoke-static {v3}, Lk42;->t(Landroid/content/Context;)Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const/4 v4, 0x3

    .line 18
    if-nez v3, :cond_0

    .line 19
    .line 20
    invoke-static {}, Lyb2;->y()Lyb2;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Ltw0;

    .line 25
    .line 26
    const/16 v1, 0x11

    .line 27
    .line 28
    invoke-direct {v0, v4, v1, v4}, Ltw0;-><init>(III)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Lai;

    .line 32
    .line 33
    invoke-direct {v1, p0, v0}, Lai;-><init>(Lyb2;Ltw0;)V

    .line 34
    .line 35
    .line 36
    return-object v1

    .line 37
    :cond_0
    sget-object v3, Ll42;->n:Ljava/lang/Boolean;

    .line 38
    .line 39
    const/4 v5, 0x0

    .line 40
    if-nez v3, :cond_2

    .line 41
    .line 42
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 43
    .line 44
    const/16 v6, 0x1c

    .line 45
    .line 46
    if-lt v3, v6, :cond_1

    .line 47
    .line 48
    invoke-static {}, Ld1;->w()Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    sput-object v3, Ll42;->n:Ljava/lang/Boolean;

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    :try_start_0
    const-class v3, Landroid/os/Process;

    .line 60
    .line 61
    const-string v6, "isIsolated"

    .line 62
    .line 63
    invoke-virtual {v3, v6, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    invoke-virtual {v6, v3, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    check-cast v3, Ljava/lang/Boolean;

    .line 75
    .line 76
    sput-object v3, Ll42;->n:Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :catch_0
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 80
    .line 81
    sput-object v3, Ll42;->n:Ljava/lang/Boolean;

    .line 82
    .line 83
    :cond_2
    :goto_0
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-nez v3, :cond_11

    .line 88
    .line 89
    iget-object v3, v1, Le52;->g:Lec2;

    .line 90
    .line 91
    invoke-virtual {v3}, Lec2;->b()Lwb2;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    iget-object v6, v3, Lwb2;->c:Lxo1;

    .line 96
    .line 97
    sget-object v7, Lmo1;->n:Lmo1;

    .line 98
    .line 99
    sget-object v8, Lz42;->a:Lda;

    .line 100
    .line 101
    const-string v8, "#"

    .line 102
    .line 103
    invoke-virtual {v0, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    move-result v8

    .line 107
    const/4 v9, 0x0

    .line 108
    if-gez v8, :cond_4

    .line 109
    .line 110
    const-string v8, "@"

    .line 111
    .line 112
    invoke-virtual {v0, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 113
    .line 114
    .line 115
    move-result v8

    .line 116
    if-nez v8, :cond_3

    .line 117
    .line 118
    move-object v8, v0

    .line 119
    goto :goto_1

    .line 120
    :cond_3
    const-string p0, "Invalid package name: "

    .line 121
    .line 122
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    return-object v5

    .line 130
    :cond_4
    invoke-virtual {v0, v9, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v8

    .line 134
    :goto_1
    iget-boolean v10, v3, Lwb2;->h:Z

    .line 135
    .line 136
    const/4 v11, 0x4

    .line 137
    const/4 v12, 0x5

    .line 138
    if-eqz v10, :cond_9

    .line 139
    .line 140
    iget-boolean v10, v3, Lwb2;->a:Z

    .line 141
    .line 142
    if-eqz v10, :cond_8

    .line 143
    .line 144
    iget-object v10, v3, Lwb2;->b:Ljava/util/List;

    .line 145
    .line 146
    invoke-interface {v10, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v7

    .line 150
    if-eqz v7, :cond_8

    .line 151
    .line 152
    invoke-virtual {v6}, Lxo1;->c()I

    .line 153
    .line 154
    .line 155
    move-result v7

    .line 156
    if-eqz v7, :cond_7

    .line 157
    .line 158
    iget-object v7, v3, Lwb2;->f:Ljava/util/List;

    .line 159
    .line 160
    invoke-interface {v7}, Ljava/util/Collection;->isEmpty()Z

    .line 161
    .line 162
    .line 163
    move-result v10

    .line 164
    if-nez v10, :cond_5

    .line 165
    .line 166
    invoke-interface {v7, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result v7

    .line 170
    if-nez v7, :cond_5

    .line 171
    .line 172
    move v7, v12

    .line 173
    goto :goto_2

    .line 174
    :cond_5
    iget-object v7, v3, Lwb2;->g:Ljava/util/List;

    .line 175
    .line 176
    invoke-interface {v7, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result v7

    .line 180
    if-eqz v7, :cond_6

    .line 181
    .line 182
    const/4 v7, 0x6

    .line 183
    goto :goto_2

    .line 184
    :cond_6
    move v7, v9

    .line 185
    goto :goto_2

    .line 186
    :cond_7
    move v7, v11

    .line 187
    goto :goto_2

    .line 188
    :cond_8
    move v7, v4

    .line 189
    goto :goto_2

    .line 190
    :cond_9
    const/16 v7, 0xe

    .line 191
    .line 192
    :goto_2
    const/4 v8, 0x7

    .line 193
    if-eqz v7, :cond_a

    .line 194
    .line 195
    new-instance v3, Ltw0;

    .line 196
    .line 197
    invoke-direct {v3, v7}, Ltw0;-><init>(I)V

    .line 198
    .line 199
    .line 200
    new-instance v6, Lv82;

    .line 201
    .line 202
    invoke-direct {v6, v5, v3}, Lv82;-><init>(Lw72;Ltw0;)V

    .line 203
    .line 204
    .line 205
    goto/16 :goto_7

    .line 206
    .line 207
    :cond_a
    :try_start_1
    iget-object v7, v3, Lwb2;->e:Ljava/lang/String;

    .line 208
    .line 209
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    .line 210
    .line 211
    .line 212
    move-result v10

    .line 213
    if-eqz v10, :cond_c

    .line 214
    .line 215
    iget-object v7, v1, Le52;->h:Lsa1;

    .line 216
    .line 217
    invoke-interface {v7}, Lsa1;->get()Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v7

    .line 221
    check-cast v7, Lhs0;

    .line 222
    .line 223
    invoke-virtual {v7}, Lhs0;->b()Z

    .line 224
    .line 225
    .line 226
    move-result v10

    .line 227
    if-nez v10, :cond_b

    .line 228
    .line 229
    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 230
    .line 231
    invoke-virtual {v1}, Le52;->a()Lho0;

    .line 232
    .line 233
    .line 234
    move-result-object v6

    .line 235
    const-string v7, "Unable to get GMS application info, using defaults."

    .line 236
    .line 237
    new-array v9, v9, [Ljava/lang/Object;

    .line 238
    .line 239
    invoke-static {v3, v6, v5, v7, v9}, Lbv;->r(Ljava/util/logging/Level;Ljava/util/concurrent/Executor;Ljava/lang/Exception;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 240
    .line 241
    .line 242
    sget-object v3, Lw72;->c:Lw72;

    .line 243
    .line 244
    new-instance v6, Ltw0;

    .line 245
    .line 246
    invoke-direct {v6, v4, v8, v4}, Ltw0;-><init>(III)V

    .line 247
    .line 248
    .line 249
    new-instance v7, Lv82;

    .line 250
    .line 251
    invoke-direct {v7, v3, v6}, Lv82;-><init>(Lw72;Ltw0;)V

    .line 252
    .line 253
    .line 254
    :goto_3
    move-object v6, v7

    .line 255
    goto/16 :goto_7

    .line 256
    .line 257
    :catch_1
    move-exception v3

    .line 258
    goto/16 :goto_6

    .line 259
    .line 260
    :cond_b
    invoke-virtual {v7}, Lhs0;->a()Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object v7

    .line 264
    check-cast v7, Landroid/content/pm/ApplicationInfo;

    .line 265
    .line 266
    iget-object v7, v7, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    .line 267
    .line 268
    :cond_c
    sget-object v9, Ljava/io/File;->separator:Ljava/lang/String;

    .line 269
    .line 270
    iget-object v10, v3, Lwb2;->d:Ljava/lang/String;

    .line 271
    .line 272
    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v13

    .line 276
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    .line 277
    .line 278
    .line 279
    move-result v13

    .line 280
    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v14

    .line 284
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    .line 285
    .line 286
    .line 287
    move-result v14

    .line 288
    add-int/2addr v13, v14

    .line 289
    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object v14

    .line 293
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    .line 294
    .line 295
    .line 296
    move-result v14

    .line 297
    add-int/2addr v13, v14

    .line 298
    new-instance v14, Ljava/lang/StringBuilder;

    .line 299
    .line 300
    invoke-direct {v14, v13}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v7

    .line 316
    new-instance v10, Ll42;

    .line 317
    .line 318
    invoke-direct {v10, v6, v0}, Ll42;-><init>(Lxo1;Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    new-instance v6, Landroid/net/Uri$Builder;

    .line 322
    .line 323
    invoke-direct {v6}, Landroid/net/Uri$Builder;-><init>()V

    .line 324
    .line 325
    .line 326
    const-string v13, "file"

    .line 327
    .line 328
    invoke-virtual {v6, v13}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 329
    .line 330
    .line 331
    move-result-object v6

    .line 332
    invoke-virtual {v10}, Ll42;->d()Ljava/io/File;

    .line 333
    .line 334
    .line 335
    move-result-object v10

    .line 336
    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object v10

    .line 340
    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object v13

    .line 344
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    .line 345
    .line 346
    .line 347
    move-result v13

    .line 348
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 349
    .line 350
    .line 351
    move-result v14

    .line 352
    add-int/2addr v13, v14

    .line 353
    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v14

    .line 357
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    .line 358
    .line 359
    .line 360
    move-result v14

    .line 361
    add-int/2addr v13, v14

    .line 362
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 363
    .line 364
    .line 365
    move-result v14

    .line 366
    add-int/2addr v13, v14

    .line 367
    new-instance v14, Ljava/lang/StringBuilder;

    .line 368
    .line 369
    invoke-direct {v14, v13}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 370
    .line 371
    .line 372
    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 373
    .line 374
    .line 375
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 379
    .line 380
    .line 381
    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object v7

    .line 388
    invoke-virtual {v6, v7}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 389
    .line 390
    .line 391
    move-result-object v6

    .line 392
    invoke-virtual {v6}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 393
    .line 394
    .line 395
    move-result-object v6

    .line 396
    invoke-static {}, Landroid/os/StrictMode;->getThreadPolicy()Landroid/os/StrictMode$ThreadPolicy;

    .line 397
    .line 398
    .line 399
    move-result-object v7

    .line 400
    new-instance v9, Landroid/os/StrictMode$ThreadPolicy$Builder;

    .line 401
    .line 402
    invoke-direct {v9, v7}, Landroid/os/StrictMode$ThreadPolicy$Builder;-><init>(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 403
    .line 404
    .line 405
    invoke-virtual {v9}, Landroid/os/StrictMode$ThreadPolicy$Builder;->permitDiskReads()Landroid/os/StrictMode$ThreadPolicy$Builder;

    .line 406
    .line 407
    .line 408
    move-result-object v9

    .line 409
    invoke-virtual {v9}, Landroid/os/StrictMode$ThreadPolicy$Builder;->build()Landroid/os/StrictMode$ThreadPolicy;

    .line 410
    .line 411
    .line 412
    move-result-object v9

    .line 413
    invoke-static {v9}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 414
    .line 415
    .line 416
    :try_start_2
    invoke-interface {v2}, Lsa1;->get()Ljava/lang/Object;

    .line 417
    .line 418
    .line 419
    move-result-object v9

    .line 420
    check-cast v9, Lmc2;

    .line 421
    .line 422
    new-instance v10, Ls72;

    .line 423
    .line 424
    iget-object v3, v3, Lwb2;->k:Lz72;

    .line 425
    .line 426
    invoke-virtual {v3}, Lz72;->r()Z

    .line 427
    .line 428
    .line 429
    move-result v3

    .line 430
    invoke-direct {v10}, Ljava/lang/Object;-><init>()V

    .line 431
    .line 432
    .line 433
    iput-boolean v3, v10, Ls72;->a:Z

    .line 434
    .line 435
    invoke-virtual {v9, v6, v10}, Lmc2;->a(Landroid/net/Uri;Llc2;)Ljava/lang/Object;

    .line 436
    .line 437
    .line 438
    move-result-object v3

    .line 439
    check-cast v3, Lw72;

    .line 440
    .line 441
    new-instance v6, Ltw0;

    .line 442
    .line 443
    const/4 v9, 0x2

    .line 444
    invoke-direct {v6, v12, v9, v4}, Ltw0;-><init>(III)V

    .line 445
    .line 446
    .line 447
    new-instance v9, Lv82;

    .line 448
    .line 449
    invoke-direct {v9, v3, v6}, Lv82;-><init>(Lw72;Ltw0;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Laq1; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 450
    .line 451
    .line 452
    :try_start_3
    invoke-static {v7}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 453
    .line 454
    .line 455
    move-object v6, v9

    .line 456
    goto :goto_7

    .line 457
    :catchall_0
    move-exception v3

    .line 458
    goto :goto_5

    .line 459
    :catch_2
    move-exception v3

    .line 460
    :try_start_4
    sget-object v6, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    .line 461
    .line 462
    invoke-virtual {v1}, Le52;->a()Lho0;

    .line 463
    .line 464
    .line 465
    move-result-object v9

    .line 466
    const-string v10, "Failed to parse snapshot from shared storage for %s"

    .line 467
    .line 468
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 469
    .line 470
    .line 471
    move-result-object v12

    .line 472
    invoke-static {v6, v9, v3, v10, v12}, Lbv;->r(Ljava/util/logging/Level;Ljava/util/concurrent/Executor;Ljava/lang/Exception;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 473
    .line 474
    .line 475
    new-instance v3, Ltw0;

    .line 476
    .line 477
    const/16 v6, 0x9

    .line 478
    .line 479
    invoke-direct {v3, v6}, Ltw0;-><init>(I)V

    .line 480
    .line 481
    .line 482
    new-instance v6, Lv82;

    .line 483
    .line 484
    invoke-direct {v6, v5, v3}, Lv82;-><init>(Lw72;Ltw0;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 485
    .line 486
    .line 487
    :goto_4
    :try_start_5
    invoke-static {v7}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 488
    .line 489
    .line 490
    goto :goto_7

    .line 491
    :catch_3
    :try_start_6
    sget-object v3, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    .line 492
    .line 493
    invoke-virtual {v1}, Le52;->a()Lho0;

    .line 494
    .line 495
    .line 496
    move-result-object v6

    .line 497
    const-string v9, "Shared storage file not found for %s"

    .line 498
    .line 499
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 500
    .line 501
    .line 502
    move-result-object v10

    .line 503
    invoke-static {v3, v6, v5, v9, v10}, Lbv;->r(Ljava/util/logging/Level;Ljava/util/concurrent/Executor;Ljava/lang/Exception;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 504
    .line 505
    .line 506
    new-instance v3, Ltw0;

    .line 507
    .line 508
    const/16 v6, 0x8

    .line 509
    .line 510
    invoke-direct {v3, v6}, Ltw0;-><init>(I)V

    .line 511
    .line 512
    .line 513
    new-instance v6, Lv82;

    .line 514
    .line 515
    invoke-direct {v6, v5, v3}, Lv82;-><init>(Lw72;Ltw0;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 516
    .line 517
    .line 518
    goto :goto_4

    .line 519
    :goto_5
    :try_start_7
    invoke-static {v7}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 520
    .line 521
    .line 522
    throw v3
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    .line 523
    :goto_6
    sget-object v6, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 524
    .line 525
    invoke-virtual {v1}, Le52;->a()Lho0;

    .line 526
    .line 527
    .line 528
    move-result-object v7

    .line 529
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 530
    .line 531
    .line 532
    move-result-object v9

    .line 533
    const-string v10, "Failed to read shared file for %s"

    .line 534
    .line 535
    invoke-static {v6, v7, v3, v10, v9}, Lbv;->r(Ljava/util/logging/Level;Ljava/util/concurrent/Executor;Ljava/lang/Exception;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 536
    .line 537
    .line 538
    sget-object v3, Lw72;->c:Lw72;

    .line 539
    .line 540
    new-instance v6, Ltw0;

    .line 541
    .line 542
    const/16 v7, 0xa

    .line 543
    .line 544
    invoke-direct {v6, v4, v7, v4}, Ltw0;-><init>(III)V

    .line 545
    .line 546
    .line 547
    new-instance v7, Lv82;

    .line 548
    .line 549
    invoke-direct {v7, v3, v6}, Lv82;-><init>(Lw72;Ltw0;)V

    .line 550
    .line 551
    .line 552
    goto/16 :goto_3

    .line 553
    .line 554
    :goto_7
    iget-object v3, v6, Lv82;->b:Ltw0;

    .line 555
    .line 556
    iget-object v6, v6, Lv82;->a:Lw72;

    .line 557
    .line 558
    if-eqz v6, :cond_d

    .line 559
    .line 560
    new-instance p0, Lai;

    .line 561
    .line 562
    invoke-direct {p0, v6, v3}, Lai;-><init>(Lw72;Ltw0;)V

    .line 563
    .line 564
    .line 565
    return-object p0

    .line 566
    :cond_d
    iget v3, v3, Ltw0;->c:I

    .line 567
    .line 568
    :try_start_8
    invoke-interface {v2}, Lsa1;->get()Ljava/lang/Object;

    .line 569
    .line 570
    .line 571
    move-result-object v2

    .line 572
    check-cast v2, Lmc2;

    .line 573
    .line 574
    iget-object v6, p0, Ll42;->l:Ljava/lang/Object;

    .line 575
    .line 576
    check-cast v6, Landroid/net/Uri;

    .line 577
    .line 578
    invoke-static {}, Lyb2;->y()Lyb2;

    .line 579
    .line 580
    .line 581
    move-result-object v7

    .line 582
    invoke-virtual {v7, v8}, Lnp1;->q(I)Ljava/lang/Object;

    .line 583
    .line 584
    .line 585
    move-result-object v7

    .line 586
    check-cast v7, Lqq1;

    .line 587
    .line 588
    sget-object v8, Lgp1;->a:Lgp1;

    .line 589
    .line 590
    sget v8, Lso1;->a:I

    .line 591
    .line 592
    sget-object v8, Lgp1;->b:Lgp1;

    .line 593
    .line 594
    invoke-virtual {v2, v6}, Lmc2;->b(Landroid/net/Uri;)Lkc2;

    .line 595
    .line 596
    .line 597
    move-result-object v2

    .line 598
    invoke-static {v2}, Lfe1;->K(Lkc2;)Ljava/io/InputStream;

    .line 599
    .line 600
    .line 601
    move-result-object v2
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_4

    .line 602
    :try_start_9
    check-cast v7, Lmp1;

    .line 603
    .line 604
    invoke-virtual {v7, v2, v8}, Lmp1;->a(Ljava/io/InputStream;Lgp1;)Lnp1;

    .line 605
    .line 606
    .line 607
    move-result-object v6
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 608
    if-eqz v2, :cond_e

    .line 609
    .line 610
    :try_start_a
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 611
    .line 612
    .line 613
    :cond_e
    check-cast v6, Lyb2;

    .line 614
    .line 615
    new-instance v2, Ltw0;

    .line 616
    .line 617
    invoke-direct {v2, v11, v3, v4}, Ltw0;-><init>(III)V

    .line 618
    .line 619
    .line 620
    new-instance v3, Lai;

    .line 621
    .line 622
    invoke-direct {v3, v6, v2}, Lai;-><init>(Lyb2;Ltw0;)V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_a} :catch_4

    .line 623
    .line 624
    .line 625
    goto :goto_9

    .line 626
    :catchall_1
    move-exception v3

    .line 627
    if-eqz v2, :cond_f

    .line 628
    .line 629
    :try_start_b
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 630
    .line 631
    .line 632
    goto :goto_8

    .line 633
    :catchall_2
    move-exception v2

    .line 634
    :try_start_c
    invoke-virtual {v3, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 635
    .line 636
    .line 637
    :cond_f
    :goto_8
    throw v3
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_c} :catch_4

    .line 638
    :catch_4
    sget-object v2, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    .line 639
    .line 640
    invoke-virtual {v1}, Le52;->a()Lho0;

    .line 641
    .line 642
    .line 643
    move-result-object v1

    .line 644
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 645
    .line 646
    .line 647
    move-result-object v0

    .line 648
    const-string v3, "Unable to retrieve flag snapshot for %s, using defaults."

    .line 649
    .line 650
    invoke-static {v2, v1, v5, v3, v0}, Lbv;->r(Ljava/util/logging/Level;Ljava/util/concurrent/Executor;Ljava/lang/Exception;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 651
    .line 652
    .line 653
    invoke-virtual {p0}, Ll42;->f()Z

    .line 654
    .line 655
    .line 656
    move-result p0

    .line 657
    if-eqz p0, :cond_10

    .line 658
    .line 659
    sget-object p0, Lw72;->c:Lw72;

    .line 660
    .line 661
    new-instance v0, Ltw0;

    .line 662
    .line 663
    const/16 v1, 0x10

    .line 664
    .line 665
    invoke-direct {v0, v4, v1, v4}, Ltw0;-><init>(III)V

    .line 666
    .line 667
    .line 668
    new-instance v3, Lai;

    .line 669
    .line 670
    invoke-direct {v3, p0, v0}, Lai;-><init>(Lw72;Ltw0;)V

    .line 671
    .line 672
    .line 673
    goto :goto_9

    .line 674
    :cond_10
    invoke-static {}, Lyb2;->y()Lyb2;

    .line 675
    .line 676
    .line 677
    move-result-object p0

    .line 678
    new-instance v0, Ltw0;

    .line 679
    .line 680
    const/16 v1, 0xb

    .line 681
    .line 682
    invoke-direct {v0, v4, v1, v4}, Ltw0;-><init>(III)V

    .line 683
    .line 684
    .line 685
    new-instance v3, Lai;

    .line 686
    .line 687
    invoke-direct {v3, p0, v0}, Lai;-><init>(Lyb2;Ltw0;)V

    .line 688
    .line 689
    .line 690
    :goto_9
    return-object v3

    .line 691
    :cond_11
    invoke-static {}, Lyb2;->y()Lyb2;

    .line 692
    .line 693
    .line 694
    move-result-object p0

    .line 695
    new-instance v0, Ltw0;

    .line 696
    .line 697
    const/16 v1, 0x12

    .line 698
    .line 699
    invoke-direct {v0, v4, v1, v4}, Ltw0;-><init>(III)V

    .line 700
    .line 701
    .line 702
    new-instance v1, Lai;

    .line 703
    .line 704
    invoke-direct {v1, p0, v0}, Lai;-><init>(Lyb2;Ltw0;)V

    .line 705
    .line 706
    .line 707
    return-object v1
.end method

.method public d()Ljava/io/File;
    .locals 4

    .line 1
    iget-object v0, p0, Ll42;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lsa1;

    .line 4
    .line 5
    new-instance v1, Ljava/io/File;

    .line 6
    .line 7
    invoke-interface {v0}, Lsa1;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p0, Ll42;->m:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Lsa1;

    .line 16
    .line 17
    invoke-interface {p0}, Lsa1;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    add-int/2addr v2, v3

    .line 42
    new-instance v3, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    add-int/lit8 v2, v2, 0x3

    .line 45
    .line 46
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v0, "/"

    .line 53
    .line 54
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string p0, ".pb"

    .line 61
    .line 62
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-object v1
.end method

.method public e(Lxo1;Ljava/util/Set;Ljava/lang/String;)V
    .locals 9

    .line 1
    invoke-interface {p2}, Ljava/util/Set;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Ll42;->k:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    sget-object v0, Lbv1;->l:Lbv1;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    const-class v0, Lbv1;

    .line 24
    .line 25
    monitor-enter v0

    .line 26
    :try_start_0
    sget-object v3, Lbv1;->l:Lbv1;

    .line 27
    .line 28
    if-nez v3, :cond_0

    .line 29
    .line 30
    new-instance v3, Lbv1;

    .line 31
    .line 32
    invoke-direct {v3, v2}, Lbv1;-><init>(I)V

    .line 33
    .line 34
    .line 35
    sput-object v3, Lbv1;->l:Lbv1;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    :goto_0
    monitor-exit v0

    .line 41
    goto :goto_2

    .line 42
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    throw p0

    .line 44
    :cond_1
    :goto_2
    sget-object v0, Lbv1;->l:Lbv1;

    .line 45
    .line 46
    new-instance v3, Lmv1;

    .line 47
    .line 48
    const/16 v4, 0x1b

    .line 49
    .line 50
    invoke-direct {v3, v4}, Lmv1;-><init>(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, v0, Lbv1;->k:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 56
    .line 57
    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(ILjava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    invoke-virtual {p1}, Lxo1;->p()[B

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iget-object v0, p0, Ll42;->l:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 67
    .line 68
    new-instance v3, Lp92;

    .line 69
    .line 70
    invoke-direct {v3, p1}, Lp92;-><init>([B)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, p3, v3}, Ljava/util/concurrent/ConcurrentHashMap;->compute(Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    :cond_3
    :goto_3
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_b

    .line 85
    .line 86
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Ljava/lang/String;

    .line 91
    .line 92
    iget-object v3, p0, Ll42;->m:Ljava/lang/Object;

    .line 93
    .line 94
    check-cast v3, Ljava/util/concurrent/ConcurrentHashMap;

    .line 95
    .line 96
    new-instance v4, Ljava/util/concurrent/atomic/AtomicReference;

    .line 97
    .line 98
    new-instance v5, Lr92;

    .line 99
    .line 100
    invoke-direct {v5, p3, p1}, Lr92;-><init>(Ljava/lang/String;[B)V

    .line 101
    .line 102
    .line 103
    invoke-direct {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v3, v0, v4}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    check-cast v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 111
    .line 112
    if-eqz v0, :cond_3

    .line 113
    .line 114
    :goto_4
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    instance-of v4, v3, Lr92;

    .line 119
    .line 120
    if-eqz v4, :cond_6

    .line 121
    .line 122
    move-object v4, v3

    .line 123
    check-cast v4, Lr92;

    .line 124
    .line 125
    iget-object v5, v4, Lr92;->j:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {p3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v5

    .line 131
    if-eqz v5, :cond_4

    .line 132
    .line 133
    invoke-virtual {v4, p1}, Lr92;->a([B)V

    .line 134
    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_4
    new-instance v5, Lr92;

    .line 138
    .line 139
    invoke-direct {v5, p3, p1}, Lr92;-><init>(Ljava/lang/String;[B)V

    .line 140
    .line 141
    .line 142
    iget-object v6, v4, Lr92;->j:Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {p3, v6}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    move-result v6

    .line 148
    const/4 v7, 0x2

    .line 149
    if-gez v6, :cond_5

    .line 150
    .line 151
    new-array v6, v7, [Lr92;

    .line 152
    .line 153
    aput-object v5, v6, v2

    .line 154
    .line 155
    aput-object v4, v6, v1

    .line 156
    .line 157
    goto :goto_6

    .line 158
    :cond_5
    new-array v6, v7, [Lr92;

    .line 159
    .line 160
    aput-object v4, v6, v2

    .line 161
    .line 162
    aput-object v5, v6, v1

    .line 163
    .line 164
    goto :goto_6

    .line 165
    :cond_6
    move-object v4, v3

    .line 166
    check-cast v4, [Lr92;

    .line 167
    .line 168
    invoke-static {v4, p3}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;)I

    .line 169
    .line 170
    .line 171
    move-result v5

    .line 172
    if-ltz v5, :cond_7

    .line 173
    .line 174
    aget-object v0, v4, v5

    .line 175
    .line 176
    invoke-virtual {v0, p1}, Lr92;->a([B)V

    .line 177
    .line 178
    .line 179
    goto :goto_3

    .line 180
    :cond_7
    not-int v5, v5

    .line 181
    array-length v6, v4

    .line 182
    add-int/lit8 v7, v6, 0x1

    .line 183
    .line 184
    sub-int/2addr v6, v5

    .line 185
    if-nez v6, :cond_8

    .line 186
    .line 187
    invoke-static {v4, v7}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v4

    .line 191
    check-cast v4, [Lr92;

    .line 192
    .line 193
    move-object v6, v4

    .line 194
    goto :goto_5

    .line 195
    :cond_8
    new-array v7, v7, [Lr92;

    .line 196
    .line 197
    invoke-static {v4, v2, v7, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 198
    .line 199
    .line 200
    add-int/lit8 v8, v5, 0x1

    .line 201
    .line 202
    invoke-static {v4, v5, v7, v8, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 203
    .line 204
    .line 205
    move-object v6, v7

    .line 206
    :goto_5
    new-instance v4, Lr92;

    .line 207
    .line 208
    invoke-direct {v4, p3, p1}, Lr92;-><init>(Ljava/lang/String;[B)V

    .line 209
    .line 210
    .line 211
    aput-object v4, v6, v5

    .line 212
    .line 213
    :cond_9
    :goto_6
    invoke-virtual {v0, v3, v6}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result v4

    .line 217
    if-eqz v4, :cond_a

    .line 218
    .line 219
    goto/16 :goto_3

    .line 220
    .line 221
    :cond_a
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v4

    .line 225
    if-eq v4, v3, :cond_9

    .line 226
    .line 227
    goto :goto_4

    .line 228
    :cond_b
    return-void
.end method

.method public f()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll42;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Le52;

    .line 4
    .line 5
    iget-object p0, p0, Le52;->g:Lec2;

    .line 6
    .line 7
    invoke-virtual {p0}, Lec2;->c()Le82;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Le82;->t()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Le82;->y()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/util/AbstractCollection;

    .line 22
    .line 23
    sget-object v0, Lmo1;->n:Lmo1;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method
