.class public final Law;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lkw0;
.implements Ljw0;


# instance fields
.field public final synthetic j:I

.field public final k:Ljava/lang/Object;

.field public final l:Ljava/lang/Object;

.field public final m:Ljava/lang/Object;

.field public final n:Ljava/lang/Object;

.field public final o:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    .line 56
    iput p6, p0, Law;->j:I

    iput-object p1, p0, Law;->k:Ljava/lang/Object;

    iput-object p2, p0, Law;->l:Ljava/lang/Object;

    iput-object p3, p0, Law;->m:Ljava/lang/Object;

    iput-object p4, p0, Law;->n:Ljava/lang/Object;

    iput-object p5, p0, Law;->o:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Law;->j:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Law;->k:Ljava/lang/Object;

    .line 11
    .line 12
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    iput-object p2, p0, Law;->l:Ljava/lang/Object;

    .line 16
    .line 17
    iput-object p3, p0, Law;->m:Ljava/lang/Object;

    .line 18
    .line 19
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iput-object p4, p0, Law;->n:Ljava/lang/Object;

    .line 23
    .line 24
    new-instance p4, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {p4, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const-string p1, "-"

    .line 30
    .line 31
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Law;->o:Ljava/lang/Object;

    .line 48
    .line 49
    return-void
.end method

.method public constructor <init>(Lkw0;Lkw0;Lc9;Lkw0;Lkw0;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Law;->j:I

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Law;->k:Ljava/lang/Object;

    .line 52
    iput-object p2, p0, Law;->l:Ljava/lang/Object;

    .line 53
    iput-object p3, p0, Law;->o:Ljava/lang/Object;

    .line 54
    iput-object p4, p0, Law;->m:Ljava/lang/Object;

    .line 55
    iput-object p5, p0, Law;->n:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public a(Lje;Lyd1;)V
    .locals 10

    .line 1
    iget-object v0, p0, Law;->o:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lxd1;

    .line 4
    .line 5
    iget-object v1, p0, Law;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Lqf;

    .line 8
    .line 9
    iget-object v2, p0, Law;->l:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v2, Ljava/lang/String;

    .line 12
    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    iget-object v3, p0, Law;->n:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v3, Lnd1;

    .line 18
    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Law;->m:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast p0, La10;

    .line 24
    .line 25
    iget-object v5, v0, Lxd1;->c:Lzv;

    .line 26
    .line 27
    iget-object v4, p1, Lje;->b:Lav0;

    .line 28
    .line 29
    invoke-virtual {v1, v4}, Lqf;->b(Lav0;)Lqf;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    new-instance v1, Lke;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance v4, Ljava/util/HashMap;

    .line 39
    .line 40
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v4, v1, Lke;->h:Ljava/lang/Object;

    .line 44
    .line 45
    iget-object v4, v0, Lxd1;->a:Lok;

    .line 46
    .line 47
    invoke-interface {v4}, Lok;->c()J

    .line 48
    .line 49
    .line 50
    move-result-wide v7

    .line 51
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    iput-object v4, v1, Lke;->f:Ljava/lang/Object;

    .line 56
    .line 57
    iget-object v0, v0, Lxd1;->b:Lok;

    .line 58
    .line 59
    invoke-interface {v0}, Lok;->c()J

    .line 60
    .line 61
    .line 62
    move-result-wide v7

    .line 63
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, v1, Lke;->g:Ljava/lang/Object;

    .line 68
    .line 69
    iput-object v2, v1, Lke;->a:Ljava/lang/Object;

    .line 70
    .line 71
    new-instance v0, Lx00;

    .line 72
    .line 73
    iget-object p1, p1, Lje;->a:Ljava/lang/Object;

    .line 74
    .line 75
    invoke-interface {v3, p1}, Lnd1;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    check-cast p1, [B

    .line 80
    .line 81
    invoke-direct {v0, p0, p1}, Lx00;-><init>(La10;[B)V

    .line 82
    .line 83
    .line 84
    iput-object v0, v1, Lke;->e:Ljava/lang/Object;

    .line 85
    .line 86
    const/4 p0, 0x0

    .line 87
    iput-object p0, v1, Lke;->c:Ljava/io/Serializable;

    .line 88
    .line 89
    invoke-virtual {v1}, Lke;->b()Lle;

    .line 90
    .line 91
    .line 92
    move-result-object v8

    .line 93
    iget-object p0, v5, Lzv;->b:Ljava/util/concurrent/Executor;

    .line 94
    .line 95
    new-instance v4, Lxv;

    .line 96
    .line 97
    const/4 v9, 0x0

    .line 98
    move-object v7, p2

    .line 99
    invoke-direct/range {v4 .. v9}, Lxv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 100
    .line 101
    .line 102
    invoke-interface {p0, v4}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_0
    const-string p0, "Null transformer"

    .line 107
    .line 108
    invoke-static {p0}, Lwd1;->d(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_1
    const-string p0, "Null transportName"

    .line 113
    .line 114
    invoke-static {p0}, Lwd1;->d(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public get()Ljava/lang/Object;
    .locals 11

    .line 1
    iget v0, p0, Law;->j:I

    .line 2
    .line 3
    iget-object v1, p0, Law;->o:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object v2, p0, Law;->n:Ljava/lang/Object;

    .line 6
    .line 7
    iget-object v3, p0, Law;->m:Ljava/lang/Object;

    .line 8
    .line 9
    iget-object v4, p0, Law;->l:Ljava/lang/Object;

    .line 10
    .line 11
    iget-object p0, p0, Law;->k:Ljava/lang/Object;

    .line 12
    .line 13
    packed-switch v0, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    :pswitch_0
    check-cast p0, Lbv1;

    .line 17
    .line 18
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 19
    .line 20
    move-object v6, p0

    .line 21
    check-cast v6, Lu30;

    .line 22
    .line 23
    check-cast v4, Ljw0;

    .line 24
    .line 25
    invoke-interface {v4}, Lkw0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    move-object v7, p0

    .line 30
    check-cast v7, Lh40;

    .line 31
    .line 32
    check-cast v3, Ljw0;

    .line 33
    .line 34
    invoke-interface {v3}, Lkw0;->get()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    move-object v8, p0

    .line 39
    check-cast v8, Ll51;

    .line 40
    .line 41
    check-cast v2, Ljw0;

    .line 42
    .line 43
    invoke-interface {v2}, Lkw0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    move-object v9, p0

    .line 48
    check-cast v9, Lf10;

    .line 49
    .line 50
    check-cast v1, Ljw0;

    .line 51
    .line 52
    invoke-interface {v1}, Lkw0;->get()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    move-object v10, p0

    .line 57
    check-cast v10, Lsq;

    .line 58
    .line 59
    new-instance v5, Ld51;

    .line 60
    .line 61
    invoke-direct/range {v5 .. v10}, Ld51;-><init>(Lu30;Lh40;Ll51;Lf10;Lsq;)V

    .line 62
    .line 63
    .line 64
    return-object v5

    .line 65
    :pswitch_1
    check-cast p0, Ljw0;

    .line 66
    .line 67
    invoke-interface {p0}, Lkw0;->get()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    move-object v6, p0

    .line 72
    check-cast v6, Lkc1;

    .line 73
    .line 74
    check-cast v4, Ljw0;

    .line 75
    .line 76
    invoke-interface {v4}, Lkw0;->get()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    move-object v7, p0

    .line 81
    check-cast v7, Lh40;

    .line 82
    .line 83
    check-cast v3, Ljw0;

    .line 84
    .line 85
    invoke-interface {v3}, Lkw0;->get()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    move-object v8, p0

    .line 90
    check-cast v8, Lv9;

    .line 91
    .line 92
    check-cast v2, Ljw0;

    .line 93
    .line 94
    invoke-interface {v2}, Lkw0;->get()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    move-object v9, p0

    .line 99
    check-cast v9, Le01;

    .line 100
    .line 101
    check-cast v1, Ljw0;

    .line 102
    .line 103
    invoke-interface {v1}, Lkw0;->get()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    move-object v10, p0

    .line 108
    check-cast v10, Lm61;

    .line 109
    .line 110
    new-instance v5, Lc01;

    .line 111
    .line 112
    invoke-direct/range {v5 .. v10}, Lc01;-><init>(Lkc1;Lh40;Lv9;Le01;Lm61;)V

    .line 113
    .line 114
    .line 115
    return-object v5

    .line 116
    :pswitch_2
    check-cast p0, Lkw0;

    .line 117
    .line 118
    invoke-interface {p0}, Lkw0;->get()Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    move-object v6, p0

    .line 123
    check-cast v6, Ljava/util/concurrent/Executor;

    .line 124
    .line 125
    check-cast v4, Lkw0;

    .line 126
    .line 127
    invoke-interface {v4}, Lkw0;->get()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    move-object v7, p0

    .line 132
    check-cast v7, Lyn0;

    .line 133
    .line 134
    check-cast v1, Lc9;

    .line 135
    .line 136
    invoke-virtual {v1}, Lc9;->get()Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    move-object v8, p0

    .line 141
    check-cast v8, Lc9;

    .line 142
    .line 143
    check-cast v3, Lkw0;

    .line 144
    .line 145
    invoke-interface {v3}, Lkw0;->get()Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    move-object v9, p0

    .line 150
    check-cast v9, Lh21;

    .line 151
    .line 152
    check-cast v2, Lkw0;

    .line 153
    .line 154
    invoke-interface {v2}, Lkw0;->get()Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    move-object v10, p0

    .line 159
    check-cast v10, Lh21;

    .line 160
    .line 161
    new-instance v5, Lzv;

    .line 162
    .line 163
    invoke-direct/range {v5 .. v10}, Lzv;-><init>(Ljava/util/concurrent/Executor;Lyn0;Lc9;Lh21;Lh21;)V

    .line 164
    .line 165
    .line 166
    return-object v5

    .line 167
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 1
    iget v0, p0, Law;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :pswitch_0
    iget-object v0, p0, Law;->n:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ljava/util/List;

    .line 14
    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    new-instance v2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v3, "FontRequest {mProviderAuthority: "

    .line 20
    .line 21
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v3, p0, Law;->k:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v3, Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v3, ", mProviderPackage: "

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object v3, p0, Law;->l:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v3, Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v3, ", mQuery: "

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Law;->m:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast p0, Ljava/lang/String;

    .line 51
    .line 52
    const-string v3, ", mCertificates:"

    .line 53
    .line 54
    invoke-static {v2, p0, v3}, Loq;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    const/4 p0, 0x0

    .line 62
    move v2, p0

    .line 63
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-ge v2, v3, :cond_1

    .line 68
    .line 69
    const-string v3, " ["

    .line 70
    .line 71
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    check-cast v3, Ljava/util/List;

    .line 79
    .line 80
    move v4, p0

    .line 81
    :goto_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    if-ge v4, v5, :cond_0

    .line 86
    .line 87
    const-string v5, " \""

    .line 88
    .line 89
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    check-cast v5, [B

    .line 97
    .line 98
    invoke-static {v5, p0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v5, "\""

    .line 106
    .line 107
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    add-int/lit8 v4, v4, 0x1

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_0
    const-string v3, " ]"

    .line 114
    .line 115
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    add-int/lit8 v2, v2, 0x1

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_1
    const-string p0, "}mCertificatesArray: 0"

    .line 122
    .line 123
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    return-object p0

    .line 131
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
