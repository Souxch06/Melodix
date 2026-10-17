.class public final Lnt;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lsa1;


# instance fields
.field public final synthetic j:I

.field public k:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>()V
    .locals 1

    .line 36
    const/4 v0, 0x0

    iput v0, p0, Lnt;->j:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/app/Service;)V
    .locals 1

    const/4 v0, 0x4

    iput v0, p0, Lnt;->j:I

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    .line 35
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    iput-object p1, p0, Lnt;->k:Landroid/content/Context;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    const/4 v0, 0x5

    .line 2
    iput v0, p0, Lnt;->j:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v0

    .line 18
    :goto_0
    const-string v2, "Context cannot be null"

    .line 19
    .line 20
    new-array v0, v0, [Ljava/lang/Object;

    .line 21
    .line 22
    invoke-static {v1, v2, v0}, Lrs0;->r(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lnt;->k:Landroid/content/Context;

    .line 30
    .line 31
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;I)V
    .locals 0

    .line 32
    iput p2, p0, Lnt;->j:I

    iput-object p1, p0, Lnt;->k:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()Lot;
    .locals 14

    .line 1
    iget-object p0, p0, Lnt;->k:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lot;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    sget-object v1, Lju1;->l:Lmz;

    .line 11
    .line 12
    invoke-static {v1}, Lly;->a(Lkw0;)Lkw0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, v0, Lot;->j:Lkw0;

    .line 17
    .line 18
    new-instance v1, Lpa0;

    .line 19
    .line 20
    const/16 v2, 0xf

    .line 21
    .line 22
    invoke-direct {v1, v2, p0}, Lpa0;-><init>(ILjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, v0, Lot;->k:Lpa0;

    .line 26
    .line 27
    new-instance p0, Lpa0;

    .line 28
    .line 29
    const/16 v2, 0xd

    .line 30
    .line 31
    invoke-direct {p0, v2, v1}, Lpa0;-><init>(ILjava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    new-instance v2, Lxn0;

    .line 35
    .line 36
    const/4 v3, 0x1

    .line 37
    invoke-direct {v2, v1, v3, p0}, Lxn0;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v2}, Lly;->a(Lkw0;)Lkw0;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iput-object p0, v0, Lot;->l:Lkw0;

    .line 45
    .line 46
    iget-object p0, v0, Lot;->k:Lpa0;

    .line 47
    .line 48
    new-instance v1, Lpa0;

    .line 49
    .line 50
    const/16 v2, 0x17

    .line 51
    .line 52
    invoke-direct {v1, v2, p0}, Lpa0;-><init>(ILjava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    iput-object v1, v0, Lot;->m:Lpa0;

    .line 56
    .line 57
    new-instance v1, Lbv1;

    .line 58
    .line 59
    const/16 v3, 0x14

    .line 60
    .line 61
    invoke-direct {v1, v3, p0}, Lbv1;-><init>(ILjava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v1}, Lly;->a(Lkw0;)Lkw0;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    iget-object v1, v0, Lot;->m:Lpa0;

    .line 69
    .line 70
    new-instance v4, Lxn0;

    .line 71
    .line 72
    const/16 v5, 0xc

    .line 73
    .line 74
    invoke-direct {v4, v1, v5, p0}, Lxn0;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v4}, Lly;->a(Lkw0;)Lkw0;

    .line 78
    .line 79
    .line 80
    move-result-object v8

    .line 81
    iput-object v8, v0, Lot;->n:Lkw0;

    .line 82
    .line 83
    new-instance p0, Lmz;

    .line 84
    .line 85
    const/16 v1, 0x15

    .line 86
    .line 87
    invoke-direct {p0, v1}, Lmz;-><init>(I)V

    .line 88
    .line 89
    .line 90
    iget-object v1, v0, Lot;->k:Lpa0;

    .line 91
    .line 92
    new-instance v9, Lc9;

    .line 93
    .line 94
    invoke-direct {v9, v1, v8, p0, v3}, Lc9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 95
    .line 96
    .line 97
    iget-object v7, v0, Lot;->j:Lkw0;

    .line 98
    .line 99
    move-object v10, v8

    .line 100
    iget-object v8, v0, Lot;->l:Lkw0;

    .line 101
    .line 102
    new-instance v6, Law;

    .line 103
    .line 104
    move-object v11, v10

    .line 105
    invoke-direct/range {v6 .. v11}, Law;-><init>(Lkw0;Lkw0;Lc9;Lkw0;Lkw0;)V

    .line 106
    .line 107
    .line 108
    move-object p0, v6

    .line 109
    new-instance v6, Lgd1;

    .line 110
    .line 111
    move-object v12, v10

    .line 112
    move-object v13, v10

    .line 113
    move-object v10, v9

    .line 114
    move-object v9, v11

    .line 115
    move-object v11, v7

    .line 116
    move-object v7, v1

    .line 117
    invoke-direct/range {v6 .. v13}, Lgd1;-><init>(Lkw0;Lkw0;Lkw0;Lc9;Lkw0;Lkw0;Lkw0;)V

    .line 118
    .line 119
    .line 120
    move-object v1, v10

    .line 121
    move-object v10, v9

    .line 122
    move-object v9, v1

    .line 123
    move-object v1, v6

    .line 124
    move-object v7, v11

    .line 125
    new-instance v6, Ler0;

    .line 126
    .line 127
    const/16 v11, 0x10

    .line 128
    .line 129
    move-object v8, v10

    .line 130
    invoke-direct/range {v6 .. v11}, Ler0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 131
    .line 132
    .line 133
    new-instance v3, Lc9;

    .line 134
    .line 135
    invoke-direct {v3, p0, v1, v6, v2}, Lc9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 136
    .line 137
    .line 138
    invoke-static {v3}, Lly;->a(Lkw0;)Lkw0;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    iput-object p0, v0, Lot;->o:Lkw0;

    .line 143
    .line 144
    return-object v0

    .line 145
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 146
    .line 147
    const-class v0, Landroid/content/Context;

    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    new-instance v1, Ljava/lang/StringBuilder;

    .line 154
    .line 155
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string v0, " must be set"

    .line 162
    .line 163
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    throw p0
.end method

.method public get()Ljava/lang/Object;
    .locals 9

    .line 1
    iget v0, p0, Lnt;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    sget-object v0, Lp52;->a:Ljava/lang/Object;

    .line 7
    .line 8
    iget-object p0, p0, Lnt;->k:Landroid/content/Context;

    .line 9
    .line 10
    invoke-static {p0}, Lcg1;->D(Landroid/content/Context;)Lhs0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :pswitch_0
    sget-object v0, Le52;->j:Ljava/lang/Object;

    .line 16
    .line 17
    new-instance v0, Lv62;

    .line 18
    .line 19
    iget-object p0, p0, Lnt;->k:Landroid/content/Context;

    .line 20
    .line 21
    new-instance v1, Lu32;

    .line 22
    .line 23
    sget-object v2, Lt5;->a:Ls5;

    .line 24
    .line 25
    sget-object v3, Lta0;->c:Lta0;

    .line 26
    .line 27
    sget-object v4, Le32;->a:Ls7;

    .line 28
    .line 29
    invoke-direct {v1, p0, v4, v2, v3}, Lua0;-><init>(Landroid/content/Context;Ls7;Lt5;Lta0;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {v0, v1}, Lv62;-><init>(Lu32;)V

    .line 33
    .line 34
    .line 35
    return-object v0

    .line 36
    :pswitch_1
    sget-object v0, Le52;->j:Ljava/lang/Object;

    .line 37
    .line 38
    new-instance v0, Li7;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lnt;->k:Landroid/content/Context;

    .line 44
    .line 45
    iput-object p0, v0, Li7;->j:Ljava/lang/Object;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    iget-object p0, v0, Li7;->k:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast p0, Lsa1;

    .line 53
    .line 54
    if-nez p0, :cond_0

    .line 55
    .line 56
    sget-object p0, Le52;->m:Lsa1;

    .line 57
    .line 58
    iput-object p0, v0, Li7;->k:Ljava/lang/Object;

    .line 59
    .line 60
    :cond_0
    iget-object p0, v0, Li7;->l:Ljava/lang/Object;

    .line 61
    .line 62
    check-cast p0, Lsa1;

    .line 63
    .line 64
    const/4 v1, 0x2

    .line 65
    if-nez p0, :cond_1

    .line 66
    .line 67
    iget-object p0, v0, Li7;->j:Ljava/lang/Object;

    .line 68
    .line 69
    check-cast p0, Landroid/content/Context;

    .line 70
    .line 71
    new-instance v2, Lnt;

    .line 72
    .line 73
    invoke-direct {v2, p0, v1}, Lnt;-><init>(Landroid/content/Context;I)V

    .line 74
    .line 75
    .line 76
    invoke-static {v2}, Lkn1;->h(Lsa1;)Lsa1;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    iput-object p0, v0, Li7;->l:Ljava/lang/Object;

    .line 81
    .line 82
    :cond_1
    iget-object p0, v0, Li7;->m:Ljava/lang/Object;

    .line 83
    .line 84
    check-cast p0, Lmd1;

    .line 85
    .line 86
    if-nez p0, :cond_2

    .line 87
    .line 88
    new-instance p0, Lmd1;

    .line 89
    .line 90
    const/16 v2, 0xd

    .line 91
    .line 92
    invoke-direct {p0, v2, v0}, Lmd1;-><init>(ILjava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    iput-object p0, v0, Li7;->m:Ljava/lang/Object;

    .line 96
    .line 97
    :cond_2
    iget-object p0, v0, Li7;->n:Ljava/lang/Object;

    .line 98
    .line 99
    check-cast p0, Lsa1;

    .line 100
    .line 101
    if-nez p0, :cond_3

    .line 102
    .line 103
    iget-object p0, v0, Li7;->j:Ljava/lang/Object;

    .line 104
    .line 105
    check-cast p0, Landroid/content/Context;

    .line 106
    .line 107
    new-instance v2, Ljava/util/ArrayList;

    .line 108
    .line 109
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 110
    .line 111
    .line 112
    new-instance v3, Lnt;

    .line 113
    .line 114
    invoke-direct {v3, p0}, Lnt;-><init>(Landroid/content/Context;)V

    .line 115
    .line 116
    .line 117
    new-instance p0, Loc2;

    .line 118
    .line 119
    invoke-direct {p0, v3}, Loc2;-><init>(Lnt;)V

    .line 120
    .line 121
    .line 122
    new-instance v3, Lrc2;

    .line 123
    .line 124
    new-instance v4, Ljava/util/concurrent/ConcurrentHashMap;

    .line 125
    .line 126
    invoke-direct {v4}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 130
    .line 131
    .line 132
    new-array v1, v1, [Lzc2;

    .line 133
    .line 134
    const/4 v4, 0x0

    .line 135
    aput-object p0, v1, v4

    .line 136
    .line 137
    const/4 p0, 0x1

    .line 138
    aput-object v3, v1, p0

    .line 139
    .line 140
    invoke-static {v2, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    new-instance p0, Lrb0;

    .line 144
    .line 145
    invoke-direct {p0, v2}, Lrb0;-><init>(Ljava/util/ArrayList;)V

    .line 146
    .line 147
    .line 148
    invoke-static {p0}, Lkn1;->h(Lsa1;)Lsa1;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    iput-object p0, v0, Li7;->n:Ljava/lang/Object;

    .line 153
    .line 154
    :cond_3
    iget-object p0, v0, Li7;->o:Ljava/lang/Object;

    .line 155
    .line 156
    check-cast p0, Lny0;

    .line 157
    .line 158
    if-nez p0, :cond_4

    .line 159
    .line 160
    new-instance p0, Lny0;

    .line 161
    .line 162
    const/16 v1, 0x19

    .line 163
    .line 164
    invoke-direct {p0, v1, v0}, Lny0;-><init>(ILjava/lang/Object;)V

    .line 165
    .line 166
    .line 167
    iput-object p0, v0, Li7;->o:Ljava/lang/Object;

    .line 168
    .line 169
    :cond_4
    new-instance v2, Le52;

    .line 170
    .line 171
    iget-object p0, v0, Li7;->j:Ljava/lang/Object;

    .line 172
    .line 173
    move-object v3, p0

    .line 174
    check-cast v3, Landroid/content/Context;

    .line 175
    .line 176
    iget-object p0, v0, Li7;->k:Ljava/lang/Object;

    .line 177
    .line 178
    move-object v4, p0

    .line 179
    check-cast v4, Lsa1;

    .line 180
    .line 181
    iget-object p0, v0, Li7;->l:Ljava/lang/Object;

    .line 182
    .line 183
    move-object v5, p0

    .line 184
    check-cast v5, Lsa1;

    .line 185
    .line 186
    iget-object p0, v0, Li7;->m:Ljava/lang/Object;

    .line 187
    .line 188
    move-object v6, p0

    .line 189
    check-cast v6, Lmd1;

    .line 190
    .line 191
    iget-object p0, v0, Li7;->n:Ljava/lang/Object;

    .line 192
    .line 193
    move-object v7, p0

    .line 194
    check-cast v7, Lsa1;

    .line 195
    .line 196
    iget-object p0, v0, Li7;->o:Ljava/lang/Object;

    .line 197
    .line 198
    move-object v8, p0

    .line 199
    check-cast v8, Lny0;

    .line 200
    .line 201
    invoke-direct/range {v2 .. v8}, Le52;-><init>(Landroid/content/Context;Lsa1;Lsa1;Lsa1;Lsa1;Lsa1;)V

    .line 202
    .line 203
    .line 204
    return-object v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
