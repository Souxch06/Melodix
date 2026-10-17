.class public final Lq30;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Llw0;

.field public b:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Llw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lq30;->a:Llw0;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Lq30;->b:Ljava/lang/Integer;

    .line 8
    .line 9
    return-void
.end method

.method public static a(Ljava/util/ArrayList;Ly0;)Z
    .locals 6

    .line 1
    iget-object v0, p1, Ly0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Ly0;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    move v3, v2

    .line 11
    :cond_0
    if-ge v3, v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    add-int/lit8 v3, v3, 0x1

    .line 18
    .line 19
    check-cast v4, Ly0;

    .line 20
    .line 21
    iget-object v5, v4, Ly0;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    if-eqz v5, :cond_0

    .line 28
    .line 29
    iget-object v4, v4, Ly0;->b:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eqz v4, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_1
    return v2
.end method


# virtual methods
.method public final b()Ljava/util/ArrayList;
    .locals 11

    .line 1
    iget-object p0, p0, Lq30;->a:Llw0;

    .line 2
    .line 3
    invoke-interface {p0}, Llw0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lj4;

    .line 8
    .line 9
    check-cast p0, Lk4;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lk4;->a:Lcom/google/android/gms/measurement/api/AppMeasurementSdk;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;->a:Ldx1;

    .line 22
    .line 23
    const-string v1, "frc"

    .line 24
    .line 25
    const-string v2, ""

    .line 26
    .line 27
    invoke-virtual {p0, v1, v2}, Ldx1;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Landroid/os/Bundle;

    .line 46
    .line 47
    sget-object v2, Ljv1;->a:Lbe0;

    .line 48
    .line 49
    invoke-static {v1}, Lbh;->h(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    new-instance v2, Li4;

    .line 53
    .line 54
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 55
    .line 56
    .line 57
    const-string v3, "origin"

    .line 58
    .line 59
    const-class v4, Ljava/lang/String;

    .line 60
    .line 61
    const/4 v5, 0x0

    .line 62
    invoke-static {v1, v3, v4, v5}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    check-cast v3, Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v3}, Lbh;->h(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    iput-object v3, v2, Li4;->a:Ljava/lang/String;

    .line 72
    .line 73
    const-string v3, "name"

    .line 74
    .line 75
    invoke-static {v1, v3, v4, v5}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    check-cast v3, Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v3}, Lbh;->h(Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    iput-object v3, v2, Li4;->b:Ljava/lang/String;

    .line 85
    .line 86
    const-string v3, "value"

    .line 87
    .line 88
    const-class v6, Ljava/lang/Object;

    .line 89
    .line 90
    invoke-static {v1, v3, v6, v5}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    iput-object v3, v2, Li4;->c:Ljava/lang/Object;

    .line 95
    .line 96
    const-string v3, "trigger_event_name"

    .line 97
    .line 98
    invoke-static {v1, v3, v4, v5}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    check-cast v3, Ljava/lang/String;

    .line 103
    .line 104
    iput-object v3, v2, Li4;->d:Ljava/lang/String;

    .line 105
    .line 106
    const-wide/16 v6, 0x0

    .line 107
    .line 108
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    const-string v6, "trigger_timeout"

    .line 113
    .line 114
    const-class v7, Ljava/lang/Long;

    .line 115
    .line 116
    invoke-static {v1, v6, v7, v3}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v6

    .line 120
    check-cast v6, Ljava/lang/Long;

    .line 121
    .line 122
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 123
    .line 124
    .line 125
    move-result-wide v8

    .line 126
    iput-wide v8, v2, Li4;->e:J

    .line 127
    .line 128
    const-string v6, "timed_out_event_name"

    .line 129
    .line 130
    invoke-static {v1, v6, v4, v5}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v6

    .line 134
    check-cast v6, Ljava/lang/String;

    .line 135
    .line 136
    iput-object v6, v2, Li4;->f:Ljava/lang/String;

    .line 137
    .line 138
    const-string v6, "timed_out_event_params"

    .line 139
    .line 140
    const-class v8, Landroid/os/Bundle;

    .line 141
    .line 142
    invoke-static {v1, v6, v8, v5}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v6

    .line 146
    check-cast v6, Landroid/os/Bundle;

    .line 147
    .line 148
    iput-object v6, v2, Li4;->g:Landroid/os/Bundle;

    .line 149
    .line 150
    const-string v6, "triggered_event_name"

    .line 151
    .line 152
    invoke-static {v1, v6, v4, v5}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v6

    .line 156
    check-cast v6, Ljava/lang/String;

    .line 157
    .line 158
    iput-object v6, v2, Li4;->h:Ljava/lang/String;

    .line 159
    .line 160
    const-string v6, "triggered_event_params"

    .line 161
    .line 162
    invoke-static {v1, v6, v8, v5}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v6

    .line 166
    check-cast v6, Landroid/os/Bundle;

    .line 167
    .line 168
    iput-object v6, v2, Li4;->i:Landroid/os/Bundle;

    .line 169
    .line 170
    const-string v6, "time_to_live"

    .line 171
    .line 172
    invoke-static {v1, v6, v7, v3}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v6

    .line 176
    check-cast v6, Ljava/lang/Long;

    .line 177
    .line 178
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 179
    .line 180
    .line 181
    move-result-wide v9

    .line 182
    iput-wide v9, v2, Li4;->j:J

    .line 183
    .line 184
    const-string v6, "expired_event_name"

    .line 185
    .line 186
    invoke-static {v1, v6, v4, v5}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    check-cast v4, Ljava/lang/String;

    .line 191
    .line 192
    iput-object v4, v2, Li4;->k:Ljava/lang/String;

    .line 193
    .line 194
    const-string v4, "expired_event_params"

    .line 195
    .line 196
    invoke-static {v1, v4, v8, v5}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v4

    .line 200
    check-cast v4, Landroid/os/Bundle;

    .line 201
    .line 202
    iput-object v4, v2, Li4;->l:Landroid/os/Bundle;

    .line 203
    .line 204
    const-class v4, Ljava/lang/Boolean;

    .line 205
    .line 206
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 207
    .line 208
    const-string v6, "active"

    .line 209
    .line 210
    invoke-static {v1, v6, v4, v5}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object v4

    .line 214
    check-cast v4, Ljava/lang/Boolean;

    .line 215
    .line 216
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 217
    .line 218
    .line 219
    move-result v4

    .line 220
    iput-boolean v4, v2, Li4;->n:Z

    .line 221
    .line 222
    const-string v4, "creation_timestamp"

    .line 223
    .line 224
    invoke-static {v1, v4, v7, v3}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v4

    .line 228
    check-cast v4, Ljava/lang/Long;

    .line 229
    .line 230
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 231
    .line 232
    .line 233
    move-result-wide v4

    .line 234
    iput-wide v4, v2, Li4;->m:J

    .line 235
    .line 236
    const-string v4, "triggered_timestamp"

    .line 237
    .line 238
    invoke-static {v1, v4, v7, v3}, Lbh;->G(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    check-cast v1, Ljava/lang/Long;

    .line 243
    .line 244
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 245
    .line 246
    .line 247
    move-result-wide v3

    .line 248
    iput-wide v3, v2, Li4;->o:J

    .line 249
    .line 250
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    goto/16 :goto_0

    .line 254
    .line 255
    :cond_0
    return-object v0
.end method

.method public final c(Ljava/util/ArrayList;)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lq30;->a:Llw0;

    .line 4
    .line 5
    invoke-interface {v1}, Llw0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string v3, "The Analytics SDK is not available. Please check that the Analytics SDK is included in your app dependencies."

    .line 10
    .line 11
    if-eqz v2, :cond_29

    .line 12
    .line 13
    new-instance v2, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    const/4 v6, 0x0

    .line 23
    :goto_0
    const-string v7, ""

    .line 24
    .line 25
    if-ge v6, v4, :cond_4

    .line 26
    .line 27
    move-object/from16 v8, p1

    .line 28
    .line 29
    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v9

    .line 33
    add-int/lit8 v6, v6, 0x1

    .line 34
    .line 35
    check-cast v9, Ljava/util/Map;

    .line 36
    .line 37
    sget-object v10, Ly0;->g:[Ljava/lang/String;

    .line 38
    .line 39
    const-string v10, "triggerEvent"

    .line 40
    .line 41
    new-instance v11, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    sget-object v12, Ly0;->g:[Ljava/lang/String;

    .line 47
    .line 48
    const/4 v13, 0x0

    .line 49
    :goto_1
    const/4 v14, 0x5

    .line 50
    if-ge v13, v14, :cond_1

    .line 51
    .line 52
    aget-object v14, v12, v13

    .line 53
    .line 54
    invoke-interface {v9, v14}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v15

    .line 58
    if-nez v15, :cond_0

    .line 59
    .line 60
    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    :cond_0
    add-int/lit8 v13, v13, 0x1

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    .line 67
    .line 68
    .line 69
    move-result v12

    .line 70
    if-eqz v12, :cond_3

    .line 71
    .line 72
    :try_start_0
    sget-object v11, Ly0;->h:Ljava/text/SimpleDateFormat;

    .line 73
    .line 74
    const-string v12, "experimentStartTime"

    .line 75
    .line 76
    invoke-interface {v9, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v12

    .line 80
    check-cast v12, Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v11, v12}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    .line 83
    .line 84
    .line 85
    move-result-object v17

    .line 86
    const-string v11, "triggerTimeoutMillis"

    .line 87
    .line 88
    invoke-interface {v9, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v11

    .line 92
    check-cast v11, Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v11}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 95
    .line 96
    .line 97
    move-result-wide v18

    .line 98
    const-string v11, "timeToLiveMillis"

    .line 99
    .line 100
    invoke-interface {v9, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v11

    .line 104
    check-cast v11, Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v11}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 107
    .line 108
    .line 109
    move-result-wide v20

    .line 110
    new-instance v13, Ly0;

    .line 111
    .line 112
    const-string v11, "experimentId"

    .line 113
    .line 114
    invoke-interface {v9, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v11

    .line 118
    move-object v14, v11

    .line 119
    check-cast v14, Ljava/lang/String;

    .line 120
    .line 121
    const-string v11, "variantId"

    .line 122
    .line 123
    invoke-interface {v9, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v11

    .line 127
    move-object v15, v11

    .line 128
    check-cast v15, Ljava/lang/String;

    .line 129
    .line 130
    invoke-interface {v9, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v11

    .line 134
    if-eqz v11, :cond_2

    .line 135
    .line 136
    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v7

    .line 140
    check-cast v7, Ljava/lang/String;

    .line 141
    .line 142
    :cond_2
    move-object/from16 v16, v7

    .line 143
    .line 144
    invoke-direct/range {v13 .. v21}, Ly0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;JJ)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    .line 146
    .line 147
    invoke-virtual {v2, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    goto :goto_0

    .line 151
    :catch_0
    move-exception v0

    .line 152
    new-instance v1, Lx0;

    .line 153
    .line 154
    const-string v2, "Could not process experiment: one of the durations could not be converted into a long."

    .line 155
    .line 156
    invoke-direct {v1, v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 157
    .line 158
    .line 159
    throw v1

    .line 160
    :catch_1
    move-exception v0

    .line 161
    new-instance v1, Lx0;

    .line 162
    .line 163
    const-string v2, "Could not process experiment: parsing experiment start time failed."

    .line 164
    .line 165
    invoke-direct {v1, v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 166
    .line 167
    .line 168
    throw v1

    .line 169
    :cond_3
    new-instance v0, Lx0;

    .line 170
    .line 171
    const-string v1, "The following keys are missing from the experiment info map: %s"

    .line 172
    .line 173
    filled-new-array {v11}, [Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    throw v0

    .line 185
    :cond_4
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 186
    .line 187
    .line 188
    move-result v4

    .line 189
    const/4 v11, 0x0

    .line 190
    if-eqz v4, :cond_6

    .line 191
    .line 192
    invoke-interface {v1}, Llw0;->get()Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    if-eqz v2, :cond_5

    .line 197
    .line 198
    invoke-virtual {v0}, Lq30;->b()Ljava/util/ArrayList;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    const/4 v5, 0x0

    .line 207
    :goto_2
    if-ge v5, v2, :cond_27

    .line 208
    .line 209
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    add-int/lit8 v5, v5, 0x1

    .line 214
    .line 215
    check-cast v3, Li4;

    .line 216
    .line 217
    iget-object v10, v3, Li4;->b:Ljava/lang/String;

    .line 218
    .line 219
    invoke-interface {v1}, Llw0;->get()Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object v3

    .line 223
    check-cast v3, Lj4;

    .line 224
    .line 225
    check-cast v3, Lk4;

    .line 226
    .line 227
    iget-object v3, v3, Lk4;->a:Lcom/google/android/gms/measurement/api/AppMeasurementSdk;

    .line 228
    .line 229
    iget-object v9, v3, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;->a:Ldx1;

    .line 230
    .line 231
    new-instance v8, Low1;

    .line 232
    .line 233
    const/4 v13, 0x0

    .line 234
    move-object v12, v11

    .line 235
    invoke-direct/range {v8 .. v13}, Low1;-><init>(Ldx1;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;I)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {v9, v8}, Ldx1;->c(Lzw1;)V

    .line 239
    .line 240
    .line 241
    goto :goto_2

    .line 242
    :cond_5
    new-instance v0, Lx0;

    .line 243
    .line 244
    invoke-direct {v0, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    throw v0

    .line 248
    :cond_6
    invoke-interface {v1}, Llw0;->get()Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v4

    .line 252
    if-eqz v4, :cond_28

    .line 253
    .line 254
    invoke-virtual {v0}, Lq30;->b()Ljava/util/ArrayList;

    .line 255
    .line 256
    .line 257
    move-result-object v3

    .line 258
    new-instance v4, Ljava/util/ArrayList;

    .line 259
    .line 260
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 264
    .line 265
    .line 266
    move-result v6

    .line 267
    const/4 v8, 0x0

    .line 268
    :goto_3
    if-ge v8, v6, :cond_8

    .line 269
    .line 270
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    move-result-object v9

    .line 274
    add-int/lit8 v8, v8, 0x1

    .line 275
    .line 276
    check-cast v9, Li4;

    .line 277
    .line 278
    sget-object v10, Ly0;->g:[Ljava/lang/String;

    .line 279
    .line 280
    iget-object v10, v9, Li4;->d:Ljava/lang/String;

    .line 281
    .line 282
    if-eqz v10, :cond_7

    .line 283
    .line 284
    move-object v15, v10

    .line 285
    goto :goto_4

    .line 286
    :cond_7
    move-object v15, v7

    .line 287
    :goto_4
    new-instance v12, Ly0;

    .line 288
    .line 289
    iget-object v13, v9, Li4;->b:Ljava/lang/String;

    .line 290
    .line 291
    iget-object v10, v9, Li4;->c:Ljava/lang/Object;

    .line 292
    .line 293
    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v14

    .line 297
    new-instance v10, Ljava/util/Date;

    .line 298
    .line 299
    move/from16 p1, v6

    .line 300
    .line 301
    iget-wide v5, v9, Li4;->m:J

    .line 302
    .line 303
    invoke-direct {v10, v5, v6}, Ljava/util/Date;-><init>(J)V

    .line 304
    .line 305
    .line 306
    iget-wide v5, v9, Li4;->e:J

    .line 307
    .line 308
    move-object/from16 v22, v11

    .line 309
    .line 310
    move-object/from16 v16, v12

    .line 311
    .line 312
    iget-wide v11, v9, Li4;->j:J

    .line 313
    .line 314
    move-wide/from16 v17, v5

    .line 315
    .line 316
    move-wide/from16 v19, v11

    .line 317
    .line 318
    move-object/from16 v12, v16

    .line 319
    .line 320
    move-object/from16 v16, v10

    .line 321
    .line 322
    invoke-direct/range {v12 .. v20}, Ly0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;JJ)V

    .line 323
    .line 324
    .line 325
    invoke-virtual {v4, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 326
    .line 327
    .line 328
    move/from16 v6, p1

    .line 329
    .line 330
    move-object/from16 v11, v22

    .line 331
    .line 332
    goto :goto_3

    .line 333
    :cond_8
    move-object/from16 v22, v11

    .line 334
    .line 335
    new-instance v3, Ljava/util/ArrayList;

    .line 336
    .line 337
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 338
    .line 339
    .line 340
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 341
    .line 342
    .line 343
    move-result v5

    .line 344
    const/4 v6, 0x0

    .line 345
    :cond_9
    :goto_5
    if-ge v6, v5, :cond_a

    .line 346
    .line 347
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 348
    .line 349
    .line 350
    move-result-object v7

    .line 351
    add-int/lit8 v6, v6, 0x1

    .line 352
    .line 353
    check-cast v7, Ly0;

    .line 354
    .line 355
    invoke-static {v2, v7}, Lq30;->a(Ljava/util/ArrayList;Ly0;)Z

    .line 356
    .line 357
    .line 358
    move-result v8

    .line 359
    if-nez v8, :cond_9

    .line 360
    .line 361
    invoke-virtual {v7}, Ly0;->a()Li4;

    .line 362
    .line 363
    .line 364
    move-result-object v7

    .line 365
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 366
    .line 367
    .line 368
    goto :goto_5

    .line 369
    :cond_a
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 370
    .line 371
    .line 372
    move-result v5

    .line 373
    const/4 v6, 0x0

    .line 374
    :goto_6
    if-ge v6, v5, :cond_b

    .line 375
    .line 376
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 377
    .line 378
    .line 379
    move-result-object v7

    .line 380
    add-int/lit8 v6, v6, 0x1

    .line 381
    .line 382
    check-cast v7, Li4;

    .line 383
    .line 384
    iget-object v10, v7, Li4;->b:Ljava/lang/String;

    .line 385
    .line 386
    invoke-interface {v1}, Llw0;->get()Ljava/lang/Object;

    .line 387
    .line 388
    .line 389
    move-result-object v7

    .line 390
    check-cast v7, Lj4;

    .line 391
    .line 392
    check-cast v7, Lk4;

    .line 393
    .line 394
    iget-object v7, v7, Lk4;->a:Lcom/google/android/gms/measurement/api/AppMeasurementSdk;

    .line 395
    .line 396
    iget-object v9, v7, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;->a:Ldx1;

    .line 397
    .line 398
    new-instance v8, Low1;

    .line 399
    .line 400
    const/4 v13, 0x0

    .line 401
    move-object/from16 v12, v22

    .line 402
    .line 403
    move-object/from16 v11, v22

    .line 404
    .line 405
    invoke-direct/range {v8 .. v13}, Low1;-><init>(Ldx1;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;I)V

    .line 406
    .line 407
    .line 408
    invoke-virtual {v9, v8}, Ldx1;->c(Lzw1;)V

    .line 409
    .line 410
    .line 411
    goto :goto_6

    .line 412
    :cond_b
    move-object/from16 v11, v22

    .line 413
    .line 414
    new-instance v3, Ljava/util/ArrayList;

    .line 415
    .line 416
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 417
    .line 418
    .line 419
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 420
    .line 421
    .line 422
    move-result v5

    .line 423
    const/4 v6, 0x0

    .line 424
    :cond_c
    :goto_7
    if-ge v6, v5, :cond_d

    .line 425
    .line 426
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 427
    .line 428
    .line 429
    move-result-object v7

    .line 430
    add-int/lit8 v6, v6, 0x1

    .line 431
    .line 432
    check-cast v7, Ly0;

    .line 433
    .line 434
    invoke-static {v4, v7}, Lq30;->a(Ljava/util/ArrayList;Ly0;)Z

    .line 435
    .line 436
    .line 437
    move-result v8

    .line 438
    if-nez v8, :cond_c

    .line 439
    .line 440
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 441
    .line 442
    .line 443
    goto :goto_7

    .line 444
    :cond_d
    new-instance v2, Ljava/util/ArrayDeque;

    .line 445
    .line 446
    invoke-virtual {v0}, Lq30;->b()Ljava/util/ArrayList;

    .line 447
    .line 448
    .line 449
    move-result-object v4

    .line 450
    invoke-direct {v2, v4}, Ljava/util/ArrayDeque;-><init>(Ljava/util/Collection;)V

    .line 451
    .line 452
    .line 453
    iget-object v4, v0, Lq30;->b:Ljava/lang/Integer;

    .line 454
    .line 455
    const-string v5, "frc"

    .line 456
    .line 457
    if-nez v4, :cond_e

    .line 458
    .line 459
    invoke-interface {v1}, Llw0;->get()Ljava/lang/Object;

    .line 460
    .line 461
    .line 462
    move-result-object v4

    .line 463
    check-cast v4, Lj4;

    .line 464
    .line 465
    check-cast v4, Lk4;

    .line 466
    .line 467
    iget-object v4, v4, Lk4;->a:Lcom/google/android/gms/measurement/api/AppMeasurementSdk;

    .line 468
    .line 469
    iget-object v4, v4, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;->a:Ldx1;

    .line 470
    .line 471
    invoke-virtual {v4, v5}, Ldx1;->b(Ljava/lang/String;)I

    .line 472
    .line 473
    .line 474
    move-result v4

    .line 475
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 476
    .line 477
    .line 478
    move-result-object v4

    .line 479
    iput-object v4, v0, Lq30;->b:Ljava/lang/Integer;

    .line 480
    .line 481
    :cond_e
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 482
    .line 483
    .line 484
    move-result v4

    .line 485
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 486
    .line 487
    .line 488
    move-result v6

    .line 489
    const/4 v0, 0x0

    .line 490
    :goto_8
    if-ge v0, v6, :cond_27

    .line 491
    .line 492
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 493
    .line 494
    .line 495
    move-result-object v7

    .line 496
    add-int/lit8 v14, v0, 0x1

    .line 497
    .line 498
    check-cast v7, Ly0;

    .line 499
    .line 500
    :goto_9
    invoke-virtual {v2}, Ljava/util/ArrayDeque;->size()I

    .line 501
    .line 502
    .line 503
    move-result v0

    .line 504
    if-lt v0, v4, :cond_f

    .line 505
    .line 506
    invoke-virtual {v2}, Ljava/util/ArrayDeque;->pollFirst()Ljava/lang/Object;

    .line 507
    .line 508
    .line 509
    move-result-object v0

    .line 510
    check-cast v0, Li4;

    .line 511
    .line 512
    iget-object v10, v0, Li4;->b:Ljava/lang/String;

    .line 513
    .line 514
    invoke-interface {v1}, Llw0;->get()Ljava/lang/Object;

    .line 515
    .line 516
    .line 517
    move-result-object v0

    .line 518
    check-cast v0, Lj4;

    .line 519
    .line 520
    check-cast v0, Lk4;

    .line 521
    .line 522
    iget-object v0, v0, Lk4;->a:Lcom/google/android/gms/measurement/api/AppMeasurementSdk;

    .line 523
    .line 524
    iget-object v9, v0, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;->a:Ldx1;

    .line 525
    .line 526
    new-instance v8, Low1;

    .line 527
    .line 528
    const/4 v13, 0x0

    .line 529
    move-object v12, v11

    .line 530
    invoke-direct/range {v8 .. v13}, Low1;-><init>(Ldx1;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;I)V

    .line 531
    .line 532
    .line 533
    invoke-virtual {v9, v8}, Ldx1;->c(Lzw1;)V

    .line 534
    .line 535
    .line 536
    goto :goto_9

    .line 537
    :cond_f
    invoke-virtual {v7}, Ly0;->a()Li4;

    .line 538
    .line 539
    .line 540
    move-result-object v7

    .line 541
    invoke-interface {v1}, Llw0;->get()Ljava/lang/Object;

    .line 542
    .line 543
    .line 544
    move-result-object v0

    .line 545
    check-cast v0, Lj4;

    .line 546
    .line 547
    move-object v8, v0

    .line 548
    check-cast v8, Lk4;

    .line 549
    .line 550
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 551
    .line 552
    .line 553
    sget-object v0, Ljv1;->a:Lbe0;

    .line 554
    .line 555
    iget-object v9, v7, Li4;->a:Ljava/lang/String;

    .line 556
    .line 557
    if-eqz v9, :cond_26

    .line 558
    .line 559
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    .line 560
    .line 561
    .line 562
    move-result v0

    .line 563
    if-nez v0, :cond_26

    .line 564
    .line 565
    iget-object v0, v7, Li4;->c:Ljava/lang/Object;

    .line 566
    .line 567
    if-eqz v0, :cond_12

    .line 568
    .line 569
    :try_start_1
    new-instance v10, Ljava/io/ByteArrayOutputStream;

    .line 570
    .line 571
    invoke-direct {v10}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 572
    .line 573
    .line 574
    new-instance v12, Ljava/io/ObjectOutputStream;

    .line 575
    .line 576
    invoke-direct {v12, v10}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 577
    .line 578
    .line 579
    :try_start_2
    invoke-virtual {v12, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 580
    .line 581
    .line 582
    invoke-virtual {v12}, Ljava/io/ObjectOutputStream;->flush()V

    .line 583
    .line 584
    .line 585
    new-instance v13, Ljava/io/ObjectInputStream;

    .line 586
    .line 587
    new-instance v0, Ljava/io/ByteArrayInputStream;

    .line 588
    .line 589
    invoke-virtual {v10}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 590
    .line 591
    .line 592
    move-result-object v10

    .line 593
    invoke-direct {v0, v10}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 594
    .line 595
    .line 596
    invoke-direct {v13, v0}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 597
    .line 598
    .line 599
    :try_start_3
    invoke-virtual {v13}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    .line 600
    .line 601
    .line 602
    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 603
    :try_start_4
    invoke-virtual {v12}, Ljava/io/ObjectOutputStream;->close()V

    .line 604
    .line 605
    .line 606
    invoke-virtual {v13}, Ljava/io/ObjectInputStream;->close()V

    .line 607
    .line 608
    .line 609
    goto :goto_b

    .line 610
    :catchall_0
    move-exception v0

    .line 611
    goto :goto_a

    .line 612
    :catchall_1
    move-exception v0

    .line 613
    move-object v13, v11

    .line 614
    goto :goto_a

    .line 615
    :catchall_2
    move-exception v0

    .line 616
    move-object v12, v11

    .line 617
    move-object v13, v12

    .line 618
    :goto_a
    if-eqz v12, :cond_10

    .line 619
    .line 620
    invoke-virtual {v12}, Ljava/io/ObjectOutputStream;->close()V

    .line 621
    .line 622
    .line 623
    :cond_10
    if-eqz v13, :cond_11

    .line 624
    .line 625
    invoke-virtual {v13}, Ljava/io/ObjectInputStream;->close()V

    .line 626
    .line 627
    .line 628
    :cond_11
    throw v0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4 .. :try_end_4} :catch_2

    .line 629
    :catch_2
    move-object v0, v11

    .line 630
    :goto_b
    if-eqz v0, :cond_26

    .line 631
    .line 632
    :cond_12
    sget-object v0, Ljv1;->c:Lmz0;

    .line 633
    .line 634
    invoke-virtual {v0, v9}, Lzd0;->contains(Ljava/lang/Object;)Z

    .line 635
    .line 636
    .line 637
    move-result v0

    .line 638
    if-nez v0, :cond_26

    .line 639
    .line 640
    iget-object v0, v7, Li4;->b:Ljava/lang/String;

    .line 641
    .line 642
    const-string v10, "_ce1"

    .line 643
    .line 644
    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 645
    .line 646
    .line 647
    move-result v10

    .line 648
    const-string v12, "fcm"

    .line 649
    .line 650
    if-nez v10, :cond_17

    .line 651
    .line 652
    const-string v10, "_ce2"

    .line 653
    .line 654
    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 655
    .line 656
    .line 657
    move-result v10

    .line 658
    if-eqz v10, :cond_13

    .line 659
    .line 660
    goto :goto_c

    .line 661
    :cond_13
    const-string v10, "_ln"

    .line 662
    .line 663
    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 664
    .line 665
    .line 666
    move-result v10

    .line 667
    if-eqz v10, :cond_14

    .line 668
    .line 669
    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 670
    .line 671
    .line 672
    move-result v0

    .line 673
    if-nez v0, :cond_18

    .line 674
    .line 675
    const-string v0, "fiam"

    .line 676
    .line 677
    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 678
    .line 679
    .line 680
    move-result v0

    .line 681
    if-eqz v0, :cond_26

    .line 682
    .line 683
    goto :goto_d

    .line 684
    :cond_14
    sget-object v10, Ljv1;->e:Lmz0;

    .line 685
    .line 686
    invoke-virtual {v10, v0}, Lzd0;->contains(Ljava/lang/Object;)Z

    .line 687
    .line 688
    .line 689
    move-result v10

    .line 690
    if-eqz v10, :cond_15

    .line 691
    .line 692
    goto/16 :goto_e

    .line 693
    .line 694
    :cond_15
    sget-object v10, Ljv1;->f:Lmz0;

    .line 695
    .line 696
    iget v12, v10, Lmz0;->m:I

    .line 697
    .line 698
    const/4 v13, 0x0

    .line 699
    :cond_16
    if-ge v13, v12, :cond_18

    .line 700
    .line 701
    invoke-virtual {v10, v13}, Lmz0;->get(I)Ljava/lang/Object;

    .line 702
    .line 703
    .line 704
    move-result-object v15

    .line 705
    check-cast v15, Ljava/lang/String;

    .line 706
    .line 707
    invoke-virtual {v0, v15}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    .line 708
    .line 709
    .line 710
    move-result v15

    .line 711
    add-int/lit8 v13, v13, 0x1

    .line 712
    .line 713
    if-eqz v15, :cond_16

    .line 714
    .line 715
    goto/16 :goto_e

    .line 716
    .line 717
    :cond_17
    :goto_c
    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 718
    .line 719
    .line 720
    move-result v0

    .line 721
    if-nez v0, :cond_18

    .line 722
    .line 723
    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 724
    .line 725
    .line 726
    move-result v0

    .line 727
    if-eqz v0, :cond_26

    .line 728
    .line 729
    :cond_18
    :goto_d
    iget-object v0, v7, Li4;->k:Ljava/lang/String;

    .line 730
    .line 731
    if-eqz v0, :cond_19

    .line 732
    .line 733
    iget-object v10, v7, Li4;->l:Landroid/os/Bundle;

    .line 734
    .line 735
    invoke-static {v0, v10}, Ljv1;->a(Ljava/lang/String;Landroid/os/Bundle;)Z

    .line 736
    .line 737
    .line 738
    move-result v0

    .line 739
    if-eqz v0, :cond_26

    .line 740
    .line 741
    iget-object v0, v7, Li4;->k:Ljava/lang/String;

    .line 742
    .line 743
    iget-object v10, v7, Li4;->l:Landroid/os/Bundle;

    .line 744
    .line 745
    invoke-static {v9, v0, v10}, Ljv1;->b(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Z

    .line 746
    .line 747
    .line 748
    move-result v0

    .line 749
    if-eqz v0, :cond_26

    .line 750
    .line 751
    :cond_19
    iget-object v0, v7, Li4;->h:Ljava/lang/String;

    .line 752
    .line 753
    if-eqz v0, :cond_1a

    .line 754
    .line 755
    iget-object v10, v7, Li4;->i:Landroid/os/Bundle;

    .line 756
    .line 757
    invoke-static {v0, v10}, Ljv1;->a(Ljava/lang/String;Landroid/os/Bundle;)Z

    .line 758
    .line 759
    .line 760
    move-result v0

    .line 761
    if-eqz v0, :cond_26

    .line 762
    .line 763
    iget-object v0, v7, Li4;->h:Ljava/lang/String;

    .line 764
    .line 765
    iget-object v10, v7, Li4;->i:Landroid/os/Bundle;

    .line 766
    .line 767
    invoke-static {v9, v0, v10}, Ljv1;->b(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Z

    .line 768
    .line 769
    .line 770
    move-result v0

    .line 771
    if-eqz v0, :cond_26

    .line 772
    .line 773
    :cond_1a
    iget-object v0, v7, Li4;->f:Ljava/lang/String;

    .line 774
    .line 775
    if-eqz v0, :cond_1b

    .line 776
    .line 777
    iget-object v10, v7, Li4;->g:Landroid/os/Bundle;

    .line 778
    .line 779
    invoke-static {v0, v10}, Ljv1;->a(Ljava/lang/String;Landroid/os/Bundle;)Z

    .line 780
    .line 781
    .line 782
    move-result v0

    .line 783
    if-eqz v0, :cond_26

    .line 784
    .line 785
    iget-object v0, v7, Li4;->f:Ljava/lang/String;

    .line 786
    .line 787
    iget-object v10, v7, Li4;->g:Landroid/os/Bundle;

    .line 788
    .line 789
    invoke-static {v9, v0, v10}, Ljv1;->b(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Z

    .line 790
    .line 791
    .line 792
    move-result v0

    .line 793
    if-eqz v0, :cond_26

    .line 794
    .line 795
    :cond_1b
    iget-object v0, v8, Lk4;->a:Lcom/google/android/gms/measurement/api/AppMeasurementSdk;

    .line 796
    .line 797
    new-instance v8, Landroid/os/Bundle;

    .line 798
    .line 799
    invoke-direct {v8}, Landroid/os/Bundle;-><init>()V

    .line 800
    .line 801
    .line 802
    iget-object v9, v7, Li4;->a:Ljava/lang/String;

    .line 803
    .line 804
    if-eqz v9, :cond_1c

    .line 805
    .line 806
    const-string v10, "origin"

    .line 807
    .line 808
    invoke-virtual {v8, v10, v9}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 809
    .line 810
    .line 811
    :cond_1c
    iget-object v9, v7, Li4;->b:Ljava/lang/String;

    .line 812
    .line 813
    if-eqz v9, :cond_1d

    .line 814
    .line 815
    const-string v10, "name"

    .line 816
    .line 817
    invoke-virtual {v8, v10, v9}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 818
    .line 819
    .line 820
    :cond_1d
    iget-object v9, v7, Li4;->c:Ljava/lang/Object;

    .line 821
    .line 822
    if-eqz v9, :cond_1e

    .line 823
    .line 824
    invoke-static {v8, v9}, Lbh;->F(Landroid/os/Bundle;Ljava/lang/Object;)V

    .line 825
    .line 826
    .line 827
    :cond_1e
    iget-object v9, v7, Li4;->d:Ljava/lang/String;

    .line 828
    .line 829
    if-eqz v9, :cond_1f

    .line 830
    .line 831
    const-string v10, "trigger_event_name"

    .line 832
    .line 833
    invoke-virtual {v8, v10, v9}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 834
    .line 835
    .line 836
    :cond_1f
    iget-wide v9, v7, Li4;->e:J

    .line 837
    .line 838
    const-string v12, "trigger_timeout"

    .line 839
    .line 840
    invoke-virtual {v8, v12, v9, v10}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 841
    .line 842
    .line 843
    iget-object v9, v7, Li4;->f:Ljava/lang/String;

    .line 844
    .line 845
    if-eqz v9, :cond_20

    .line 846
    .line 847
    const-string v10, "timed_out_event_name"

    .line 848
    .line 849
    invoke-virtual {v8, v10, v9}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 850
    .line 851
    .line 852
    :cond_20
    iget-object v9, v7, Li4;->g:Landroid/os/Bundle;

    .line 853
    .line 854
    if-eqz v9, :cond_21

    .line 855
    .line 856
    const-string v10, "timed_out_event_params"

    .line 857
    .line 858
    invoke-virtual {v8, v10, v9}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 859
    .line 860
    .line 861
    :cond_21
    iget-object v9, v7, Li4;->h:Ljava/lang/String;

    .line 862
    .line 863
    if-eqz v9, :cond_22

    .line 864
    .line 865
    const-string v10, "triggered_event_name"

    .line 866
    .line 867
    invoke-virtual {v8, v10, v9}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 868
    .line 869
    .line 870
    :cond_22
    iget-object v9, v7, Li4;->i:Landroid/os/Bundle;

    .line 871
    .line 872
    if-eqz v9, :cond_23

    .line 873
    .line 874
    const-string v10, "triggered_event_params"

    .line 875
    .line 876
    invoke-virtual {v8, v10, v9}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 877
    .line 878
    .line 879
    :cond_23
    iget-wide v9, v7, Li4;->j:J

    .line 880
    .line 881
    const-string v12, "time_to_live"

    .line 882
    .line 883
    invoke-virtual {v8, v12, v9, v10}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 884
    .line 885
    .line 886
    iget-object v9, v7, Li4;->k:Ljava/lang/String;

    .line 887
    .line 888
    if-eqz v9, :cond_24

    .line 889
    .line 890
    const-string v10, "expired_event_name"

    .line 891
    .line 892
    invoke-virtual {v8, v10, v9}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 893
    .line 894
    .line 895
    :cond_24
    iget-object v9, v7, Li4;->l:Landroid/os/Bundle;

    .line 896
    .line 897
    if-eqz v9, :cond_25

    .line 898
    .line 899
    const-string v10, "expired_event_params"

    .line 900
    .line 901
    invoke-virtual {v8, v10, v9}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 902
    .line 903
    .line 904
    :cond_25
    iget-wide v9, v7, Li4;->m:J

    .line 905
    .line 906
    const-string v12, "creation_timestamp"

    .line 907
    .line 908
    invoke-virtual {v8, v12, v9, v10}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 909
    .line 910
    .line 911
    iget-boolean v9, v7, Li4;->n:Z

    .line 912
    .line 913
    const-string v10, "active"

    .line 914
    .line 915
    invoke-virtual {v8, v10, v9}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 916
    .line 917
    .line 918
    iget-wide v9, v7, Li4;->o:J

    .line 919
    .line 920
    const-string v12, "triggered_timestamp"

    .line 921
    .line 922
    invoke-virtual {v8, v12, v9, v10}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 923
    .line 924
    .line 925
    iget-object v0, v0, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;->a:Ldx1;

    .line 926
    .line 927
    new-instance v9, Lnw1;

    .line 928
    .line 929
    invoke-direct {v9, v0, v8}, Lnw1;-><init>(Ldx1;Landroid/os/Bundle;)V

    .line 930
    .line 931
    .line 932
    invoke-virtual {v0, v9}, Ldx1;->c(Lzw1;)V

    .line 933
    .line 934
    .line 935
    :cond_26
    :goto_e
    invoke-virtual {v2, v7}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    .line 936
    .line 937
    .line 938
    move v0, v14

    .line 939
    goto/16 :goto_8

    .line 940
    .line 941
    :cond_27
    return-void

    .line 942
    :cond_28
    new-instance v0, Lx0;

    .line 943
    .line 944
    invoke-direct {v0, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 945
    .line 946
    .line 947
    throw v0

    .line 948
    :cond_29
    new-instance v0, Lx0;

    .line 949
    .line 950
    invoke-direct {v0, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 951
    .line 952
    .line 953
    throw v0
.end method
