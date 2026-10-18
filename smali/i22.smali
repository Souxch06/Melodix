.class public final synthetic Li22;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lk22;

.field public final synthetic k:Landroid/os/Bundle;

.field public final synthetic l:Ljava/lang/String;

.field public final synthetic m:Lbc2;


# direct methods
.method public synthetic constructor <init>(Lk22;Landroid/os/Bundle;Ljava/lang/String;Lbc2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Li22;->j:Lk22;

    .line 5
    .line 6
    iput-object p2, p0, Li22;->k:Landroid/os/Bundle;

    .line 7
    .line 8
    iput-object p3, p0, Li22;->l:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Li22;->m:Lbc2;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 15

    .line 1
    iget-object v11, p0, Li22;->k:Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-virtual {v11}, Landroid/os/BaseBundle;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Li22;->j:Lk22;

    .line 8
    .line 9
    iget-object v12, v1, Lk22;->b:Lsa2;

    .line 10
    .line 11
    iget-object v3, p0, Li22;->l:Ljava/lang/String;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, v12, Lsa2;->l:Ldu1;

    .line 16
    .line 17
    invoke-static {p0}, Lsa2;->T(Laa2;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Let;->l()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Laa2;->m()V

    .line 24
    .line 25
    .line 26
    :try_start_0
    invoke-virtual {p0}, Ldu1;->c0()Landroid/database/sqlite/SQLiteDatabase;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "delete from default_event_params where app_id=?"

    .line 31
    .line 32
    filled-new-array {v3}, [Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :catch_0
    move-exception v0

    .line 41
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast p0, Ly02;

    .line 44
    .line 45
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 46
    .line 47
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 51
    .line 52
    const-string v1, "Error clearing default event params"

    .line 53
    .line 54
    invoke-virtual {p0, v0, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    goto/16 :goto_1

    .line 58
    .line 59
    :cond_0
    iget-object v13, v12, Lsa2;->l:Ldu1;

    .line 60
    .line 61
    invoke-static {v13}, Lsa2;->T(Laa2;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, v13, Let;->j:Ljava/lang/Object;

    .line 65
    .line 66
    move-object v14, v0

    .line 67
    check-cast v14, Ly02;

    .line 68
    .line 69
    invoke-virtual {v13}, Let;->l()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v13}, Laa2;->m()V

    .line 73
    .line 74
    .line 75
    iget-object v0, v13, Let;->j:Ljava/lang/Object;

    .line 76
    .line 77
    move-object v1, v0

    .line 78
    check-cast v1, Ly02;

    .line 79
    .line 80
    new-instance v0, Lpu1;

    .line 81
    .line 82
    const-wide/16 v7, 0x0

    .line 83
    .line 84
    const-wide/16 v9, 0x0

    .line 85
    .line 86
    const-string v2, ""

    .line 87
    .line 88
    const-string v4, "dep"

    .line 89
    .line 90
    const-wide/16 v5, 0x0

    .line 91
    .line 92
    invoke-direct/range {v0 .. v11}, Lpu1;-><init>(Ly02;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJJLandroid/os/Bundle;)V

    .line 93
    .line 94
    .line 95
    iget-object v1, v13, Ls92;->k:Lsa2;

    .line 96
    .line 97
    iget-object v1, v1, Lsa2;->p:Lva2;

    .line 98
    .line 99
    invoke-static {v1}, Lsa2;->T(Laa2;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1, v0}, Lva2;->L(Lpu1;)Lj02;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0}, Lqo1;->a()[B

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iget-object v1, v14, Ly02;->o:Lzy1;

    .line 111
    .line 112
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 113
    .line 114
    .line 115
    iget-object v2, v1, Lzy1;->w:Lso;

    .line 116
    .line 117
    array-length v4, v0

    .line 118
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    const-string v5, "Saving default event parameters, appId, data size"

    .line 123
    .line 124
    invoke-virtual {v2, v5, v3, v4}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    new-instance v2, Landroid/content/ContentValues;

    .line 128
    .line 129
    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 130
    .line 131
    .line 132
    const-string v4, "app_id"

    .line 133
    .line 134
    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    const-string v4, "parameters"

    .line 138
    .line 139
    invoke-virtual {v2, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 140
    .line 141
    .line 142
    const/4 v4, 0x0

    .line 143
    :try_start_1
    invoke-virtual {v13}, Ldu1;->c0()Landroid/database/sqlite/SQLiteDatabase;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    const-string v5, "default_event_params"

    .line 148
    .line 149
    const/4 v6, 0x5

    .line 150
    invoke-virtual {v0, v5, v4, v2, v6}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    .line 151
    .line 152
    .line 153
    move-result-wide v5

    .line 154
    const-wide/16 v7, -0x1

    .line 155
    .line 156
    cmp-long v0, v5, v7

    .line 157
    .line 158
    if-nez v0, :cond_1

    .line 159
    .line 160
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 161
    .line 162
    .line 163
    iget-object v0, v1, Lzy1;->o:Lso;

    .line 164
    .line 165
    const-string v2, "Failed to insert default event parameters (got -1). appId"

    .line 166
    .line 167
    invoke-static {v3}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 168
    .line 169
    .line 170
    move-result-object v5

    .line 171
    invoke-virtual {v0, v5, v2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 172
    .line 173
    .line 174
    goto :goto_0

    .line 175
    :catch_1
    move-exception v0

    .line 176
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 177
    .line 178
    .line 179
    iget-object v1, v1, Lzy1;->o:Lso;

    .line 180
    .line 181
    invoke-static {v3}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    const-string v5, "Error storing default event parameters. appId"

    .line 186
    .line 187
    invoke-virtual {v1, v5, v2, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 188
    .line 189
    .line 190
    :cond_1
    :goto_0
    iget-object v1, v12, Lsa2;->l:Ldu1;

    .line 191
    .line 192
    invoke-static {v1}, Lsa2;->T(Laa2;)V

    .line 193
    .line 194
    .line 195
    iget-object p0, p0, Li22;->m:Lbc2;

    .line 196
    .line 197
    iget-wide v5, p0, Lbc2;->M:J

    .line 198
    .line 199
    :try_start_2
    const-string p0, "select count(*) from raw_events where app_id=? and timestamp >= ? and name not like \'!_%\' escape \'!\' limit 1;"

    .line 200
    .line 201
    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    filled-new-array {v3, v0}, [Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    const-wide/16 v7, 0x0

    .line 210
    .line 211
    invoke-virtual {v1, p0, v0, v7, v8}, Ldu1;->I(Ljava/lang/String;[Ljava/lang/String;J)J

    .line 212
    .line 213
    .line 214
    move-result-wide v9

    .line 215
    cmp-long p0, v9, v7

    .line 216
    .line 217
    if-lez p0, :cond_2

    .line 218
    .line 219
    goto :goto_1

    .line 220
    :cond_2
    const-string p0, "select count(*) from raw_events where app_id=? and timestamp >= ? and name like \'!_%\' escape \'!\' limit 1;"

    .line 221
    .line 222
    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    filled-new-array {v3, v0}, [Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    invoke-virtual {v1, p0, v0, v7, v8}, Ldu1;->I(Ljava/lang/String;[Ljava/lang/String;J)J

    .line 231
    .line 232
    .line 233
    move-result-wide v0
    :try_end_2
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_2

    .line 234
    cmp-long p0, v0, v7

    .line 235
    .line 236
    if-lez p0, :cond_3

    .line 237
    .line 238
    iget-object p0, v12, Lsa2;->l:Ldu1;

    .line 239
    .line 240
    invoke-static {p0}, Lsa2;->T(Laa2;)V

    .line 241
    .line 242
    .line 243
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-virtual {p0, v3, v0, v4, v11}, Ldu1;->E(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 248
    .line 249
    .line 250
    goto :goto_1

    .line 251
    :catch_2
    move-exception v0

    .line 252
    move-object p0, v0

    .line 253
    iget-object v0, v1, Let;->j:Ljava/lang/Object;

    .line 254
    .line 255
    check-cast v0, Ly02;

    .line 256
    .line 257
    iget-object v0, v0, Ly02;->o:Lzy1;

    .line 258
    .line 259
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 260
    .line 261
    .line 262
    iget-object v0, v0, Lzy1;->o:Lso;

    .line 263
    .line 264
    const-string v1, "Error checking backfill conditions"

    .line 265
    .line 266
    invoke-virtual {v0, p0, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    :cond_3
    :goto_1
    return-void
.end method
