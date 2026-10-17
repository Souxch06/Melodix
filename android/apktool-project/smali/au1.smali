.class public final Lau1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ljava/lang/String;

.field public b:J

.field public final synthetic c:Ldu1;


# direct methods
.method public constructor <init>(Ldu1;Ljava/lang/String;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lau1;->c:Ldu1;

    .line 31
    invoke-static {p2}, Lbh;->e(Ljava/lang/String;)V

    iput-object p2, p0, Lau1;->a:Ljava/lang/String;

    const-wide/16 p1, -0x1

    iput-wide p1, p0, Lau1;->b:J

    return-void
.end method

.method public constructor <init>(Ldu1;Ljava/lang/String;J)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lau1;->c:Ldu1;

    .line 5
    .line 6
    invoke-static {p2}, Lbh;->e(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lau1;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    filled-new-array {p2, p3}, [Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const-string p3, "select rowid from raw_events where app_id = ? and timestamp < ? order by rowid desc limit 1"

    .line 20
    .line 21
    const-wide/16 v0, -0x1

    .line 22
    .line 23
    invoke-virtual {p1, p3, p2, v0, v1}, Ldu1;->I(Ljava/lang/String;[Ljava/lang/String;J)J

    .line 24
    .line 25
    .line 26
    move-result-wide p1

    .line 27
    iput-wide p1, p0, Lau1;->b:J

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public final a()Ljava/util/List;
    .locals 22

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Lau1;->c:Ldu1;

    .line 4
    .line 5
    iget-object v2, v0, Let;->j:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v2, Ly02;

    .line 8
    .line 9
    new-instance v3, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-wide v4, v1, Lau1;->b:J

    .line 15
    .line 16
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    iget-object v5, v1, Lau1;->a:Ljava/lang/String;

    .line 21
    .line 22
    filled-new-array {v5, v4}, [Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v10

    .line 26
    const-string v9, "app_id = ? and rowid > ?"

    .line 27
    .line 28
    const-string v14, "1000"

    .line 29
    .line 30
    const/4 v4, 0x0

    .line 31
    :try_start_0
    invoke-virtual {v0}, Ldu1;->c0()Landroid/database/sqlite/SQLiteDatabase;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    const-string v7, "raw_events"

    .line 36
    .line 37
    const-string v15, "rowid"

    .line 38
    .line 39
    const-string v16, "name"

    .line 40
    .line 41
    const-string v17, "timestamp"

    .line 42
    .line 43
    const-string v18, "metadata_fingerprint"

    .line 44
    .line 45
    const-string v19, "data"

    .line 46
    .line 47
    const-string v20, "realtime"

    .line 48
    .line 49
    const-string v21, "elapsed_time"

    .line 50
    .line 51
    filled-new-array/range {v15 .. v21}, [Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v8

    .line 55
    const-string v13, "rowid"

    .line 56
    .line 57
    const/4 v11, 0x0

    .line 58
    const/4 v12, 0x0

    .line 59
    invoke-virtual/range {v6 .. v14}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_4

    .line 68
    .line 69
    :cond_0
    const/4 v0, 0x0

    .line 70
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 71
    .line 72
    .line 73
    move-result-wide v7

    .line 74
    const/4 v6, 0x3

    .line 75
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getLong(I)J

    .line 76
    .line 77
    .line 78
    move-result-wide v9

    .line 79
    const/4 v6, 0x5

    .line 80
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getLong(I)J

    .line 81
    .line 82
    .line 83
    move-result-wide v11

    .line 84
    const-wide/16 v13, 0x1

    .line 85
    .line 86
    cmp-long v6, v11, v13

    .line 87
    .line 88
    const/4 v11, 0x1

    .line 89
    if-nez v6, :cond_1

    .line 90
    .line 91
    move v0, v11

    .line 92
    :cond_1
    const/4 v6, 0x6

    .line 93
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getLong(I)J

    .line 94
    .line 95
    .line 96
    move-result-wide v12

    .line 97
    const/4 v6, 0x4

    .line 98
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getBlob(I)[B

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    iget-wide v14, v1, Lau1;->b:J

    .line 103
    .line 104
    cmp-long v14, v7, v14

    .line 105
    .line 106
    if-lez v14, :cond_2

    .line 107
    .line 108
    iput-wide v7, v1, Lau1;->b:J
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    .line 110
    :cond_2
    :try_start_1
    invoke-static {}, Lj02;->H()Li02;

    .line 111
    .line 112
    .line 113
    move-result-object v14

    .line 114
    invoke-static {v14, v6}, Lva2;->W(Llp1;[B)Llp1;

    .line 115
    .line 116
    .line 117
    move-result-object v6

    .line 118
    check-cast v6, Li02;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 119
    .line 120
    :try_start_2
    invoke-interface {v4, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v11

    .line 124
    if-nez v11, :cond_3

    .line 125
    .line 126
    const-string v11, ""

    .line 127
    .line 128
    :cond_3
    invoke-virtual {v6, v11}, Li02;->o(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    const/4 v11, 0x2

    .line 132
    invoke-interface {v4, v11}, Landroid/database/Cursor;->getLong(I)J

    .line 133
    .line 134
    .line 135
    move-result-wide v14

    .line 136
    invoke-virtual {v6}, Llp1;->c()V

    .line 137
    .line 138
    .line 139
    iget-object v11, v6, Llp1;->k:Lnp1;

    .line 140
    .line 141
    check-cast v11, Lj02;

    .line 142
    .line 143
    invoke-virtual {v11, v14, v15}, Lj02;->O(J)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v6}, Llp1;->c()V

    .line 147
    .line 148
    .line 149
    iget-object v11, v6, Llp1;->k:Lnp1;

    .line 150
    .line 151
    check-cast v11, Lj02;

    .line 152
    .line 153
    invoke-virtual {v11, v12, v13}, Lj02;->r(J)V

    .line 154
    .line 155
    .line 156
    move-object v11, v6

    .line 157
    new-instance v6, Lyt1;

    .line 158
    .line 159
    invoke-virtual {v11}, Llp1;->e()Lnp1;

    .line 160
    .line 161
    .line 162
    move-result-object v11

    .line 163
    move-object v12, v11

    .line 164
    check-cast v12, Lj02;

    .line 165
    .line 166
    move v11, v0

    .line 167
    invoke-direct/range {v6 .. v12}, Lyt1;-><init>(JJZLj02;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    goto :goto_0

    .line 174
    :catchall_0
    move-exception v0

    .line 175
    goto :goto_3

    .line 176
    :catch_0
    move-exception v0

    .line 177
    goto :goto_1

    .line 178
    :catch_1
    move-exception v0

    .line 179
    iget-object v6, v2, Ly02;->o:Lzy1;

    .line 180
    .line 181
    invoke-static {v6}, Ly02;->l(Lm22;)V

    .line 182
    .line 183
    .line 184
    iget-object v6, v6, Lzy1;->o:Lso;

    .line 185
    .line 186
    const-string v7, "Data loss. Failed to merge raw event. appId"

    .line 187
    .line 188
    invoke-static {v5}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 189
    .line 190
    .line 191
    move-result-object v8

    .line 192
    invoke-virtual {v6, v7, v8, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 193
    .line 194
    .line 195
    :goto_0
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    if-nez v0, :cond_0

    .line 200
    .line 201
    goto :goto_2

    .line 202
    :cond_4
    sget-object v3, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;
    :try_end_2
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 203
    .line 204
    goto :goto_2

    .line 205
    :goto_1
    :try_start_3
    iget-object v1, v2, Ly02;->o:Lzy1;

    .line 206
    .line 207
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 208
    .line 209
    .line 210
    iget-object v1, v1, Lzy1;->o:Lso;

    .line 211
    .line 212
    const-string v2, "Data loss. Error querying raw events batch. appId"

    .line 213
    .line 214
    invoke-static {v5}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 215
    .line 216
    .line 217
    move-result-object v5

    .line 218
    invoke-virtual {v1, v2, v5, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 219
    .line 220
    .line 221
    :goto_2
    if-eqz v4, :cond_5

    .line 222
    .line 223
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 224
    .line 225
    .line 226
    :cond_5
    return-object v3

    .line 227
    :goto_3
    if-eqz v4, :cond_6

    .line 228
    .line 229
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 230
    .line 231
    .line 232
    :cond_6
    throw v0
.end method
