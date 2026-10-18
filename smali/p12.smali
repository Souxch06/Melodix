.class public final Lp12;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lbc2;

.field public final synthetic k:Lk22;


# direct methods
.method public constructor <init>(Lk22;Lbc2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lp12;->j:Lbc2;

    .line 5
    .line 6
    iput-object p1, p0, Lp12;->k:Lk22;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    .line 1
    iget-object v0, p0, Lp12;->k:Lk22;

    .line 2
    .line 3
    iget-object v0, v0, Lk22;->b:Lsa2;

    .line 4
    .line 5
    invoke-virtual {v0}, Lsa2;->V()V

    .line 6
    .line 7
    .line 8
    const-string v1, "app_id=?"

    .line 9
    .line 10
    iget-object v2, v0, Lsa2;->H:Ljava/util/ArrayList;

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    new-instance v2, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v2, v0, Lsa2;->I:Ljava/util/ArrayList;

    .line 20
    .line 21
    iget-object v3, v0, Lsa2;->H:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v2, v0, Lsa2;->l:Ldu1;

    .line 27
    .line 28
    invoke-static {v2}, Lsa2;->T(Laa2;)V

    .line 29
    .line 30
    .line 31
    iget-object v3, v2, Let;->j:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v3, Ly02;

    .line 34
    .line 35
    iget-object p0, p0, Lp12;->j:Lbc2;

    .line 36
    .line 37
    iget-object v4, p0, Lbc2;->j:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v4}, Lbh;->h(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v4}, Lbh;->e(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2}, Let;->l()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2}, Laa2;->m()V

    .line 49
    .line 50
    .line 51
    :try_start_0
    invoke-virtual {v2}, Ldu1;->c0()Landroid/database/sqlite/SQLiteDatabase;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    filled-new-array {v4}, [Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    const-string v6, "apps"

    .line 60
    .line 61
    invoke-virtual {v2, v6, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    const-string v7, "events"

    .line 66
    .line 67
    invoke-virtual {v2, v7, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v7

    .line 71
    add-int/2addr v6, v7

    .line 72
    const-string v7, "events_snapshot"

    .line 73
    .line 74
    invoke-virtual {v2, v7, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    add-int/2addr v6, v7

    .line 79
    const-string v7, "user_attributes"

    .line 80
    .line 81
    invoke-virtual {v2, v7, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result v7

    .line 85
    add-int/2addr v6, v7

    .line 86
    const-string v7, "conditional_properties"

    .line 87
    .line 88
    invoke-virtual {v2, v7, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    add-int/2addr v6, v7

    .line 93
    const-string v7, "raw_events"

    .line 94
    .line 95
    invoke-virtual {v2, v7, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    move-result v7

    .line 99
    add-int/2addr v6, v7

    .line 100
    const-string v7, "raw_events_metadata"

    .line 101
    .line 102
    invoke-virtual {v2, v7, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v7

    .line 106
    add-int/2addr v6, v7

    .line 107
    const-string v7, "queue"

    .line 108
    .line 109
    invoke-virtual {v2, v7, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    move-result v7

    .line 113
    add-int/2addr v6, v7

    .line 114
    const-string v7, "audience_filter_values"

    .line 115
    .line 116
    invoke-virtual {v2, v7, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 117
    .line 118
    .line 119
    move-result v7

    .line 120
    add-int/2addr v6, v7

    .line 121
    const-string v7, "main_event_params"

    .line 122
    .line 123
    invoke-virtual {v2, v7, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 124
    .line 125
    .line 126
    move-result v7

    .line 127
    add-int/2addr v6, v7

    .line 128
    const-string v7, "default_event_params"

    .line 129
    .line 130
    invoke-virtual {v2, v7, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    move-result v7

    .line 134
    add-int/2addr v6, v7

    .line 135
    const-string v7, "trigger_uris"

    .line 136
    .line 137
    invoke-virtual {v2, v7, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    move-result v7

    .line 141
    add-int/2addr v6, v7

    .line 142
    const-string v7, "upload_queue"

    .line 143
    .line 144
    invoke-virtual {v2, v7, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    move-result v7

    .line 148
    add-int/2addr v6, v7

    .line 149
    sget-object v7, Lzr1;->k:Lzr1;

    .line 150
    .line 151
    iget-object v7, v7, Lzr1;->j:Lva1;

    .line 152
    .line 153
    iget-object v7, v7, Lva1;->j:Ljava/lang/Object;

    .line 154
    .line 155
    check-cast v7, Las1;

    .line 156
    .line 157
    iget-object v7, v3, Ly02;->m:Lmt1;

    .line 158
    .line 159
    sget-object v8, Lxx1;->c1:Lwx1;

    .line 160
    .line 161
    const/4 v9, 0x0

    .line 162
    invoke-virtual {v7, v9, v8}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 163
    .line 164
    .line 165
    move-result v7

    .line 166
    if-eqz v7, :cond_1

    .line 167
    .line 168
    const-string v7, "no_data_mode_events"

    .line 169
    .line 170
    invoke-virtual {v2, v7, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    move-result v7

    .line 174
    add-int/2addr v6, v7

    .line 175
    goto :goto_0

    .line 176
    :catch_0
    move-exception v1

    .line 177
    goto :goto_1

    .line 178
    :cond_1
    :goto_0
    const-string v7, "diagnostic_signals"

    .line 179
    .line 180
    invoke-virtual {v2, v7, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    add-int/2addr v6, v1

    .line 185
    if-lez v6, :cond_2

    .line 186
    .line 187
    iget-object v1, v3, Ly02;->o:Lzy1;

    .line 188
    .line 189
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 190
    .line 191
    .line 192
    iget-object v1, v1, Lzy1;->w:Lso;

    .line 193
    .line 194
    const-string v2, "Reset analytics data. app, records"

    .line 195
    .line 196
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 197
    .line 198
    .line 199
    move-result-object v5

    .line 200
    invoke-virtual {v1, v2, v4, v5}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    .line 202
    .line 203
    goto :goto_2

    .line 204
    :goto_1
    iget-object v2, v3, Ly02;->o:Lzy1;

    .line 205
    .line 206
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 207
    .line 208
    .line 209
    iget-object v2, v2, Lzy1;->o:Lso;

    .line 210
    .line 211
    invoke-static {v4}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    const-string v4, "Error resetting analytics data. appId, error"

    .line 216
    .line 217
    invoke-virtual {v2, v4, v3, v1}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 218
    .line 219
    .line 220
    :cond_2
    :goto_2
    iget-boolean v1, p0, Lbc2;->q:Z

    .line 221
    .line 222
    if-eqz v1, :cond_3

    .line 223
    .line 224
    invoke-virtual {v0, p0}, Lsa2;->Y(Lbc2;)V

    .line 225
    .line 226
    .line 227
    :cond_3
    return-void
.end method
