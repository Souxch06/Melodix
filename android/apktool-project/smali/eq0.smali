.class public final Leq0;
.super Lvq0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Landroidx/core/graphics/drawable/IconCompat;

.field public b:Landroidx/core/graphics/drawable/IconCompat;

.field public c:Z

.field public d:Z


# direct methods
.method public static c(Landroid/os/Parcelable;)Landroidx/core/graphics/drawable/IconCompat;
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    instance-of v0, p0, Landroid/graphics/drawable/Icon;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Landroid/graphics/drawable/Icon;

    .line 8
    .line 9
    sget-object v0, Landroidx/core/graphics/drawable/IconCompat;->k:Landroid/graphics/PorterDuff$Mode;

    .line 10
    .line 11
    invoke-static {p0}, Lld0;->a(Landroid/graphics/drawable/Icon;)Landroidx/core/graphics/drawable/IconCompat;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    instance-of v0, p0, Landroid/graphics/Bitmap;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    check-cast p0, Landroid/graphics/Bitmap;

    .line 21
    .line 22
    new-instance v0, Landroidx/core/graphics/drawable/IconCompat;

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-direct {v0, v1}, Landroidx/core/graphics/drawable/IconCompat;-><init>(I)V

    .line 26
    .line 27
    .line 28
    iput-object p0, v0, Landroidx/core/graphics/drawable/IconCompat;->b:Ljava/lang/Object;

    .line 29
    .line 30
    return-object v0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method


