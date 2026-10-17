.class public final Lb7;
.super Ld7;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Lg7;

.field public final e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lg7;Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lb7;->c:I

    .line 3
    .line 4
    iput-object p1, p0, Lb7;->d:Lg7;

    .line 5
    .line 6
    invoke-direct {p0, p1}, Ld7;-><init>(Lg7;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string p2, "power"

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Landroid/os/PowerManager;

    .line 20
    .line 21
    iput-object p1, p0, Lb7;->e:Ljava/lang/Object;

    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>(Lg7;Lc9;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lb7;->c:I

    .line 24
    iput-object p1, p0, Lb7;->d:Lg7;

    invoke-direct {p0, p1}, Ld7;-><init>(Lg7;)V

    .line 25
    iput-object p2, p0, Lb7;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final e()Landroid/content/IntentFilter;
    .locals 1

    .line 1
    iget p0, p0, Lb7;->c:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance p0, Landroid/content/IntentFilter;

    .line 7
    .line 8
    invoke-direct {p0}, Landroid/content/IntentFilter;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v0, "android.intent.action.TIME_SET"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "android.intent.action.TIMEZONE_CHANGED"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "android.intent.action.TIME_TICK"

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_0
    new-instance p0, Landroid/content/IntentFilter;

    .line 28
    .line 29
    invoke-direct {p0}, Landroid/content/IntentFilter;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v0, "android.os.action.POWER_SAVE_MODE_CHANGED"

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-object p0

    .line 38
    nop

    .line 39
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final f()I
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lb7;->c:I

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    const/4 v3, 0x1

    .line 7
    iget-object v0, v0, Lb7;->e:Ljava/lang/Object;

    .line 8
    .line 9
    packed-switch v1, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    check-cast v0, Lc9;

    .line 13
    .line 14
    iget-object v1, v0, Lc9;->k:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v1, Landroid/location/LocationManager;

    .line 17
    .line 18
    iget-object v4, v0, Lc9;->l:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v4, Lde1;

    .line 21
    .line 22
    iget-wide v5, v4, Lde1;->b:J

    .line 23
    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 25
    .line 26
    .line 27
    move-result-wide v7

    .line 28
    cmp-long v5, v5, v7

    .line 29
    .line 30
    if-lez v5, :cond_0

    .line 31
    .line 32
    iget-boolean v0, v4, Lde1;->a:Z

    .line 33
    .line 34
    goto/16 :goto_6

    .line 35
    .line 36
    :cond_0
    iget-object v0, v0, Lc9;->m:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v0, Landroid/content/Context;

    .line 39
    .line 40
    const-string v5, "android.permission.ACCESS_COARSE_LOCATION"

    .line 41
    .line 42
    invoke-static {v0, v5}, Lcg1;->b(Landroid/content/Context;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    const/4 v6, 0x0

    .line 47
    if-nez v5, :cond_1

    .line 48
    .line 49
    const-string v5, "network"

    .line 50
    .line 51
    :try_start_0
    invoke-virtual {v1, v5}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v7

    .line 55
    if-eqz v7, :cond_1

    .line 56
    .line 57
    invoke-virtual {v1, v5}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    .line 58
    .line 59
    .line 60
    move-result-object v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    goto :goto_0

    .line 62
    :catch_0
    :cond_1
    move-object v5, v6

    .line 63
    :goto_0
    const-string v7, "android.permission.ACCESS_FINE_LOCATION"

    .line 64
    .line 65
    invoke-static {v0, v7}, Lcg1;->b(Landroid/content/Context;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_2

    .line 70
    .line 71
    const-string v0, "gps"

    .line 72
    .line 73
    :try_start_1
    invoke-virtual {v1, v0}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v7

    .line 77
    if-eqz v7, :cond_2

    .line 78
    .line 79
    invoke-virtual {v1, v0}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    .line 80
    .line 81
    .line 82
    move-result-object v6
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 83
    :catch_1
    :cond_2
    if-eqz v6, :cond_3

    .line 84
    .line 85
    if-eqz v5, :cond_3

    .line 86
    .line 87
    invoke-virtual {v6}, Landroid/location/Location;->getTime()J

    .line 88
    .line 89
    .line 90
    move-result-wide v0

    .line 91
    invoke-virtual {v5}, Landroid/location/Location;->getTime()J

    .line 92
    .line 93
    .line 94
    move-result-wide v7

    .line 95
    cmp-long v0, v0, v7

    .line 96
    .line 97
    if-lez v0, :cond_4

    .line 98
    .line 99
    :goto_1
    move-object v5, v6

    .line 100
    goto :goto_2

    .line 101
    :cond_3
    if-eqz v6, :cond_4

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_4
    :goto_2
    const/4 v0, 0x0

    .line 105
    if-eqz v5, :cond_b

    .line 106
    .line 107
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 108
    .line 109
    .line 110
    move-result-wide v7

    .line 111
    sget-object v1, Lce1;->d:Lce1;

    .line 112
    .line 113
    if-nez v1, :cond_5

    .line 114
    .line 115
    new-instance v1, Lce1;

    .line 116
    .line 117
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 118
    .line 119
    .line 120
    sput-object v1, Lce1;->d:Lce1;

    .line 121
    .line 122
    :cond_5
    move-object v9, v1

    .line 123
    const-wide/32 v16, 0x5265c00

    .line 124
    .line 125
    .line 126
    sub-long v10, v7, v16

    .line 127
    .line 128
    invoke-virtual {v5}, Landroid/location/Location;->getLatitude()D

    .line 129
    .line 130
    .line 131
    move-result-wide v12

    .line 132
    invoke-virtual {v5}, Landroid/location/Location;->getLongitude()D

    .line 133
    .line 134
    .line 135
    move-result-wide v14

    .line 136
    invoke-virtual/range {v9 .. v15}, Lce1;->a(JDD)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v5}, Landroid/location/Location;->getLatitude()D

    .line 140
    .line 141
    .line 142
    move-result-wide v10

    .line 143
    move-object v6, v9

    .line 144
    move-wide v9, v10

    .line 145
    invoke-virtual {v5}, Landroid/location/Location;->getLongitude()D

    .line 146
    .line 147
    .line 148
    move-result-wide v11

    .line 149
    invoke-virtual/range {v6 .. v12}, Lce1;->a(JDD)V

    .line 150
    .line 151
    .line 152
    move-object v9, v6

    .line 153
    iget v1, v9, Lce1;->c:I

    .line 154
    .line 155
    if-ne v1, v3, :cond_6

    .line 156
    .line 157
    move v0, v3

    .line 158
    :cond_6
    iget-wide v10, v9, Lce1;->b:J

    .line 159
    .line 160
    iget-wide v12, v9, Lce1;->a:J

    .line 161
    .line 162
    add-long v14, v7, v16

    .line 163
    .line 164
    move-wide/from16 v16, v12

    .line 165
    .line 166
    invoke-virtual {v5}, Landroid/location/Location;->getLatitude()D

    .line 167
    .line 168
    .line 169
    move-result-wide v12

    .line 170
    invoke-virtual {v5}, Landroid/location/Location;->getLongitude()D

    .line 171
    .line 172
    .line 173
    move-result-wide v5

    .line 174
    move-wide/from16 v18, v14

    .line 175
    .line 176
    move-wide v14, v5

    .line 177
    move-wide v5, v10

    .line 178
    move-wide/from16 v10, v18

    .line 179
    .line 180
    invoke-virtual/range {v9 .. v15}, Lce1;->a(JDD)V

    .line 181
    .line 182
    .line 183
    iget-wide v10, v9, Lce1;->b:J

    .line 184
    .line 185
    const-wide/16 v12, -0x1

    .line 186
    .line 187
    cmp-long v1, v5, v12

    .line 188
    .line 189
    if-eqz v1, :cond_a

    .line 190
    .line 191
    cmp-long v1, v16, v12

    .line 192
    .line 193
    if-nez v1, :cond_7

    .line 194
    .line 195
    goto :goto_4

    .line 196
    :cond_7
    cmp-long v1, v7, v16

    .line 197
    .line 198
    if-lez v1, :cond_8

    .line 199
    .line 200
    goto :goto_3

    .line 201
    :cond_8
    cmp-long v1, v7, v5

    .line 202
    .line 203
    if-lez v1, :cond_9

    .line 204
    .line 205
    move-wide/from16 v10, v16

    .line 206
    .line 207
    goto :goto_3

    .line 208
    :cond_9
    move-wide v10, v5

    .line 209
    :goto_3
    const-wide/32 v5, 0xea60

    .line 210
    .line 211
    .line 212
    add-long/2addr v10, v5

    .line 213
    goto :goto_5

    .line 214
    :cond_a
    :goto_4
    const-wide/32 v5, 0x2932e00

    .line 215
    .line 216
    .line 217
    add-long v10, v7, v5

    .line 218
    .line 219
    :goto_5
    iput-boolean v0, v4, Lde1;->a:Z

    .line 220
    .line 221
    iput-wide v10, v4, Lde1;->b:J

    .line 222
    .line 223
    goto :goto_6

    .line 224
    :cond_b
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    const/16 v4, 0xb

    .line 229
    .line 230
    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    const/4 v4, 0x6

    .line 235
    if-lt v1, v4, :cond_c

    .line 236
    .line 237
    const/16 v4, 0x16

    .line 238
    .line 239
    if-lt v1, v4, :cond_d

    .line 240
    .line 241
    :cond_c
    move v0, v3

    .line 242
    :cond_d
    :goto_6
    if-eqz v0, :cond_e

    .line 243
    .line 244
    goto :goto_7

    .line 245
    :cond_e
    move v2, v3

    .line 246
    :goto_7
    return v2

    .line 247
    :pswitch_0
    check-cast v0, Landroid/os/PowerManager;

    .line 248
    .line 249
    invoke-static {v0}, Lw6;->a(Landroid/os/PowerManager;)Z

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    if-eqz v0, :cond_f

    .line 254
    .line 255
    goto :goto_8

    .line 256
    :cond_f
    move v2, v3

    .line 257
    :goto_8
    return v2

    .line 258
    nop

    .line 259
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final h()V
    .locals 2

    .line 1
    iget v0, p0, Lb7;->c:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iget-object p0, p0, Lb7;->d:Lg7;

    .line 5
    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v1, v1}, Lg7;->k(ZZ)Z

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :pswitch_0
    invoke-virtual {p0, v1, v1}, Lg7;->k(ZZ)Z

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
