.class public Lwa0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:I

.field public static final b:Lwa0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Lbb0;->e:I

    .line 2
    .line 3
    const v0, 0xbdfcb8

    .line 4
    .line 5
    .line 6
    sput v0, Lwa0;->a:I

    .line 7
    .line 8
    new-instance v0, Lwa0;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lwa0;->b:Lwa0;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(ILandroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    const-string v0, "com.google.android.gms"

    .line 3
    .line 4
    if-eq p1, p0, :cond_1

    .line 5
    .line 6
    const/4 p0, 0x2

    .line 7
    if-eq p1, p0, :cond_1

    .line 8
    .line 9
    const/4 p0, 0x3

    .line 10
    const/4 p2, 0x0

    .line 11
    if-eq p1, p0, :cond_0

    .line 12
    .line 13
    return-object p2

    .line 14
    :cond_0
    const-string p0, "package"

    .line 15
    .line 16
    invoke-static {p0, v0, p2}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance p1, Landroid/content/Intent;

    .line 21
    .line 22
    const-string p2, "android.settings.APPLICATION_DETAILS_SETTINGS"

    .line 23
    .line 24
    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    return-object p1

    .line 31
    :cond_1
    if-eqz p2, :cond_3

    .line 32
    .line 33
    invoke-static {p2}, Lk42;->j(Landroid/content/Context;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-nez p0, :cond_2

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    new-instance p0, Landroid/content/Intent;

    .line 41
    .line 42
    const-string p1, "com.google.android.clockwork.home.UPDATE_ANDROID_WEAR_ACTION"

    .line 43
    .line 44
    invoke-direct {p0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const-string p1, "com.google.android.wearable.app"

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_3
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string p1, "gcore_"

    .line 56
    .line 57
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    sget p1, Lwa0;->a:I

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string p1, "-"

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-nez v1, :cond_4

    .line 75
    .line 76
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    :cond_4
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    if-eqz p2, :cond_5

    .line 83
    .line 84
    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p3

    .line 88
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    :cond_5
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    if-eqz p2, :cond_6

    .line 95
    .line 96
    :try_start_0
    invoke-static {p2}, Lal1;->a(Landroid/content/Context;)Lb00;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    const/4 p3, 0x0

    .line 105
    invoke-virtual {p1, p3, p2}, Lb00;->b(ILjava/lang/String;)Landroid/content/pm/PackageInfo;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iget p1, p1, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 110
    .line 111
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    .line 113
    .line 114
    :catch_0
    :cond_6
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    new-instance p1, Landroid/content/Intent;

    .line 119
    .line 120
    const-string p2, "android.intent.action.VIEW"

    .line 121
    .line 122
    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    const-string p2, "market://details"

    .line 126
    .line 127
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    invoke-virtual {p2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    const-string p3, "id"

    .line 136
    .line 137
    invoke-virtual {p2, p3, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 142
    .line 143
    .line 144
    move-result p3

    .line 145
    if-nez p3, :cond_7

    .line 146
    .line 147
    const-string p3, "pcampaignid"

    .line 148
    .line 149
    invoke-virtual {p2, p3, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 150
    .line 151
    .line 152
    :cond_7
    invoke-virtual {p2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p1, p0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 157
    .line 158
    .line 159
    const-string p0, "com.android.vending"

    .line 160
    .line 161
    invoke-virtual {p1, p0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 162
    .line 163
    .line 164
    const/high16 p0, 0x80000

    .line 165
    .line 166
    invoke-virtual {p1, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 167
    .line 168
    .line 169
    return-object p1
.end method

.method public b(Landroid/content/Context;I)I
    .locals 8

    .line 1
    sget p0, Lbb0;->e:I

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const v0, 0x7f11003f

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    :catchall_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "com.google.android.gms"

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const/4 v0, 0x1

    .line 24
    if-nez p0, :cond_5

    .line 25
    .line 26
    sget-object p0, Lbb0;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    goto/16 :goto_3

    .line 35
    .line 36
    :cond_0
    sget-object p0, Lst;->d:Ljava/lang/Object;

    .line 37
    .line 38
    monitor-enter p0

    .line 39
    :try_start_1
    sget-boolean v1, Lst;->e:Z

    .line 40
    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    monitor-exit p0

    .line 44
    goto :goto_1

    .line 45
    :catchall_1
    move-exception p1

    .line 46
    goto/16 :goto_2

    .line 47
    .line 48
    :cond_1
    sput-boolean v0, Lst;->e:Z

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-static {p1}, Lal1;->a(Landroid/content/Context;)Lb00;

    .line 55
    .line 56
    .line 57
    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 58
    :try_start_2
    iget-object v2, v2, Lb00;->a:Landroid/content/Context;

    .line 59
    .line 60
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    const/16 v3, 0x80

    .line 65
    .line 66
    invoke-virtual {v2, v1, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 71
    .line 72
    if-nez v1, :cond_2

    .line 73
    .line 74
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 75
    goto :goto_1

    .line 76
    :cond_2
    :try_start_4
    const-string v2, "com.google.app.id"

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    const-string v2, "com.google.android.gms.version"

    .line 82
    .line 83
    invoke-virtual {v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    sput v1, Lst;->f:I
    :try_end_4
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :catch_0
    move-exception v1

    .line 91
    :try_start_5
    const-string v2, "MetadataValueReader"

    .line 92
    .line 93
    const-string v3, "This should never happen."

    .line 94
    .line 95
    invoke-static {v2, v3, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 96
    .line 97
    .line 98
    :goto_0
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 99
    :goto_1
    sget p0, Lst;->f:I

    .line 100
    .line 101
    if-eqz p0, :cond_4

    .line 102
    .line 103
    const v1, 0xbdfcb8

    .line 104
    .line 105
    .line 106
    if-ne p0, v1, :cond_3

    .line 107
    .line 108
    goto :goto_3

    .line 109
    :cond_3
    new-instance p1, Lcom/google/android/gms/common/GooglePlayServicesIncorrectManifestValueException;

    .line 110
    .line 111
    sget p2, Lwa0;->a:I

    .line 112
    .line 113
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    add-int/lit8 v0, v0, 0x68

    .line 130
    .line 131
    add-int/2addr v0, v1

    .line 132
    add-int/lit16 v0, v0, 0xc2

    .line 133
    .line 134
    new-instance v1, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 137
    .line 138
    .line 139
    const-string v0, "The meta-data tag in your app\'s AndroidManifest.xml does not have the right value.  Expected "

    .line 140
    .line 141
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string p2, " but found "

    .line 148
    .line 149
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    const-string p0, ".  You must have the following declaration within the <application> element:     <meta-data android:name=\"com.google.android.gms.version\" android:value=\"@integer/google_play_services_version\" />"

    .line 156
    .line 157
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    throw p1

    .line 168
    :cond_4
    new-instance p0, Lcom/google/android/gms/common/GooglePlayServicesMissingManifestValueException;

    .line 169
    .line 170
    const-string p1, "A required meta-data tag in your app\'s AndroidManifest.xml does not exist.  You must have the following declaration within the <application> element:     <meta-data android:name=\"com.google.android.gms.version\" android:value=\"@integer/google_play_services_version\" />"

    .line 171
    .line 172
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    throw p0

    .line 176
    :goto_2
    :try_start_6
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 177
    throw p1

    .line 178
    :cond_5
    :goto_3
    invoke-static {p1}, Lk42;->j(Landroid/content/Context;)Z

    .line 179
    .line 180
    .line 181
    move-result p0

    .line 182
    const/4 v1, 0x0

    .line 183
    if-nez p0, :cond_8

    .line 184
    .line 185
    sget-object p0, Lk42;->r:Ljava/lang/Boolean;

    .line 186
    .line 187
    if-nez p0, :cond_7

    .line 188
    .line 189
    invoke-static {}, Lbe2;->q()Z

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    if-eqz p0, :cond_6

    .line 194
    .line 195
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    const-string v2, "android.hardware.type.embedded"

    .line 200
    .line 201
    invoke-virtual {p0, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 202
    .line 203
    .line 204
    move-result p0

    .line 205
    goto :goto_4

    .line 206
    :cond_6
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    const-string v2, "android.hardware.type.iot"

    .line 211
    .line 212
    invoke-virtual {p0, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 213
    .line 214
    .line 215
    move-result p0

    .line 216
    :goto_4
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    sput-object p0, Lk42;->r:Ljava/lang/Boolean;

    .line 221
    .line 222
    :cond_7
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 223
    .line 224
    .line 225
    move-result p0

    .line 226
    if-nez p0, :cond_8

    .line 227
    .line 228
    move p0, v0

    .line 229
    goto :goto_5

    .line 230
    :cond_8
    move p0, v1

    .line 231
    :goto_5
    if-ltz p2, :cond_9

    .line 232
    .line 233
    move v2, v0

    .line 234
    goto :goto_6

    .line 235
    :cond_9
    move v2, v1

    .line 236
    :goto_6
    invoke-static {v2}, Lbh;->c(Z)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 244
    .line 245
    .line 246
    move-result-object v3

    .line 247
    const/16 v4, 0x1c

    .line 248
    .line 249
    const/16 v5, 0x9

    .line 250
    .line 251
    if-eqz p0, :cond_b

    .line 252
    .line 253
    :try_start_7
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 254
    .line 255
    if-lt v6, v4, :cond_a

    .line 256
    .line 257
    const v6, 0x8002040

    .line 258
    .line 259
    .line 260
    goto :goto_7

    .line 261
    :cond_a
    const/16 v6, 0x2040

    .line 262
    .line 263
    :goto_7
    const-string v7, "com.android.vending"

    .line 264
    .line 265
    invoke-virtual {v3, v7, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 266
    .line 267
    .line 268
    move-result-object v6
    :try_end_7
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_7 .. :try_end_7} :catch_1

    .line 269
    goto :goto_8

    .line 270
    :catch_1
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    const-string p2, " requires the Google Play Store, but it is missing."

    .line 275
    .line 276
    invoke-virtual {p0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    goto/16 :goto_e

    .line 280
    .line 281
    :cond_b
    const/4 v6, 0x0

    .line 282
    :goto_8
    :try_start_8
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 283
    .line 284
    if-lt v7, v4, :cond_c

    .line 285
    .line 286
    const v4, 0x8000040

    .line 287
    .line 288
    .line 289
    goto :goto_9

    .line 290
    :cond_c
    const/16 v4, 0x40

    .line 291
    .line 292
    :goto_9
    const-string v7, "com.google.android.gms"

    .line 293
    .line 294
    invoke-virtual {v3, v7, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 295
    .line 296
    .line 297
    move-result-object v4
    :try_end_8
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_8 .. :try_end_8} :catch_3

    .line 298
    invoke-static {p1}, Lcb0;->a(Landroid/content/Context;)Lcb0;

    .line 299
    .line 300
    .line 301
    invoke-static {v4, v0}, Lcb0;->d(Landroid/content/pm/PackageInfo;Z)Z

    .line 302
    .line 303
    .line 304
    move-result v7

    .line 305
    if-nez v7, :cond_d

    .line 306
    .line 307
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object p0

    .line 311
    const-string p2, " requires Google Play services, but their signature is invalid."

    .line 312
    .line 313
    invoke-virtual {p0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    goto/16 :goto_e

    .line 317
    .line 318
    :cond_d
    if-eqz p0, :cond_e

    .line 319
    .line 320
    invoke-static {v6}, Lbh;->h(Ljava/lang/Object;)V

    .line 321
    .line 322
    .line 323
    invoke-static {v6, v0}, Lcb0;->d(Landroid/content/pm/PackageInfo;Z)Z

    .line 324
    .line 325
    .line 326
    move-result v7

    .line 327
    if-nez v7, :cond_e

    .line 328
    .line 329
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object p0

    .line 333
    const-string p2, " requires Google Play Store, but its signature is invalid."

    .line 334
    .line 335
    invoke-virtual {p0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    goto/16 :goto_e

    .line 339
    .line 340
    :cond_e
    if-eqz p0, :cond_f

    .line 341
    .line 342
    if-eqz v6, :cond_f

    .line 343
    .line 344
    iget-object p0, v6, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 345
    .line 346
    aget-object p0, p0, v1

    .line 347
    .line 348
    iget-object v6, v4, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 349
    .line 350
    aget-object v6, v6, v1

    .line 351
    .line 352
    invoke-virtual {p0, v6}, Landroid/content/pm/Signature;->equals(Ljava/lang/Object;)Z

    .line 353
    .line 354
    .line 355
    move-result p0

    .line 356
    if-nez p0, :cond_f

    .line 357
    .line 358
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object p0

    .line 362
    const-string p2, " requires Google Play Store, but its signature doesn\'t match that of Google Play services."

    .line 363
    .line 364
    invoke-virtual {p0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    goto/16 :goto_e

    .line 368
    .line 369
    :cond_f
    iget p0, v4, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 370
    .line 371
    const/4 v5, -0x1

    .line 372
    if-ne p0, v5, :cond_10

    .line 373
    .line 374
    move v6, v5

    .line 375
    goto :goto_a

    .line 376
    :cond_10
    div-int/lit16 v6, p0, 0x3e8

    .line 377
    .line 378
    :goto_a
    if-ne p2, v5, :cond_11

    .line 379
    .line 380
    goto :goto_b

    .line 381
    :cond_11
    div-int/lit16 v5, p2, 0x3e8

    .line 382
    .line 383
    :goto_b
    if-ge v6, v5, :cond_12

    .line 384
    .line 385
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v2

    .line 389
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 390
    .line 391
    .line 392
    move-result v2

    .line 393
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 394
    .line 395
    .line 396
    move-result-object p2

    .line 397
    add-int/lit8 v2, v2, 0x31

    .line 398
    .line 399
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 400
    .line 401
    .line 402
    move-result p2

    .line 403
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 404
    .line 405
    .line 406
    move-result-object p0

    .line 407
    add-int/2addr v2, p2

    .line 408
    add-int/lit8 v2, v2, 0xb

    .line 409
    .line 410
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 411
    .line 412
    .line 413
    move-result p0

    .line 414
    new-instance p2, Ljava/lang/StringBuilder;

    .line 415
    .line 416
    add-int/2addr v2, p0

    .line 417
    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 418
    .line 419
    .line 420
    const/4 v5, 0x2

    .line 421
    goto :goto_e

    .line 422
    :cond_12
    iget-object p0, v4, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 423
    .line 424
    if-nez p0, :cond_13

    .line 425
    .line 426
    :try_start_9
    const-string p0, "com.google.android.gms"

    .line 427
    .line 428
    invoke-virtual {v3, p0, v1}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 429
    .line 430
    .line 431
    move-result-object p0
    :try_end_9
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_9 .. :try_end_9} :catch_2

    .line 432
    goto :goto_d

    .line 433
    :catch_2
    move-exception p0

    .line 434
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object p2

    .line 438
    const-string v2, " requires Google Play services, but they\'re missing when getting application info."

    .line 439
    .line 440
    const-string v3, "GooglePlayServicesUtil"

    .line 441
    .line 442
    invoke-virtual {p2, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 443
    .line 444
    .line 445
    move-result-object p2

    .line 446
    invoke-static {v3, p2, p0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 447
    .line 448
    .line 449
    :goto_c
    move v5, v0

    .line 450
    goto :goto_e

    .line 451
    :cond_13
    :goto_d
    iget-boolean p0, p0, Landroid/content/pm/ApplicationInfo;->enabled:Z

    .line 452
    .line 453
    if-nez p0, :cond_14

    .line 454
    .line 455
    const/4 v5, 0x3

    .line 456
    goto :goto_e

    .line 457
    :cond_14
    move v5, v1

    .line 458
    goto :goto_e

    .line 459
    :catch_3
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 460
    .line 461
    .line 462
    move-result-object p0

    .line 463
    const-string p2, " requires Google Play services, but they are missing."

    .line 464
    .line 465
    invoke-virtual {p0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 466
    .line 467
    .line 468
    goto :goto_c

    .line 469
    :goto_e
    const/16 p0, 0x12

    .line 470
    .line 471
    if-ne v5, p0, :cond_15

    .line 472
    .line 473
    goto :goto_f

    .line 474
    :cond_15
    if-ne v5, v0, :cond_18

    .line 475
    .line 476
    const-string p2, "com.google.android.gms"

    .line 477
    .line 478
    :try_start_a
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 479
    .line 480
    .line 481
    move-result-object v2

    .line 482
    invoke-virtual {v2}, Landroid/content/pm/PackageManager;->getPackageInstaller()Landroid/content/pm/PackageInstaller;

    .line 483
    .line 484
    .line 485
    move-result-object v2

    .line 486
    invoke-virtual {v2}, Landroid/content/pm/PackageInstaller;->getAllSessions()Ljava/util/List;

    .line 487
    .line 488
    .line 489
    move-result-object v2
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_4

    .line 490
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 491
    .line 492
    .line 493
    move-result-object v2

    .line 494
    :cond_16
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 495
    .line 496
    .line 497
    move-result v3

    .line 498
    if-eqz v3, :cond_17

    .line 499
    .line 500
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 501
    .line 502
    .line 503
    move-result-object v3

    .line 504
    check-cast v3, Landroid/content/pm/PackageInstaller$SessionInfo;

    .line 505
    .line 506
    invoke-virtual {v3}, Landroid/content/pm/PackageInstaller$SessionInfo;->getAppPackageName()Ljava/lang/String;

    .line 507
    .line 508
    .line 509
    move-result-object v3

    .line 510
    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 511
    .line 512
    .line 513
    move-result v3

    .line 514
    if-eqz v3, :cond_16

    .line 515
    .line 516
    goto :goto_f

    .line 517
    :cond_17
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 518
    .line 519
    .line 520
    move-result-object p1

    .line 521
    const/16 v0, 0x2000

    .line 522
    .line 523
    :try_start_b
    invoke-virtual {p1, p2, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 524
    .line 525
    .line 526
    move-result-object p1

    .line 527
    iget-boolean p1, p1, Landroid/content/pm/ApplicationInfo;->enabled:Z
    :try_end_b
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_b .. :try_end_b} :catch_4

    .line 528
    .line 529
    move v0, p1

    .line 530
    goto :goto_f

    .line 531
    :catch_4
    :cond_18
    move v0, v1

    .line 532
    :goto_f
    if-eqz v0, :cond_19

    .line 533
    .line 534
    return p0

    .line 535
    :cond_19
    return v5
.end method
