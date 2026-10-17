.class public final synthetic Ll6;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;I)V
    .locals 0

    .line 10
    iput p2, p0, Ll6;->j:I

    iput-object p1, p0, Ll6;->k:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Landroidx/profileinstaller/ProfileInstallerInitializer;Landroid/content/Context;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput p1, p0, Ll6;->j:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, Ll6;->k:Landroid/content/Context;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    .line 1
    iget v0, p0, Ll6;->j:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iget-object p0, p0, Ll6;->k:Landroid/content/Context;

    .line 5
    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    new-instance v0, Ljm0;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    sget-object v1, Lrs0;->b:Lmz;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-static {p0, v0, v1, v2}, Lrs0;->p(Landroid/content/Context;Ljava/util/concurrent/Executor;Lqv0;Z)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :pswitch_0
    new-instance v3, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 22
    .line 23
    new-instance v9, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 24
    .line 25
    invoke-direct {v9}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 26
    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    const/4 v5, 0x1

    .line 30
    const-wide/16 v6, 0x0

    .line 31
    .line 32
    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 33
    .line 34
    invoke-direct/range {v3 .. v9}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Ll6;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    invoke-direct {v0, p0, v1}, Ll6;-><init>(Landroid/content/Context;I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :pswitch_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 48
    .line 49
    const/16 v2, 0x1c

    .line 50
    .line 51
    if-lt v0, v2, :cond_0

    .line 52
    .line 53
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v0}, Ltv0;->a(Landroid/os/Looper;)Landroid/os/Handler;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    goto :goto_0

    .line 62
    :cond_0
    new-instance v0, Landroid/os/Handler;

    .line 63
    .line 64
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-direct {v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 69
    .line 70
    .line 71
    :goto_0
    new-instance v2, Ljava/util/Random;

    .line 72
    .line 73
    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    .line 74
    .line 75
    .line 76
    const/16 v3, 0x3e8

    .line 77
    .line 78
    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    invoke-virtual {v2, v1}, Ljava/util/Random;->nextInt(I)I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    new-instance v2, Ll6;

    .line 87
    .line 88
    const/4 v3, 0x2

    .line 89
    invoke-direct {v2, p0, v3}, Ll6;-><init>(Landroid/content/Context;I)V

    .line 90
    .line 91
    .line 92
    add-int/lit16 v1, v1, 0x1388

    .line 93
    .line 94
    int-to-long v3, v1

    .line 95
    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :pswitch_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 100
    .line 101
    const/16 v2, 0x21

    .line 102
    .line 103
    if-lt v0, v2, :cond_6

    .line 104
    .line 105
    new-instance v3, Landroid/content/ComponentName;

    .line 106
    .line 107
    const-string v4, "androidx.appcompat.app.AppLocalesMetadataHolderService"

    .line 108
    .line 109
    invoke-direct {v3, p0, v4}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    invoke-virtual {v4, v3}, Landroid/content/pm/PackageManager;->getComponentEnabledSetting(Landroid/content/ComponentName;)I

    .line 117
    .line 118
    .line 119
    move-result v4

    .line 120
    if-eq v4, v1, :cond_6

    .line 121
    .line 122
    const-string v4, "locale"

    .line 123
    .line 124
    if-lt v0, v2, :cond_3

    .line 125
    .line 126
    sget-object v0, Lq6;->p:Lha;

    .line 127
    .line 128
    invoke-virtual {v0}, Lha;->iterator()Ljava/util/Iterator;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    :cond_1
    move-object v2, v0

    .line 133
    check-cast v2, Lgl0;

    .line 134
    .line 135
    invoke-virtual {v2}, Lgl0;->hasNext()Z

    .line 136
    .line 137
    .line 138
    move-result v5

    .line 139
    if-eqz v5, :cond_2

    .line 140
    .line 141
    invoke-virtual {v2}, Lgl0;->next()Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 146
    .line 147
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    check-cast v2, Lq6;

    .line 152
    .line 153
    if-eqz v2, :cond_1

    .line 154
    .line 155
    check-cast v2, Lg7;

    .line 156
    .line 157
    iget-object v2, v2, Lg7;->t:Landroid/content/Context;

    .line 158
    .line 159
    if-eqz v2, :cond_1

    .line 160
    .line 161
    invoke-virtual {v2, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    goto :goto_1

    .line 166
    :cond_2
    const/4 v0, 0x0

    .line 167
    :goto_1
    if-eqz v0, :cond_4

    .line 168
    .line 169
    invoke-static {v0}, Ln6;->a(Ljava/lang/Object;)Landroid/os/LocaleList;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    new-instance v2, Lbk0;

    .line 174
    .line 175
    new-instance v5, Lck0;

    .line 176
    .line 177
    invoke-direct {v5, v0}, Lck0;-><init>(Landroid/os/LocaleList;)V

    .line 178
    .line 179
    .line 180
    invoke-direct {v2, v5}, Lbk0;-><init>(Lck0;)V

    .line 181
    .line 182
    .line 183
    goto :goto_2

    .line 184
    :cond_3
    sget-object v2, Lq6;->l:Lbk0;

    .line 185
    .line 186
    if-eqz v2, :cond_4

    .line 187
    .line 188
    goto :goto_2

    .line 189
    :cond_4
    sget-object v2, Lbk0;->b:Lbk0;

    .line 190
    .line 191
    :goto_2
    iget-object v0, v2, Lbk0;->a:Lck0;

    .line 192
    .line 193
    iget-object v0, v0, Lck0;->a:Landroid/os/LocaleList;

    .line 194
    .line 195
    invoke-virtual {v0}, Landroid/os/LocaleList;->isEmpty()Z

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    if-eqz v0, :cond_5

    .line 200
    .line 201
    invoke-static {p0}, Lbh;->z(Landroid/content/Context;)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    if-eqz v2, :cond_5

    .line 210
    .line 211
    invoke-static {v0}, Lm6;->a(Ljava/lang/String;)Landroid/os/LocaleList;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-static {v2, v0}, Ln6;->b(Ljava/lang/Object;Landroid/os/LocaleList;)V

    .line 216
    .line 217
    .line 218
    :cond_5
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    invoke-virtual {p0, v3, v1, v1}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    .line 223
    .line 224
    .line 225
    :cond_6
    sput-boolean v1, Lq6;->o:Z

    .line 226
    .line 227
    return-void

    .line 228
    nop

    .line 229
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
