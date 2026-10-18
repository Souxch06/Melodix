.class public final synthetic Lvf1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljava/lang/String;

.field public final synthetic k:Lcom/melodix/music/MainActivity;

.field public final synthetic l:Ljava/io/File;

.field public final synthetic m:J

.field public final synthetic n:Landroid/widget/ProgressBar;

.field public final synthetic o:Z

.field public final synthetic p:Landroid/content/res/ColorStateList;

.field public final synthetic q:Landroid/content/res/ColorStateList;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/melodix/music/MainActivity;Ljava/io/File;JLandroid/widget/ProgressBar;ZLandroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lvf1;->j:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lvf1;->k:Lcom/melodix/music/MainActivity;

    .line 7
    .line 8
    iput-object p3, p0, Lvf1;->l:Ljava/io/File;

    .line 9
    .line 10
    iput-wide p4, p0, Lvf1;->m:J

    .line 11
    .line 12
    iput-object p6, p0, Lvf1;->n:Landroid/widget/ProgressBar;

    .line 13
    .line 14
    iput-boolean p7, p0, Lvf1;->o:Z

    .line 15
    .line 16
    iput-object p8, p0, Lvf1;->p:Landroid/content/res/ColorStateList;

    .line 17
    .line 18
    iput-object p9, p0, Lvf1;->q:Landroid/content/res/ColorStateList;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lvf1;->j:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v3, v0, Lvf1;->k:Lcom/melodix/music/MainActivity;

    .line 6
    .line 7
    iget-object v8, v0, Lvf1;->l:Ljava/io/File;

    .line 8
    .line 9
    iget-object v5, v0, Lvf1;->n:Landroid/widget/ProgressBar;

    .line 10
    .line 11
    iget-boolean v6, v0, Lvf1;->o:Z

    .line 12
    .line 13
    iget-object v7, v0, Lvf1;->p:Landroid/content/res/ColorStateList;

    .line 14
    .line 15
    move-object v2, v8

    .line 16
    iget-object v8, v0, Lvf1;->q:Landroid/content/res/ColorStateList;

    .line 17
    .line 18
    new-instance v4, Lhz0;

    .line 19
    .line 20
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 21
    .line 22
    .line 23
    :try_start_0
    new-instance v9, Ljava/net/URL;

    .line 24
    .line 25
    invoke-direct {v9, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v9}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v1}, Lcom/google/firebase/perf/network/FirebasePerfUrlConnection;->instrument(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Ljava/net/URLConnection;

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    check-cast v1, Ljava/net/HttpURLConnection;

    .line 42
    .line 43
    iput-object v1, v4, Lhz0;->j:Ljava/lang/Object;

    .line 44
    .line 45
    const-string v9, "User-Agent"

    .line 46
    .line 47
    const-string v10, "Melodix-Updater"

    .line 48
    .line 49
    invoke-virtual {v1, v9, v10}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v1, v4, Lhz0;->j:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v1, Ljava/net/HttpURLConnection;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/net/URLConnection;->connect()V

    .line 57
    .line 58
    .line 59
    iget-object v1, v4, Lhz0;->j:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast v1, Ljava/net/HttpURLConnection;

    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    const/16 v9, 0xc8

    .line 68
    .line 69
    if-eq v1, v9, :cond_0

    .line 70
    .line 71
    new-instance v2, Lqf1;

    .line 72
    .line 73
    const/4 v9, 0x2

    .line 74
    invoke-direct/range {v2 .. v9}, Lqf1;-><init>(Lcom/melodix/music/MainActivity;Ljava/io/Serializable;Landroid/widget/ProgressBar;ZLandroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 75
    .line 76
    .line 77
    move-object v1, v4

    .line 78
    :try_start_1
    invoke-virtual {v3, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 79
    .line 80
    .line 81
    iget-object v0, v1, Lhz0;->j:Ljava/lang/Object;

    .line 82
    .line 83
    check-cast v0, Ljava/net/HttpURLConnection;

    .line 84
    .line 85
    if-eqz v0, :cond_4

    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :catchall_0
    move-exception v0

    .line 92
    goto/16 :goto_3

    .line 93
    .line 94
    :catch_0
    move-exception v0

    .line 95
    :goto_0
    move-object v4, v0

    .line 96
    goto/16 :goto_2

    .line 97
    .line 98
    :catchall_1
    move-exception v0

    .line 99
    move-object v1, v4

    .line 100
    goto/16 :goto_3

    .line 101
    .line 102
    :catch_1
    move-exception v0

    .line 103
    move-object v1, v4

    .line 104
    goto :goto_0

    .line 105
    :cond_0
    move-object v1, v4

    .line 106
    :try_start_2
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    if-eqz v4, :cond_1

    .line 111
    .line 112
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 113
    .line 114
    .line 115
    :cond_1
    new-instance v4, Ljava/io/BufferedInputStream;

    .line 116
    .line 117
    iget-object v9, v1, Lhz0;->j:Ljava/lang/Object;

    .line 118
    .line 119
    check-cast v9, Ljava/net/HttpURLConnection;

    .line 120
    .line 121
    invoke-virtual {v9}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 122
    .line 123
    .line 124
    move-result-object v9

    .line 125
    invoke-direct {v4, v9}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 126
    .line 127
    .line 128
    new-instance v9, Ljava/io/FileOutputStream;

    .line 129
    .line 130
    invoke-direct {v9, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 131
    .line 132
    .line 133
    const/16 v10, 0x1000

    .line 134
    .line 135
    new-array v10, v10, [B

    .line 136
    .line 137
    const-wide/16 v13, 0x0

    .line 138
    .line 139
    :goto_1
    invoke-virtual {v4, v10}, Ljava/io/InputStream;->read([B)I

    .line 140
    .line 141
    .line 142
    move-result v15
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 143
    const-wide/16 v16, 0x0

    .line 144
    .line 145
    const/4 v11, -0x1

    .line 146
    if-eq v15, v11, :cond_3

    .line 147
    .line 148
    int-to-long v11, v15

    .line 149
    add-long/2addr v13, v11

    .line 150
    iget-wide v11, v0, Lvf1;->m:J

    .line 151
    .line 152
    cmp-long v18, v11, v16

    .line 153
    .line 154
    if-lez v18, :cond_2

    .line 155
    .line 156
    const-wide/16 v18, 0x64

    .line 157
    .line 158
    mul-long v18, v18, v13

    .line 159
    .line 160
    :try_start_3
    div-long v11, v18, v11

    .line 161
    .line 162
    long-to-int v11, v11

    .line 163
    new-instance v12, Lpf1;

    .line 164
    .line 165
    invoke-direct {v12, v5, v11}, Lpf1;-><init>(Landroid/widget/ProgressBar;I)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v3, v12}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 169
    .line 170
    .line 171
    :cond_2
    const/4 v11, 0x0

    .line 172
    invoke-virtual {v9, v10, v11, v15}, Ljava/io/FileOutputStream;->write([BII)V

    .line 173
    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_3
    invoke-virtual {v9}, Ljava/io/OutputStream;->flush()V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v9}, Ljava/io/FileOutputStream;->close()V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 183
    .line 184
    .line 185
    move-object v4, v5

    .line 186
    move v5, v6

    .line 187
    move-object v6, v7

    .line 188
    move-object v7, v8

    .line 189
    move-object v8, v2

    .line 190
    :try_start_4
    new-instance v2, Lqf1;

    .line 191
    .line 192
    invoke-direct/range {v2 .. v8}, Lqf1;-><init>(Lcom/melodix/music/MainActivity;Landroid/widget/ProgressBar;ZLandroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;Ljava/io/File;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 193
    .line 194
    .line 195
    move-object v8, v7

    .line 196
    move-object v7, v6

    .line 197
    move v6, v5

    .line 198
    move-object v5, v4

    .line 199
    :try_start_5
    invoke-virtual {v3, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 200
    .line 201
    .line 202
    iget-object v0, v1, Lhz0;->j:Ljava/lang/Object;

    .line 203
    .line 204
    check-cast v0, Ljava/net/HttpURLConnection;

    .line 205
    .line 206
    if-eqz v0, :cond_4

    .line 207
    .line 208
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 209
    .line 210
    .line 211
    return-void

    .line 212
    :catch_2
    move-exception v0

    .line 213
    move-object v8, v7

    .line 214
    move-object v7, v6

    .line 215
    move v6, v5

    .line 216
    move-object v5, v4

    .line 217
    goto :goto_0

    .line 218
    :goto_2
    :try_start_6
    new-instance v2, Lqf1;

    .line 219
    .line 220
    const/4 v9, 0x1

    .line 221
    invoke-direct/range {v2 .. v9}, Lqf1;-><init>(Lcom/melodix/music/MainActivity;Ljava/io/Serializable;Landroid/widget/ProgressBar;ZLandroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;I)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v3, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 225
    .line 226
    .line 227
    iget-object v0, v1, Lhz0;->j:Ljava/lang/Object;

    .line 228
    .line 229
    check-cast v0, Ljava/net/HttpURLConnection;

    .line 230
    .line 231
    if-eqz v0, :cond_4

    .line 232
    .line 233
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 234
    .line 235
    .line 236
    :cond_4
    return-void

    .line 237
    :goto_3
    iget-object v1, v1, Lhz0;->j:Ljava/lang/Object;

    .line 238
    .line 239
    check-cast v1, Ljava/net/HttpURLConnection;

    .line 240
    .line 241
    if-eqz v1, :cond_5

    .line 242
    .line 243
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 244
    .line 245
    .line 246
    :cond_5
    throw v0
.end method
