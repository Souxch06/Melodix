.class public abstract Lvq0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field mBigContentTitle:Ljava/lang/CharSequence;

.field protected mBuilder:Lgq0;

.field mSummaryText:Ljava/lang/CharSequence;

.field mSummaryTextSet:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lvq0;->mSummaryTextSet:Z

    .line 6
    .line 7
    return-void
.end method

.method public static constructCompatStyleByName(Ljava/lang/String;)Lvq0;
    .locals 4

    .line 1
    if-eqz p0, :cond_6

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, -0x1

    .line 10
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :sswitch_0
    const-string v0, "androidx.core.app.NotificationCompat$MessagingStyle"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v3, 0x5

    .line 24
    goto :goto_0

    .line 25
    :sswitch_1
    const-string v0, "androidx.core.app.NotificationCompat$BigTextStyle"

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 v3, 0x4

    .line 35
    goto :goto_0

    .line 36
    :sswitch_2
    const-string v0, "androidx.core.app.NotificationCompat$InboxStyle"

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    const/4 v3, 0x3

    .line 46
    goto :goto_0

    .line 47
    :sswitch_3
    const-string v0, "androidx.core.app.NotificationCompat$CallStyle"

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-nez p0, :cond_3

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    const/4 v3, 0x2

    .line 57
    goto :goto_0

    .line 58
    :sswitch_4
    const-string v0, "androidx.core.app.NotificationCompat$BigPictureStyle"

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-nez p0, :cond_4

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_4
    move v3, v1

    .line 68
    goto :goto_0

    .line 69
    :sswitch_5
    const-string v0, "androidx.core.app.NotificationCompat$DecoratedCustomViewStyle"

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-nez p0, :cond_5

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_5
    move v3, v2

    .line 79
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :pswitch_0
    new-instance p0, Luq0;

    .line 84
    .line 85
    invoke-direct {p0}, Luq0;-><init>()V

    .line 86
    .line 87
    .line 88
    return-object p0

    .line 89
    :pswitch_1
    new-instance p0, Lfq0;

    .line 90
    .line 91
    invoke-direct {p0, v2}, Lfq0;-><init>(I)V

    .line 92
    .line 93
    .line 94
    return-object p0

    .line 95
    :pswitch_2
    new-instance p0, Lfq0;

    .line 96
    .line 97
    invoke-direct {p0, v1}, Lfq0;-><init>(I)V

    .line 98
    .line 99
    .line 100
    return-object p0

    .line 101
    :pswitch_3
    new-instance p0, Llq0;

    .line 102
    .line 103
    invoke-direct {p0}, Lvq0;-><init>()V

    .line 104
    .line 105
    .line 106
    return-object p0

    .line 107
    :pswitch_4
    new-instance p0, Leq0;

    .line 108
    .line 109
    invoke-direct {p0}, Lvq0;-><init>()V

    .line 110
    .line 111
    .line 112
    return-object p0

    .line 113
    :pswitch_5
    new-instance p0, Lnq0;

    .line 114
    .line 115
    invoke-direct {p0}, Lvq0;-><init>()V

    .line 116
    .line 117
    .line 118
    return-object p0

    .line 119
    :cond_6
    :goto_1
    const/4 p0, 0x0

    .line 120
    return-object p0

    .line 121
    :sswitch_data_0
    .sparse-switch
        -0x2ab80d9c -> :sswitch_5
        -0xa3fb04d -> :sswitch_4
        0x2a94ad33 -> :sswitch_3
        0x366a678b -> :sswitch_2
        0x36cfe824 -> :sswitch_1
        0x7c9f11cd -> :sswitch_0
    .end sparse-switch

    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static constructCompatStyleForBundle(Landroid/os/Bundle;)Lvq0;
    .locals 3

    .line 1
    const-string v0, "androidx.core.app.extra.COMPAT_TEMPLATE"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lvq0;->constructCompatStyleByName(Ljava/lang/String;)Lvq0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    const-string v0, "android.selfDisplayName"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_d

    .line 21
    .line 22
    const-string v0, "android.messagingStyleUser"

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    goto/16 :goto_2

    .line 31
    .line 32
    :cond_1
    const-string v0, "android.picture"

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_c

    .line 39
    .line 40
    const-string v0, "android.pictureIcon"

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    goto/16 :goto_1

    .line 49
    .line 50
    :cond_2
    const-string v0, "android.bigText"

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    const/4 v1, 0x0

    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    new-instance p0, Lfq0;

    .line 60
    .line 61
    invoke-direct {p0, v1}, Lfq0;-><init>(I)V

    .line 62
    .line 63
    .line 64
    return-object p0

    .line 65
    :cond_3
    const-string v0, "android.textLines"

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    const/4 v2, 0x1

    .line 72
    if-eqz v0, :cond_4

    .line 73
    .line 74
    new-instance p0, Lfq0;

    .line 75
    .line 76
    invoke-direct {p0, v2}, Lfq0;-><init>(I)V

    .line 77
    .line 78
    .line 79
    return-object p0

    .line 80
    :cond_4
    const-string v0, "android.callType"

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_5

    .line 87
    .line 88
    new-instance p0, Llq0;

    .line 89
    .line 90
    invoke-direct {p0}, Lvq0;-><init>()V

    .line 91
    .line 92
    .line 93
    return-object p0

    .line 94
    :cond_5
    const-string v0, "android.template"

    .line 95
    .line 96
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    if-nez p0, :cond_6

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_6
    const-class v0, Landroid/app/Notification$BigPictureStyle;

    .line 104
    .line 105
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_7

    .line 114
    .line 115
    new-instance p0, Leq0;

    .line 116
    .line 117
    invoke-direct {p0}, Lvq0;-><init>()V

    .line 118
    .line 119
    .line 120
    return-object p0

    .line 121
    :cond_7
    const-class v0, Landroid/app/Notification$BigTextStyle;

    .line 122
    .line 123
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_8

    .line 132
    .line 133
    new-instance p0, Lfq0;

    .line 134
    .line 135
    invoke-direct {p0, v1}, Lfq0;-><init>(I)V

    .line 136
    .line 137
    .line 138
    return-object p0

    .line 139
    :cond_8
    const-class v0, Landroid/app/Notification$InboxStyle;

    .line 140
    .line 141
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_9

    .line 150
    .line 151
    new-instance p0, Lfq0;

    .line 152
    .line 153
    invoke-direct {p0, v2}, Lfq0;-><init>(I)V

    .line 154
    .line 155
    .line 156
    return-object p0

    .line 157
    :cond_9
    const-class v0, Landroid/app/Notification$MessagingStyle;

    .line 158
    .line 159
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-eqz v0, :cond_a

    .line 168
    .line 169
    new-instance p0, Luq0;

    .line 170
    .line 171
    invoke-direct {p0}, Luq0;-><init>()V

    .line 172
    .line 173
    .line 174
    return-object p0

    .line 175
    :cond_a
    const-class v0, Landroid/app/Notification$DecoratedCustomViewStyle;

    .line 176
    .line 177
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result p0

    .line 185
    if-eqz p0, :cond_b

    .line 186
    .line 187
    new-instance p0, Lnq0;

    .line 188
    .line 189
    invoke-direct {p0}, Lvq0;-><init>()V

    .line 190
    .line 191
    .line 192
    return-object p0

    .line 193
    :cond_b
    :goto_0
    const/4 p0, 0x0

    .line 194
    return-object p0

    .line 195
    :cond_c
    :goto_1
    new-instance p0, Leq0;

    .line 196
    .line 197
    invoke-direct {p0}, Lvq0;-><init>()V

    .line 198
    .line 199
    .line 200
    return-object p0

    .line 201
    :cond_d
    :goto_2
    new-instance p0, Luq0;

    .line 202
    .line 203
    invoke-direct {p0}, Luq0;-><init>()V

    .line 204
    .line 205
    .line 206
    return-object p0