# virtual methods
.method public final apply(Lzp0;)V
    .locals 7

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Ler0;

    .line 3
    .line 4
    iget-object v0, v0, Ler0;->l:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Landroid/app/Notification$Builder;

    .line 7
    .line 8
    new-instance v1, Landroid/app/Notification$BigPictureStyle;

    .line 9
    .line 10
    invoke-direct {v1, v0}, Landroid/app/Notification$BigPictureStyle;-><init>(Landroid/app/Notification$Builder;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lvq0;->mBigContentTitle:Ljava/lang/CharSequence;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/app/Notification$BigPictureStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$BigPictureStyle;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Leq0;->a:Landroidx/core/graphics/drawable/IconCompat;

    .line 20
    .line 21
    const/16 v2, 0x1f

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    if-eqz v1, :cond_6

    .line 25
    .line 26
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 27
    .line 28
    if-lt v4, v2, :cond_0

    .line 29
    .line 30
    move-object v4, p1

    .line 31
    check-cast v4, Ler0;

    .line 32
    .line 33
    iget-object v4, v4, Ler0;->k:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast v4, Landroid/content/Context;

    .line 36
    .line 37
    invoke-static {v1, v4}, Lld0;->g(Landroidx/core/graphics/drawable/IconCompat;Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v0, v1}, Ldq0;->a(Landroid/app/Notification$BigPictureStyle;Landroid/graphics/drawable/Icon;)V

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    iget v4, v1, Landroidx/core/graphics/drawable/IconCompat;->a:I

    .line 46
    .line 47
    const/4 v5, -0x1

    .line 48
    if-ne v4, v5, :cond_1

    .line 49
    .line 50
    iget-object v1, v1, Landroidx/core/graphics/drawable/IconCompat;->b:Ljava/lang/Object;

    .line 51
    .line 52
    invoke-static {v1}, Lld0;->d(Ljava/lang/Object;)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    :cond_1
    const/4 v1, 0x1

    .line 57
    if-ne v4, v1, :cond_6

    .line 58
    .line 59
    iget-object v4, p0, Leq0;->a:Landroidx/core/graphics/drawable/IconCompat;

    .line 60
    .line 61
    iget v6, v4, Landroidx/core/graphics/drawable/IconCompat;->a:I

    .line 62
    .line 63
    if-ne v6, v5, :cond_3

    .line 64
    .line 65
    iget-object v1, v4, Landroidx/core/graphics/drawable/IconCompat;->b:Ljava/lang/Object;

    .line 66
    .line 67
    instance-of v4, v1, Landroid/graphics/Bitmap;

    .line 68
    .line 69
    if-eqz v4, :cond_2

    .line 70
    .line 71
    check-cast v1, Landroid/graphics/Bitmap;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    move-object v1, v3

    .line 75
    goto :goto_0

    .line 76
    :cond_3
    if-ne v6, v1, :cond_4

    .line 77
    .line 78
    iget-object v1, v4, Landroidx/core/graphics/drawable/IconCompat;->b:Ljava/lang/Object;

    .line 79
    .line 80
    check-cast v1, Landroid/graphics/Bitmap;

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    const/4 v5, 0x5

    .line 84
    if-ne v6, v5, :cond_5

    .line 85
    .line 86
    iget-object v4, v4, Landroidx/core/graphics/drawable/IconCompat;->b:Ljava/lang/Object;

    .line 87
    .line 88
    check-cast v4, Landroid/graphics/Bitmap;

    .line 89
    .line 90
    invoke-static {v4, v1}, Landroidx/core/graphics/drawable/IconCompat;->b(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    :goto_0
    invoke-virtual {v0, v1}, Landroid/app/Notification$BigPictureStyle;->bigPicture(Landroid/graphics/Bitmap;)Landroid/app/Notification$BigPictureStyle;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    goto :goto_1

    .line 99
    :cond_5
    const-string p0, "called getBitmap() on "

    .line 100
    .line 101
    invoke-static {v4, p0}, Lwd1;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_6
    :goto_1
    iget-boolean v1, p0, Leq0;->c:Z

    .line 106
    .line 107
    if-eqz v1, :cond_8

    .line 108
    .line 109
    iget-object v1, p0, Leq0;->b:Landroidx/core/graphics/drawable/IconCompat;

    .line 110
    .line 111
    if-nez v1, :cond_7

    .line 112
    .line 113
    invoke-virtual {v0, v3}, Landroid/app/Notification$BigPictureStyle;->bigLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$BigPictureStyle;

    .line 114
    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_7
    check-cast p1, Ler0;

    .line 118
    .line 119
    iget-object p1, p1, Ler0;->k:Ljava/lang/Object;

    .line 120
    .line 121
    check-cast p1, Landroid/content/Context;

    .line 122
    .line 123
    invoke-static {v1, p1}, Lld0;->g(Landroidx/core/graphics/drawable/IconCompat;Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-static {v0, p1}, Lcq0;->a(Landroid/app/Notification$BigPictureStyle;Landroid/graphics/drawable/Icon;)V

    .line 128
    .line 129
    .line 130
    :cond_8
    :goto_2
    iget-boolean p1, p0, Lvq0;->mSummaryTextSet:Z

    .line 131
    .line 132
    if-eqz p1, :cond_9

    .line 133
    .line 134
    iget-object p1, p0, Lvq0;->mSummaryText:Ljava/lang/CharSequence;

    .line 135
    .line 136
    invoke-virtual {v0, p1}, Landroid/app/Notification$BigPictureStyle;->setSummaryText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigPictureStyle;

    .line 137
    .line 138
    .line 139
    :cond_9
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 140
    .line 141
    if-lt p1, v2, :cond_a

    .line 142
    .line 143
    iget-boolean p0, p0, Leq0;->d:Z

    .line 144
    .line 145
    invoke-static {v0, p0}, Ldq0;->c(Landroid/app/Notification$BigPictureStyle;Z)V

    .line 146
    .line 147
    .line 148
    invoke-static {v0, v3}, Ldq0;->b(Landroid/app/Notification$BigPictureStyle;Ljava/lang/CharSequence;)V

    .line 149
    .line 150
    .line 151
    :cond_a
    return-void
.end method

.method public final clearCompatExtraKeys(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lvq0;->clearCompatExtraKeys(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const-string p0, "android.largeIcon.big"

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string p0, "android.picture"

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string p0, "android.pictureIcon"

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string p0, "android.showBigPictureWhenCollapsed"

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final getClassName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "androidx.core.app.NotificationCompat$BigPictureStyle"

    .line 2
    .line 3
    return-object p0
.end method

.method public final restoreFromCompatExtras(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lvq0;->restoreFromCompatExtras(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "android.largeIcon.big"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Leq0;->c(Landroid/os/Parcelable;)Landroidx/core/graphics/drawable/IconCompat;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Leq0;->b:Landroidx/core/graphics/drawable/IconCompat;

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    iput-boolean v0, p0, Leq0;->c:Z

    .line 24
    .line 25
    :cond_0
    const-string v0, "android.picture"

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-static {v0}, Leq0;->c(Landroid/os/Parcelable;)Landroidx/core/graphics/drawable/IconCompat;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const-string v0, "android.pictureIcon"

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v0}, Leq0;->c(Landroid/os/Parcelable;)Landroidx/core/graphics/drawable/IconCompat;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    :goto_0
    iput-object v0, p0, Leq0;->a:Landroidx/core/graphics/drawable/IconCompat;

    .line 49
    .line 50
    const-string v0, "android.showBigPictureWhenCollapsed"

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    iput-boolean p1, p0, Leq0;->d:Z

    .line 57
    .line 58
    return-void
.end method
