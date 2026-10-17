.class public final Lva0;
.super Lwa0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final c:Ljava/lang/Object;

.field public static final d:Lva0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lva0;->c:Ljava/lang/Object;

    .line 7
    .line 8
    new-instance v0, Lva0;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lva0;->d:Lva0;

    .line 14
    .line 15
    return-void
.end method

.method public static d(Landroid/app/Activity;ILjm1;Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    new-instance v1, Landroid/util/TypedValue;

    .line 6
    .line 7
    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const v3, 0x1010309

    .line 15
    .line 16
    .line 17
    const/4 v4, 0x1

    .line 18
    invoke-virtual {v2, v3, v1, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget v1, v1, Landroid/util/TypedValue;->resourceId:I

    .line 26
    .line 27
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "Theme.Dialog.Alert"

    .line 32
    .line 33
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    new-instance v0, Landroid/app/AlertDialog$Builder;

    .line 40
    .line 41
    const/4 v1, 0x5

    .line 42
    invoke-direct {v0, p0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    if-nez v0, :cond_2

    .line 46
    .line 47
    new-instance v0, Landroid/app/AlertDialog$Builder;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    invoke-static {p0, p1}, Lsl1;->b(Landroid/content/Context;I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 57
    .line 58
    .line 59
    if-eqz p3, :cond_3

    .line 60
    .line 61
    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 62
    .line 63
    .line 64
    :cond_3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    if-eq p1, v4, :cond_6

    .line 69
    .line 70
    const/4 v1, 0x2

    .line 71
    if-eq p1, v1, :cond_5

    .line 72
    .line 73
    const/4 v1, 0x3

    .line 74
    if-eq p1, v1, :cond_4

    .line 75
    .line 76
    const v1, 0x104000a

    .line 77
    .line 78
    .line 79
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p3

    .line 83
    goto :goto_0

    .line 84
    :cond_4
    const v1, 0x7f110037

    .line 85
    .line 86
    .line 87
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p3

    .line 91
    goto :goto_0

    .line 92
    :cond_5
    const v1, 0x7f110041

    .line 93
    .line 94
    .line 95
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p3

    .line 99
    goto :goto_0

    .line 100
    :cond_6
    const v1, 0x7f11003a

    .line 101
    .line 102
    .line 103
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    :goto_0
    if-eqz p3, :cond_7

    .line 108
    .line 109
    invoke-virtual {v0, p3, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 110
    .line 111
    .line 112
    :cond_7
    invoke-static {p0, p1}, Lsl1;->c(Landroid/content/Context;I)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    if-eqz p0, :cond_8

    .line 117
    .line 118
    invoke-virtual {v0, p0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 119
    .line 120
    .line 121
    :cond_8
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 122
    .line 123
    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    return-object p0
.end method

.method public static e(Landroid/app/Activity;Landroid/app/AlertDialog;Ljava/lang/String;Landroid/content/DialogInterface$OnCancelListener;)V
    .locals 3

    .line 1
    const-string v0, "Cannot display null dialog"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    instance-of v2, p0, Le6;
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .line 6
    if-eqz v2, :cond_1

    .line 7
    .line 8
    check-cast p0, Le6;

    .line 9
    .line 10
    invoke-virtual {p0}, Le6;->l()Lz70;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v2, Lxa1;

    .line 15
    .line 16
    invoke-direct {v2}, Lxa1;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p1, v0}, Lbh;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, v2, Lxa1;->r0:Landroid/app/Dialog;

    .line 29
    .line 30
    if-eqz p3, :cond_0

    .line 31
    .line 32
    iput-object p3, v2, Lxa1;->s0:Landroid/content/DialogInterface$OnCancelListener;

    .line 33
    .line 34
    :cond_0
    const/4 p1, 0x0

    .line 35
    iput-boolean p1, v2, Lpx;->o0:Z

    .line 36
    .line 37
    const/4 p3, 0x1

    .line 38
    iput-boolean p3, v2, Lpx;->p0:Z

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    new-instance v0, Ltf;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ltf;-><init>(Lz70;)V

    .line 46
    .line 47
    .line 48
    iput-boolean p3, v0, Ltf;->p:Z

    .line 49
    .line 50
    invoke-virtual {v0, p1, v2, p2, p3}, Ltf;->e(ILh70;Ljava/lang/String;I)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, p1}, Ltf;->d(Z)I

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :catch_0
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    new-instance v2, Ld10;

    .line 62
    .line 63
    invoke-direct {v2}, Landroid/app/DialogFragment;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-static {p1, v0}, Lbh;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, v1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 73
    .line 74
    .line 75
    iput-object p1, v2, Ld10;->j:Landroid/app/Dialog;

    .line 76
    .line 77
    if-eqz p3, :cond_2

    .line 78
    .line 79
    iput-object p3, v2, Ld10;->k:Landroid/content/DialogInterface$OnCancelListener;

    .line 80
    .line 81
    :cond_2
    invoke-virtual {v2, p0, p2}, Landroid/app/DialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method


# virtual methods
.method public final c(Lcom/google/android/gms/common/api/GoogleApiActivity;ILcom/google/android/gms/common/api/GoogleApiActivity;)V
    .locals 1

    .line 1
    const-string v0, "d"

    .line 2
    .line 3
    invoke-super {p0, p2, p1, v0}, Lwa0;->a(ILandroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ldm1;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Ldm1;-><init>(Landroid/content/Intent;Lcom/google/android/gms/common/api/GoogleApiActivity;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1, p2, v0, p3}, Lva0;->d(Landroid/app/Activity;ILjm1;Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string p2, "GooglePlayServicesErrorDialog"

    .line 20
    .line 21
    invoke-static {p1, p0, p2, p3}, Lva0;->e(Landroid/app/Activity;Landroid/app/AlertDialog;Ljava/lang/String;Landroid/content/DialogInterface$OnCancelListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final f(Landroid/content/Context;ILandroid/app/PendingIntent;)V
    .locals 16

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    new-instance v2, Ljava/lang/IllegalArgumentException;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 8
    .line 9
    .line 10
    const/16 v2, 0x12

    .line 11
    .line 12
    const/4 v10, 0x1

    .line 13
    if-ne v1, v2, :cond_0

    .line 14
    .line 15
    new-instance v1, Lfm1;

    .line 16
    .line 17
    move-object/from16 v2, p0

    .line 18
    .line 19
    invoke-direct {v1, v2, v0}, Lfm1;-><init>(Lva0;Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    const-wide/32 v2, 0x1d4c0

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v10, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    if-nez p3, :cond_1

    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    const/4 v2, 0x6

    .line 33
    if-ne v1, v2, :cond_2

    .line 34
    .line 35
    const-string v3, "common_google_play_services_resolution_required_title"

    .line 36
    .line 37
    invoke-static {v0, v3}, Lsl1;->e(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    goto :goto_0

    .line 42
    :cond_2
    invoke-static/range {p1 .. p2}, Lsl1;->c(Landroid/content/Context;I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    :goto_0
    const v4, 0x7f11003e

    .line 47
    .line 48
    .line 49
    if-nez v3, :cond_3

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    :cond_3
    if-eq v1, v2, :cond_5

    .line 60
    .line 61
    const/16 v2, 0x13

    .line 62
    .line 63
    if-ne v1, v2, :cond_4

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_4
    invoke-static/range {p1 .. p2}, Lsl1;->b(Landroid/content/Context;I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    goto :goto_2

    .line 71
    :cond_5
    :goto_1
    invoke-static {v0}, Lsl1;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    const-string v5, "common_google_play_services_resolution_required_text"

    .line 76
    .line 77
    invoke-static {v0, v5, v2}, Lsl1;->d(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    :goto_2
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    const-string v6, "notification"

    .line 86
    .line 87
    invoke-virtual {v0, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v6

    .line 91
    invoke-static {v6}, Lbh;->h(Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    move-object v11, v6

    .line 95
    check-cast v11, Landroid/app/NotificationManager;

    .line 96
    .line 97
    new-instance v12, Lgq0;

    .line 98
    .line 99
    const/4 v6, 0x0

    .line 100
    invoke-direct {v12, v0, v6}, Lgq0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iput-boolean v10, v12, Lgq0;->l:Z

    .line 104
    .line 105
    const/16 v7, 0x10

    .line 106
    .line 107
    invoke-virtual {v12, v7}, Lgq0;->c(I)V

    .line 108
    .line 109
    .line 110
    invoke-static {v3}, Lgq0;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    iput-object v3, v12, Lgq0;->e:Ljava/lang/CharSequence;

    .line 115
    .line 116
    new-instance v3, Lfq0;

    .line 117
    .line 118
    const/4 v13, 0x0

    .line 119
    invoke-direct {v3, v13}, Lfq0;-><init>(I)V

    .line 120
    .line 121
    .line 122
    invoke-static {v2}, Lgq0;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 123
    .line 124
    .line 125
    move-result-object v7

    .line 126
    iput-object v7, v3, Lfq0;->b:Ljava/lang/Object;

    .line 127
    .line 128
    iget-object v7, v12, Lgq0;->k:Lvq0;

    .line 129
    .line 130
    if-eq v7, v3, :cond_6

    .line 131
    .line 132
    iput-object v3, v12, Lgq0;->k:Lvq0;

    .line 133
    .line 134
    invoke-virtual {v3, v12}, Lvq0;->setBuilder(Lgq0;)V

    .line 135
    .line 136
    .line 137
    :cond_6
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    sget-object v7, Lk42;->p:Ljava/lang/Boolean;

    .line 142
    .line 143
    if-nez v7, :cond_7

    .line 144
    .line 145
    const-string v7, "android.hardware.type.watch"

    .line 146
    .line 147
    invoke-virtual {v3, v7}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 152
    .line 153
    .line 154
    move-result-object v7

    .line 155
    sput-object v7, Lk42;->p:Ljava/lang/Boolean;

    .line 156
    .line 157
    :cond_7
    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    const/4 v14, 0x2

    .line 162
    if-eqz v3, :cond_9

    .line 163
    .line 164
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    iget v2, v2, Landroid/content/pm/ApplicationInfo;->icon:I

    .line 169
    .line 170
    iget-object v3, v12, Lgq0;->q:Landroid/app/Notification;

    .line 171
    .line 172
    iput v2, v3, Landroid/app/Notification;->icon:I

    .line 173
    .line 174
    iput v14, v12, Lgq0;->i:I

    .line 175
    .line 176
    invoke-static {v0}, Lk42;->j(Landroid/content/Context;)Z

    .line 177
    .line 178
    .line 179
    move-result v2

    .line 180
    if-eqz v2, :cond_8

    .line 181
    .line 182
    const v2, 0x7f110046

    .line 183
    .line 184
    .line 185
    invoke-virtual {v5, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v4

    .line 189
    iget-object v15, v12, Lgq0;->b:Ljava/util/ArrayList;

    .line 190
    .line 191
    new-instance v2, Lbq0;

    .line 192
    .line 193
    const v3, 0x7f08008f

    .line 194
    .line 195
    .line 196
    const-string v5, ""

    .line 197
    .line 198
    invoke-static {v6, v5, v3}, Landroidx/core/graphics/drawable/IconCompat;->c(Landroid/content/res/Resources;Ljava/lang/String;I)Landroidx/core/graphics/drawable/IconCompat;

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    new-instance v6, Landroid/os/Bundle;

    .line 203
    .line 204
    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 205
    .line 206
    .line 207
    const/4 v8, 0x1

    .line 208
    const/4 v9, 0x1

    .line 209
    const/4 v7, 0x0

    .line 210
    move-object/from16 v5, p3

    .line 211
    .line 212
    invoke-direct/range {v2 .. v9}, Lbq0;-><init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroid/os/Bundle;[La01;ZZ)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v15, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    goto :goto_3

    .line 219
    :cond_8
    move-object/from16 v3, p3

    .line 220
    .line 221
    iput-object v3, v12, Lgq0;->g:Landroid/app/PendingIntent;

    .line 222
    .line 223
    goto :goto_3

    .line 224
    :cond_9
    move-object/from16 v3, p3

    .line 225
    .line 226
    const v6, 0x108008a

    .line 227
    .line 228
    .line 229
    iget-object v7, v12, Lgq0;->q:Landroid/app/Notification;

    .line 230
    .line 231
    iput v6, v7, Landroid/app/Notification;->icon:I

    .line 232
    .line 233
    invoke-virtual {v5, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v4

    .line 237
    iget-object v5, v12, Lgq0;->q:Landroid/app/Notification;

    .line 238
    .line 239
    invoke-static {v4}, Lgq0;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 240
    .line 241
    .line 242
    move-result-object v4

    .line 243
    iput-object v4, v5, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 244
    .line 245
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 246
    .line 247
    .line 248
    move-result-wide v4

    .line 249
    iget-object v6, v12, Lgq0;->q:Landroid/app/Notification;

    .line 250
    .line 251
    iput-wide v4, v6, Landroid/app/Notification;->when:J

    .line 252
    .line 253
    iput-object v3, v12, Lgq0;->g:Landroid/app/PendingIntent;

    .line 254
    .line 255
    invoke-static {v2}, Lgq0;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    iput-object v2, v12, Lgq0;->f:Ljava/lang/CharSequence;

    .line 260
    .line 261
    :goto_3
    invoke-static {}, Lbe2;->q()Z

    .line 262
    .line 263
    .line 264
    move-result v2

    .line 265
    if-nez v2, :cond_a

    .line 266
    .line 267
    goto :goto_5

    .line 268
    :cond_a
    invoke-static {}, Lbe2;->q()Z

    .line 269
    .line 270
    .line 271
    move-result v2

    .line 272
    if-eqz v2, :cond_e

    .line 273
    .line 274
    sget-object v2, Lva0;->c:Ljava/lang/Object;

    .line 275
    .line 276
    monitor-enter v2

    .line 277
    :try_start_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 278
    const-string v2, "com.google.android.gms.availability"

    .line 279
    .line 280
    invoke-virtual {v11, v2}, Landroid/app/NotificationManager;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    .line 281
    .line 282
    .line 283
    move-result-object v3

    .line 284
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    const v4, 0x7f11003d

    .line 289
    .line 290
    .line 291
    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    if-nez v3, :cond_b

    .line 296
    .line 297
    const-string v3, "com.google.android.gms.availability"

    .line 298
    .line 299
    new-instance v4, Landroid/app/NotificationChannel;

    .line 300
    .line 301
    const/4 v5, 0x4

    .line 302
    invoke-direct {v4, v3, v0, v5}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 303
    .line 304
    .line 305
    invoke-virtual {v11, v4}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 306
    .line 307
    .line 308
    goto :goto_4

    .line 309
    :cond_b
    invoke-virtual {v3}, Landroid/app/NotificationChannel;->getName()Ljava/lang/CharSequence;

    .line 310
    .line 311
    .line 312
    move-result-object v4

    .line 313
    invoke-virtual {v0, v4}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    .line 314
    .line 315
    .line 316
    move-result v4

    .line 317
    if-nez v4, :cond_c

    .line 318
    .line 319
    invoke-virtual {v3, v0}, Landroid/app/NotificationChannel;->setName(Ljava/lang/CharSequence;)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v11, v3}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 323
    .line 324
    .line 325
    :cond_c
    :goto_4
    iput-object v2, v12, Lgq0;->o:Ljava/lang/String;

    .line 326
    .line 327
    :goto_5
    invoke-virtual {v12}, Lgq0;->a()Landroid/app/Notification;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    if-eq v1, v10, :cond_d

    .line 332
    .line 333
    if-eq v1, v14, :cond_d

    .line 334
    .line 335
    const/4 v2, 0x3

    .line 336
    if-eq v1, v2, :cond_d

    .line 337
    .line 338
    const v1, 0x9b6d

    .line 339
    .line 340
    .line 341
    goto :goto_6

    .line 342
    :cond_d
    sget-object v1, Lbb0;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 343
    .line 344
    invoke-virtual {v1, v13}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 345
    .line 346
    .line 347
    const/16 v1, 0x28c4

    .line 348
    .line 349
    :goto_6
    invoke-virtual {v11, v1, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 350
    .line 351
    .line 352
    return-void

    .line 353
    :catchall_0
    move-exception v0

    .line 354
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 355
    throw v0

    .line 356
    :cond_e
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 357
    .line 358
    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 359
    .line 360
    .line 361
    throw v0
.end method

.method public final g(Landroid/app/Activity;Lai0;ILandroid/content/DialogInterface$OnCancelListener;)V
    .locals 1

    .line 1
    const-string v0, "d"

    .line 2
    .line 3
    invoke-super {p0, p3, p1, v0}, Lwa0;->a(ILandroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Lgm1;

    .line 8
    .line 9
    invoke-direct {v0, p0, p2}, Lgm1;-><init>(Landroid/content/Intent;Lai0;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1, p3, v0, p4}, Lva0;->d(Landroid/app/Activity;ILjm1;Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string p2, "GooglePlayServicesErrorDialog"

    .line 20
    .line 21
    invoke-static {p1, p0, p2, p4}, Lva0;->e(Landroid/app/Activity;Landroid/app/AlertDialog;Ljava/lang/String;Landroid/content/DialogInterface$OnCancelListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