.end method

.method public static constructStyleForExtras(Landroid/os/Bundle;)Lvq0;
    .locals 2

    .line 1
    invoke-static {p0}, Lvq0;->constructCompatStyleForBundle(Landroid/os/Bundle;)Lvq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    :try_start_0
    invoke-virtual {v0, p0}, Lvq0;->restoreFromCompatExtras(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :catch_0
    return-object v1
.end method

.method public static extractStyleFromNotification(Landroid/app/Notification;)Lvq0;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-static {p0}, Lvq0;->constructStyleForExtras(Landroid/os/Bundle;)Lvq0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public final a(Landroidx/core/graphics/drawable/IconCompat;II)Landroid/graphics/Bitmap;
    .locals 8

    .line 1
    iget-object p0, p0, Lvq0;->mBuilder:Lgq0;

    .line 2
    .line 3
    iget-object p0, p0, Lgq0;->a:Landroid/content/Context;

    .line 4
    .line 5
    iget v0, p1, Landroidx/core/graphics/drawable/IconCompat;->a:I

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    const/4 v2, 0x0

    .line 9
    if-ne v0, v1, :cond_4

    .line 10
    .line 11
    iget-object v0, p1, Landroidx/core/graphics/drawable/IconCompat;->b:Ljava/lang/Object;

    .line 12
    .line 13
    if-eqz v0, :cond_4

    .line 14
    .line 15
    check-cast v0, Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, ":"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-nez v3, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    const/4 v3, -0x1

    .line 27
    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    const/4 v5, 0x1

    .line 32
    aget-object v4, v4, v5

    .line 33
    .line 34
    const-string v6, "/"

    .line 35
    .line 36
    invoke-virtual {v4, v6, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v7

    .line 40
    aget-object v7, v7, v2

    .line 41
    .line 42
    invoke-virtual {v4, v6, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    aget-object v4, v4, v5

    .line 47
    .line 48
    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    aget-object v0, v0, v2

    .line 53
    .line 54
    const-string v1, "0_resource_name_obfuscated"

    .line 55
    .line 56
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    invoke-virtual {p1}, Landroidx/core/graphics/drawable/IconCompat;->e()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    const-string v3, "android"

    .line 68
    .line 69
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-eqz v3, :cond_2

    .line 74
    .line 75
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    goto :goto_0

    .line 80
    :cond_2
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    const/16 v5, 0x2000

    .line 85
    .line 86
    const/4 v6, 0x0

    .line 87
    :try_start_0
    invoke-virtual {v3, v1, v5}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    if-eqz v1, :cond_3

    .line 92
    .line 93
    invoke-virtual {v3, v1}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Landroid/content/pm/ApplicationInfo;)Landroid/content/res/Resources;

    .line 94
    .line 95
    .line 96
    move-result-object v1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    goto :goto_0

    .line 98
    :catch_0
    :cond_3
    move-object v1, v6

    .line 99
    :goto_0
    invoke-virtual {v1, v4, v7, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    iget v1, p1, Landroidx/core/graphics/drawable/IconCompat;->e:I

    .line 104
    .line 105
    if-eq v1, v0, :cond_4

    .line 106
    .line 107
    iput v0, p1, Landroidx/core/graphics/drawable/IconCompat;->e:I

    .line 108
    .line 109
    :cond_4
    :goto_1
    invoke-static {p1, p0}, Lld0;->g(Landroidx/core/graphics/drawable/IconCompat;Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-static {p1, p0}, Lld0;->f(Landroid/graphics/drawable/Icon;Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    if-nez p3, :cond_5

    .line 118
    .line 119
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    goto :goto_2

    .line 124
    :cond_5
    move p1, p3

    .line 125
    :goto_2
    if-nez p3, :cond_6

    .line 126
    .line 127
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 128
    .line 129
    .line 130
    move-result p3

    .line 131
    :cond_6
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 132
    .line 133
    invoke-static {p1, p3, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {p0, v2, v2, p1, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 138
    .line 139
    .line 140
    if-eqz p2, :cond_7

    .line 141
    .line 142
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    new-instance p3, Landroid/graphics/PorterDuffColorFilter;

    .line 147
    .line 148
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 149
    .line 150
    invoke-direct {p3, p2, v1}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p1, p3}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 154
    .line 155
    .line 156
    :cond_7
    new-instance p1, Landroid/graphics/Canvas;

    .line 157
    .line 158
    invoke-direct {p1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 162
    .line 163
    .line 164
    return-object v0
.end method

.method public addCompatExtras(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lvq0;->mSummaryTextSet:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "android.summaryText"

    .line 6
    .line 7
    iget-object v1, p0, Lvq0;->mSummaryText:Ljava/lang/CharSequence;

    .line 8
    .line 9
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lvq0;->mBigContentTitle:Ljava/lang/CharSequence;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const-string v1, "android.title.big"

    .line 17
    .line 18
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    invoke-virtual {p0}, Lvq0;->getClassName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const-string v0, "androidx.core.app.extra.COMPAT_TEMPLATE"

    .line 28
    .line 29
    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_2
    return-void
.end method

.method public abstract apply(Lzp0;)V
.end method

.method public applyStandardTemplate(ZIZ)Landroid/widget/RemoteViews;
    .locals 8

    .line 1
    iget-object p3, p0, Lvq0;->mBuilder:Lgq0;

    .line 2
    .line 3
    iget-object p3, p3, Lgq0;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    new-instance v0, Landroid/widget/RemoteViews;

    .line 10
    .line 11
    iget-object v1, p0, Lvq0;->mBuilder:Lgq0;

    .line 12
    .line 13
    iget-object v1, v1, Lgq0;->a:Landroid/content/Context;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-direct {v0, v1, p2}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Lvq0;->mBuilder:Lgq0;

    .line 23
    .line 24
    iget v1, p2, Lgq0;->i:I

    .line 25
    .line 26
    iget-object v1, p2, Lgq0;->h:Landroidx/core/graphics/drawable/IconCompat;

    .line 27
    .line 28
    const v2, 0x7f0900f1

    .line 29
    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v0, v2, v3}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 35
    .line 36
    .line 37
    iget-object p2, p0, Lvq0;->mBuilder:Lgq0;

    .line 38
    .line 39
    iget-object p2, p2, Lgq0;->h:Landroidx/core/graphics/drawable/IconCompat;

    .line 40
    .line 41
    invoke-virtual {p0, p2, v3}, Lvq0;->createColoredBitmap(Landroidx/core/graphics/drawable/IconCompat;I)Landroid/graphics/Bitmap;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {v0, v2, p2}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 46
    .line 47
    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    iget-object p1, p0, Lvq0;->mBuilder:Lgq0;

    .line 51
    .line 52
    iget-object p1, p1, Lgq0;->q:Landroid/app/Notification;

    .line 53
    .line 54
    iget p1, p1, Landroid/app/Notification;->icon:I

    .line 55
    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    const p1, 0x7f07030c

    .line 59
    .line 60
    .line 61
    invoke-virtual {p3, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    const p2, 0x7f07030e

    .line 66
    .line 67
    .line 68
    invoke-virtual {p3, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    mul-int/lit8 p2, p2, 0x2

    .line 73
    .line 74
    sub-int p2, p1, p2

    .line 75
    .line 76
    iget-object p3, p0, Lvq0;->mBuilder:Lgq0;

    .line 77
    .line 78
    iget-object p3, p3, Lgq0;->q:Landroid/app/Notification;

    .line 79
    .line 80
    iget p3, p3, Landroid/app/Notification;->icon:I

    .line 81
    .line 82
    invoke-virtual {p0, p3, p1, p2}, Lvq0;->b(III)Landroid/graphics/Bitmap;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    const p2, 0x7f090197

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, p2, p1}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, p2, v3}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_0
    if-eqz p1, :cond_1

    .line 97
    .line 98
    iget-object p1, p2, Lgq0;->q:Landroid/app/Notification;

    .line 99
    .line 100
    iget p1, p1, Landroid/app/Notification;->icon:I

    .line 101
    .line 102
    if-eqz p1, :cond_1

    .line 103
    .line 104
    invoke-virtual {v0, v2, v3}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 105
    .line 106
    .line 107
    const p1, 0x7f070309

    .line 108
    .line 109
    .line 110
    invoke-virtual {p3, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    const p2, 0x7f070306

    .line 115
    .line 116
    .line 117
    invoke-virtual {p3, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    sub-int/2addr p1, p2

    .line 122
    const p2, 0x7f07030f

    .line 123
    .line 124
    .line 125
    invoke-virtual {p3, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    iget-object p3, p0, Lvq0;->mBuilder:Lgq0;

    .line 130
    .line 131
    iget-object p3, p3, Lgq0;->q:Landroid/app/Notification;

    .line 132
    .line 133
    iget p3, p3, Landroid/app/Notification;->icon:I

    .line 134
    .line 135
    invoke-virtual {p0, p3, p1, p2}, Lvq0;->b(III)Landroid/graphics/Bitmap;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {v0, v2, p1}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 140
    .line 141
    .line 142
    :cond_1
    :goto_0
    iget-object p1, p0, Lvq0;->mBuilder:Lgq0;

    .line 143
    .line 144
    iget-object p1, p1, Lgq0;->e:Ljava/lang/CharSequence;

    .line 145
    .line 146
    if-eqz p1, :cond_2

    .line 147
    .line 148
    const p2, 0x7f0901fe

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0, p2, p1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 152
    .line 153
    .line 154
    :cond_2
    iget-object p1, p0, Lvq0;->mBuilder:Lgq0;

    .line 155
    .line 156
    iget-object p1, p1, Lgq0;->f:Ljava/lang/CharSequence;

    .line 157
    .line 158
    const/4 p2, 0x1

    .line 159
    if-eqz p1, :cond_3

    .line 160
    .line 161
    const p3, 0x7f0901ed

    .line 162
    .line 163
    .line 164
    invoke-virtual {v0, p3, p1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 165
    .line 166
    .line 167
    move p1, p2

    .line 168
    goto :goto_1

    .line 169
    :cond_3
    move p1, v3

    .line 170
    :goto_1
    iget-object p3, p0, Lvq0;->mBuilder:Lgq0;

    .line 171
    .line 172
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 173
    .line 174
    .line 175
    iget-object p3, p0, Lvq0;->mBuilder:Lgq0;

    .line 176
    .line 177
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 178
    .line 179
    .line 180
    const p3, 0x7f090100

    .line 181
    .line 182
    .line 183
    const/16 v1, 0x8

    .line 184
    .line 185
    invoke-virtual {v0, p3, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 186
    .line 187
    .line 188
    iget-object p3, p0, Lvq0;->mBuilder:Lgq0;

    .line 189
    .line 190
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 191
    .line 192
    .line 193
    iget-object p3, p0, Lvq0;->mBuilder:Lgq0;

    .line 194
    .line 195
    iget-boolean v2, p3, Lgq0;->j:Z

    .line 196
    .line 197
    const-wide/16 v4, 0x0

    .line 198
    .line 199
    if-eqz v2, :cond_4

    .line 200
    .line 201
    iget-object v2, p3, Lgq0;->q:Landroid/app/Notification;

    .line 202
    .line 203
    iget-wide v6, v2, Landroid/app/Notification;->when:J

    .line 204
    .line 205
    goto :goto_2

    .line 206
    :cond_4
    move-wide v6, v4

    .line 207
    :goto_2
    cmp-long v2, v6, v4

    .line 208
    .line 209
    if-eqz v2, :cond_6

    .line 210
    .line 211
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 212
    .line 213
    .line 214
    const p3, 0x7f0901fd

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0, p3, v3}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 218
    .line 219
    .line 220
    iget-object p0, p0, Lvq0;->mBuilder:Lgq0;

    .line 221
    .line 222
    iget-boolean v2, p0, Lgq0;->j:Z

    .line 223
    .line 224
    if-eqz v2, :cond_5

    .line 225
    .line 226
    iget-object p0, p0, Lgq0;->q:Landroid/app/Notification;

    .line 227
    .line 228
    iget-wide v4, p0, Landroid/app/Notification;->when:J

    .line 229
    .line 230
    :cond_5
    const-string p0, "setTime"

    .line 231
    .line 232
    invoke-virtual {v0, p3, p0, v4, v5}, Landroid/widget/RemoteViews;->setLong(ILjava/lang/String;J)V

    .line 233
    .line 234
    .line 235
    goto :goto_3

    .line 236
    :cond_6
    move p2, v3

    .line 237
    :goto_3
    if-eqz p2, :cond_7

    .line 238
    .line 239
    move p0, v3

    .line 240
    goto :goto_4

    .line 241
    :cond_7
    move p0, v1

    .line 242
    :goto_4
    const p2, 0x7f090198

    .line 243
    .line 244
    .line 245
    invoke-virtual {v0, p2, p0}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 246
    .line 247
    .line 248
    if-eqz p1, :cond_8

    .line 249
    .line 250
    goto :goto_5

    .line 251
    :cond_8
    move v3, v1

    .line 252
    :goto_5
    const p0, 0x7f09010f

    .line 253
    .line 254
    .line 255
    invoke-virtual {v0, p0, v3}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 256
    .line 257
    .line 258
    return-object v0
.end method

.method public final b(III)Landroid/graphics/Bitmap;
    .locals 3

    .line 1
    iget-object v0, p0, Lvq0;->mBuilder:Lgq0;

    .line 2
    .line 3
    iget-object v0, v0, Lgq0;->a:Landroid/content/Context;

    .line 4
    .line 5
    sget-object v1, Landroidx/core/graphics/drawable/IconCompat;->k:Landroid/graphics/PorterDuff$Mode;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const v2, 0x7f08011b

    .line 19
    .line 20
    .line 21
    invoke-static {v1, v0, v2}, Landroidx/core/graphics/drawable/IconCompat;->c(Landroid/content/res/Resources;Ljava/lang/String;I)Landroidx/core/graphics/drawable/IconCompat;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {p0, v0, v1, p2}, Lvq0;->a(Landroidx/core/graphics/drawable/IconCompat;II)Landroid/graphics/Bitmap;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Landroid/graphics/Canvas;

    .line 31
    .line 32
    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lvq0;->mBuilder:Lgq0;

    .line 36
    .line 37
    iget-object p0, p0, Lgq0;->a:Landroid/content/Context;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const/4 p1, 0x1

    .line 52
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setFilterBitmap(Z)V

    .line 53
    .line 54
    .line 55
    sub-int/2addr p2, p3

    .line 56
    div-int/lit8 p2, p2, 0x2

    .line 57
    .line 58
    add-int/2addr p3, p2

    .line 59
    invoke-virtual {p0, p2, p2, p3, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 60
    .line 61
    .line 62
    new-instance p1, Landroid/graphics/PorterDuffColorFilter;

    .line 63
    .line 64
    const/4 p2, -0x1

    .line 65
    sget-object p3, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 66
    .line 67
    invoke-direct {p1, p2, p3}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 74
    .line 75
    .line 76
    return-object v0
.end method

.method public build()Landroid/app/Notification;
    .locals 0

    .line 1
    iget-object p0, p0, Lvq0;->mBuilder:Lgq0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lgq0;->a()Landroid/app/Notification;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public buildIntoRemoteViews(Landroid/widget/RemoteViews;Landroid/widget/RemoteViews;)V
    .locals 6

    .line 1
    const v0, 0x7f0901fe

    .line 2
    .line 3
    .line 4
    const/16 v1, 0x8

    .line 5
    .line 6
    invoke-virtual {p1, v0, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 7
    .line 8
    .line 9
    const v0, 0x7f0901ee

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 13
    .line 14
    .line 15
    const v0, 0x7f0901ed

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 19
    .line 20
    .line 21
    const v0, 0x7f090160

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/widget/RemoteViews;->removeAllViews(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2}, Landroid/widget/RemoteViews;->clone()Landroid/widget/RemoteViews;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p1, v0, p2}, Landroid/widget/RemoteViews;->addView(ILandroid/widget/RemoteViews;)V

    .line 32
    .line 33
    .line 34
    const/4 p2, 0x0

    .line 35
    invoke-virtual {p1, v0, p2}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lvq0;->mBuilder:Lgq0;

    .line 39
    .line 40
    iget-object p0, p0, Lgq0;->a:Landroid/content/Context;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const p2, 0x7f070311

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    const v0, 0x7f070312

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iget p0, p0, Landroid/content/res/Configuration;->fontScale:F

    .line 65
    .line 66
    const/high16 v1, 0x3f800000    # 1.0f

    .line 67
    .line 68
    cmpg-float v2, p0, v1

    .line 69
    .line 70
    if-gez v2, :cond_0

    .line 71
    .line 72
    move p0, v1

    .line 73
    goto :goto_0

    .line 74
    :cond_0
    const v2, 0x3fa66666    # 1.3f

    .line 75
    .line 76
    .line 77
    cmpl-float v3, p0, v2

    .line 78
    .line 79
    if-lez v3, :cond_1

    .line 80
    .line 81
    move p0, v2

    .line 82
    :cond_1
    :goto_0
    sub-float/2addr p0, v1

    .line 83
    const v2, 0x3e999998    # 0.29999995f

    .line 84
    .line 85
    .line 86
    div-float/2addr p0, v2

    .line 87
    sub-float/2addr v1, p0

    .line 88
    int-to-float p2, p2

    .line 89
    mul-float/2addr v1, p2

    .line 90
    int-to-float p2, v0

    .line 91
    mul-float/2addr p0, p2

    .line 92
    add-float/2addr p0, v1

    .line 93
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    const/4 v4, 0x0

    .line 98
    const/4 v5, 0x0

    .line 99
    const v1, 0x7f090161

    .line 100
    .line 101
    .line 102
    const/4 v2, 0x0

    .line 103
    move-object v0, p1

    .line 104
    invoke-virtual/range {v0 .. v5}, Landroid/widget/RemoteViews;->setViewPadding(IIIII)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public clearCompatExtraKeys(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    const-string p0, "android.summaryText"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "android.title.big"

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "androidx.core.app.extra.COMPAT_TEMPLATE"

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public createColoredBitmap(II)Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    iget-object v0, p0, Lvq0;->mBuilder:Lgq0;

    .line 2
    .line 3
    iget-object v0, v0, Lgq0;->a:Landroid/content/Context;

    .line 4
    .line 5
    sget-object v1, Landroidx/core/graphics/drawable/IconCompat;->k:Landroid/graphics/PorterDuff$Mode;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v1, v0, p1}, Landroidx/core/graphics/drawable/IconCompat;->c(Landroid/content/res/Resources;Ljava/lang/String;I)Landroidx/core/graphics/drawable/IconCompat;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, p1, p2, v0}, Lvq0;->a(Landroidx/core/graphics/drawable/IconCompat;II)Landroid/graphics/Bitmap;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public createColoredBitmap(Landroidx/core/graphics/drawable/IconCompat;I)Landroid/graphics/Bitmap;
    .locals 1

    const/4 v0, 0x0

    .line 28
    invoke-virtual {p0, p1, p2, v0}, Lvq0;->a(Landroidx/core/graphics/drawable/IconCompat;II)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public displayCustomViewInline()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public makeBigContentView(Lzp0;)Landroid/widget/RemoteViews;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public makeContentView(Lzp0;)Landroid/widget/RemoteViews;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public makeHeadsUpContentView(Lzp0;)Landroid/widget/RemoteViews;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public restoreFromCompatExtras(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    const-string v0, "android.summaryText"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lvq0;->mSummaryText:Ljava/lang/CharSequence;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Lvq0;->mSummaryTextSet:Z

    .line 17
    .line 18
    :cond_0
    const-string v0, "android.title.big"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lvq0;->mBigContentTitle:Ljava/lang/CharSequence;

    .line 25
    .line 26
    return-void
.end method

.method public setBuilder(Lgq0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lvq0;->mBuilder:Lgq0;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lvq0;->mBuilder:Lgq0;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Lgq0;->k:Lvq0;

    .line 10
    .line 11
    if-eq v0, p0, :cond_0

    .line 12
    .line 13
    iput-object p0, p1, Lgq0;->k:Lvq0;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lvq0;->setBuilder(Lgq0;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
