.class public final synthetic Lx3;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 9
    iput p1, p0, Lx3;->j:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lk8;)V
    .locals 0

    .line 1
    const/16 p1, 0xc

    .line 2
    .line 3
    iput p1, p0, Lx3;->j:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private final a()V
    .locals 0

    .line 1
    return-void
.end method

.method private final b()V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget p0, p0, Lx3;->j:I

    .line 2
    .line 3
    const-string v0, "AutoSleep"

    .line 4
    .line 5
    const-string v1, "0"

    .line 6
    .line 7
    const-string v2, "if (typeof window.onNativePipChanged === \'function\') window.onNativePipChanged(false);"

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    const/4 v4, 0x0

    .line 11
    packed-switch p0, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :pswitch_0
    sput-boolean v4, Lcom/melodix/music/MainActivity;->i0:Z

    .line 16
    .line 17
    return-void

    .line 18
    :pswitch_1
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 19
    .line 20
    sget-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, v2, v3}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void

    .line 28
    :pswitch_2
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 29
    .line 30
    sget-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 31
    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    const-string v0, "if (typeof window.onNativePipChanged === \'function\') window.onNativePipChanged(true);"

    .line 35
    .line 36
    invoke-virtual {p0, v0, v3}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void

    .line 40
    :pswitch_3
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 41
    .line 42
    sget-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 43
    .line 44
    if-eqz p0, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0, v2, v3}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    return-void

    .line 50
    :pswitch_4
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 51
    .line 52
    :pswitch_5
    return-void

    .line 53
    :pswitch_6
    sget-object p0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 54
    .line 55
    if-eqz p0, :cond_3

    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 62
    .line 63
    if-eqz p0, :cond_3

    .line 64
    .line 65
    new-instance v2, Ls4;

    .line 66
    .line 67
    const/4 v5, 0x3

    .line 68
    invoke-direct {v2, p0, v5}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 72
    .line 73
    .line 74
    :cond_3
    sput v4, Lcom/melodix/music/AppSingleton;->j:I

    .line 75
    .line 76
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 77
    .line 78
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 87
    .line 88
    .line 89
    sget p0, Lcom/melodix/music/AppSingleton;->P:I

    .line 90
    .line 91
    if-gtz p0, :cond_7

    .line 92
    .line 93
    const/4 p0, 0x5

    .line 94
    :try_start_0
    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    const v2, 0x7f030005

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 110
    .line 111
    .line 112
    array-length v2, v0

    .line 113
    :goto_0
    if-ge v4, v2, :cond_5

    .line 114
    .line 115
    aget-object v5, v0, v4

    .line 116
    .line 117
    invoke-static {v5, v1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v6

    .line 121
    if-nez v6, :cond_4

    .line 122
    .line 123
    move-object v3, v5

    .line 124
    goto :goto_1

    .line 125
    :cond_4
    add-int/lit8 v4, v4, 0x1

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_5
    :goto_1
    if-eqz v3, :cond_6

    .line 129
    .line 130
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    :catch_0
    :cond_6
    sput p0, Lcom/melodix/music/AppSingleton;->k:I

    .line 135
    .line 136
    :cond_7
    sget-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 137
    .line 138
    if-nez p0, :cond_8

    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_8
    new-instance v0, Landroid/os/Handler;

    .line 142
    .line 143
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 148
    .line 149
    .line 150
    new-instance v1, La3;

    .line 151
    .line 152
    const/4 v2, 0x1

    .line 153
    invoke-direct {v1, v2, p0}, La3;-><init>(ILjava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 157
    .line 158
    .line 159
    :goto_2
    return-void

    .line 160
    :pswitch_7
    sget-object p0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 161
    .line 162
    if-eqz p0, :cond_9

    .line 163
    .line 164
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 169
    .line 170
    if-eqz p0, :cond_9

    .line 171
    .line 172
    new-instance v2, Ls4;

    .line 173
    .line 174
    const/4 v3, 0x2

    .line 175
    invoke-direct {v2, p0, v3}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p0, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 179
    .line 180
    .line 181
    :cond_9
    sput v4, Lcom/melodix/music/AppSingleton;->k:I

    .line 182
    .line 183
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 184
    .line 185
    sput-boolean v4, Lcom/melodix/music/AppSingleton;->A:Z

    .line 186
    .line 187
    sput-boolean v4, Lcom/melodix/music/AppSingleton;->l:Z

    .line 188
    .line 189
    sput v4, Lcom/melodix/music/AppSingleton;->j:I

    .line 190
    .line 191
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 200
    .line 201
    .line 202
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    const-string v0, "ServiceOn"

    .line 207
    .line 208
    invoke-interface {p0, v0, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 213
    .line 214
    .line 215
    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    new-instance v0, Landroid/content/Intent;

    .line 220
    .line 221
    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    const-class v2, Lcom/melodix/music/WebService;

    .line 226
    .line 227
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 228
    .line 229
    .line 230
    invoke-virtual {p0, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    .line 231
    .line 232
    .line 233
    invoke-static {}, Lm9;->k()V

    .line 234
    .line 235
    .line 236
    return-void

    .line 237
    :pswitch_8
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 238
    .line 239
    sget-object p0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 240
    .line 241
    if-eqz p0, :cond_a

    .line 242
    .line 243
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 248
    .line 249
    if-eqz p0, :cond_a

    .line 250
    .line 251
    new-instance v0, Ls4;

    .line 252
    .line 253
    const/16 v1, 0xc

    .line 254
    .line 255
    invoke-direct {v0, p0, v1}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 259
    .line 260
    .line 261
    :cond_a
    return-void

    .line 262
    :pswitch_9
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 263
    .line 264
    invoke-static {}, Lm9;->i()Z

    .line 265
    .line 266
    .line 267
    move-result p0

    .line 268
    if-eqz p0, :cond_b

    .line 269
    .line 270
    sget-boolean p0, Lcom/melodix/music/AppSingleton;->B:Z

    .line 271
    .line 272
    if-eqz p0, :cond_b

    .line 273
    .line 274
    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 275
    .line 276
    .line 277
    move-result-object p0

    .line 278
    invoke-static {p0}, Lm9;->g(Landroid/content/Context;)Landroid/webkit/WebView;

    .line 279
    .line 280
    .line 281
    :cond_b
    return-void

    .line 282
    :pswitch_a
    sget-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 283
    .line 284
    if-eqz p0, :cond_c

    .line 285
    .line 286
    invoke-virtual {p0, v4}, Landroid/view/View;->dispatchWindowVisibilityChanged(I)V

    .line 287
    .line 288
    .line 289
    :cond_c
    return-void

    .line 290
    :pswitch_b
    sget p0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerSchedulerBroadcastReceiver;->a:I

    .line 291
    .line 292
    return-void

    .line 293
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
