.class public Landroidx/media/app/NotificationCompat$MediaStyle;
.super Lvq0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/app/NotificationCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MediaStyle"
.end annotation


# static fields
.field private static final MAX_MEDIA_BUTTONS:I = 0x5

.field private static final MAX_MEDIA_BUTTONS_IN_COMPACT:I = 0x3


# instance fields
.field mActionsToShowInCompact:[I

.field mCancelButtonIntent:Landroid/app/PendingIntent;

.field mShowCancelButton:Z

.field mToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Lvq0;-><init>()V

    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Landroidx/media/app/NotificationCompat$MediaStyle;->mActionsToShowInCompact:[I

    return-void
.end method

.method public constructor <init>(Lgq0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lvq0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Landroidx/media/app/NotificationCompat$MediaStyle;->mActionsToShowInCompact:[I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lvq0;->setBuilder(Lgq0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private generateMediaActionButton(Lbq0;)Landroid/widget/RemoteViews;
    .locals 3

    .line 1
    iget-object v0, p1, Lbq0;->h:Landroid/app/PendingIntent;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    new-instance v1, Landroid/widget/RemoteViews;

    .line 9
    .line 10
    iget-object p0, p0, Lvq0;->mBuilder:Lgq0;

    .line 11
    .line 12
    iget-object p0, p0, Lgq0;->a:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget v2, Landroidx/media/R$layout;->notification_media_action:I

    .line 19
    .line 20
    invoke-direct {v1, p0, v2}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    sget p0, Landroidx/media/R$id;->action0:I

    .line 24
    .line 25
    iget v2, p1, Lbq0;->f:I

    .line 26
    .line 27
    invoke-virtual {v1, p0, v2}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 28
    .line 29
    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    sget p0, Landroidx/media/R$id;->action0:I

    .line 33
    .line 34
    iget-object v0, p1, Lbq0;->h:Landroid/app/PendingIntent;

    .line 35
    .line 36
    invoke-virtual {v1, p0, v0}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    sget p0, Landroidx/media/R$id;->action0:I

    .line 40
    .line 41
    iget-object p1, p1, Lbq0;->g:Ljava/lang/CharSequence;

    .line 42
    .line 43
    invoke-static {v1, p0, p1}, Landroidx/media/app/NotificationCompat$Api15Impl;->setContentDescription(Landroid/widget/RemoteViews;ILjava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    return-object v1
.end method

.method public static getMediaSession(Landroid/app/Notification;)Landroid/support/v4/media/session/MediaSessionCompat$Token;
    .locals 1

    .line 1
    iget-object p0, p0, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "android.mediaSession"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-static {p0}, Landroid/support/v4/media/session/MediaSessionCompat$Token;->fromToken(Ljava/lang/Object;)Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method


# virtual methods
.method public apply(Lzp0;)V
    .locals 2

    .line 1
    check-cast p1, Ler0;

    .line 2
    .line 3
    iget-object p1, p1, Ler0;->l:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Landroid/app/Notification$Builder;

    .line 6
    .line 7
    invoke-static {}, Landroidx/media/app/NotificationCompat$Api21Impl;->createMediaStyle()Landroid/app/Notification$MediaStyle;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Landroidx/media/app/NotificationCompat$MediaStyle;->mActionsToShowInCompact:[I

    .line 12
    .line 13
    iget-object p0, p0, Landroidx/media/app/NotificationCompat$MediaStyle;->mToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Landroidx/media/app/NotificationCompat$Api21Impl;->fillInMediaStyle(Landroid/app/Notification$MediaStyle;[ILandroid/support/v4/media/session/MediaSessionCompat$Token;)Landroid/app/Notification$MediaStyle;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p1, p0}, Landroidx/media/app/NotificationCompat$Api21Impl;->setMediaStyle(Landroid/app/Notification$Builder;Landroid/app/Notification$MediaStyle;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public generateBigContentView()Landroid/widget/RemoteViews;
    .locals 6

    .line 1
    iget-object v0, p0, Lvq0;->mBuilder:Lgq0;

    .line 2
    .line 3
    iget-object v0, v0, Lgq0;->b:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x5

    .line 10
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0, v0}, Landroidx/media/app/NotificationCompat$MediaStyle;->getBigContentViewLayoutResource(I)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {p0, v2, v1, v2}, Lvq0;->applyStandardTemplate(ZIZ)Landroid/widget/RemoteViews;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget v3, Landroidx/media/R$id;->media_actions:I

    .line 24
    .line 25
    invoke-virtual {v1, v3}, Landroid/widget/RemoteViews;->removeAllViews(I)V

    .line 26
    .line 27
    .line 28
    if-lez v0, :cond_0

    .line 29
    .line 30
    move v3, v2

    .line 31
    :goto_0
    if-ge v3, v0, :cond_0

    .line 32
    .line 33
    iget-object v4, p0, Lvq0;->mBuilder:Lgq0;

    .line 34
    .line 35
    iget-object v4, v4, Lgq0;->b:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    check-cast v4, Lbq0;

    .line 42
    .line 43
    invoke-direct {p0, v4}, Landroidx/media/app/NotificationCompat$MediaStyle;->generateMediaActionButton(Lbq0;)Landroid/widget/RemoteViews;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    sget v5, Landroidx/media/R$id;->media_actions:I

    .line 48
    .line 49
    invoke-virtual {v1, v5, v4}, Landroid/widget/RemoteViews;->addView(ILandroid/widget/RemoteViews;)V

    .line 50
    .line 51
    .line 52
    add-int/lit8 v3, v3, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iget-boolean v0, p0, Landroidx/media/app/NotificationCompat$MediaStyle;->mShowCancelButton:Z

    .line 56
    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    sget v0, Landroidx/media/R$id;->cancel_action:I

    .line 60
    .line 61
    invoke-virtual {v1, v0, v2}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 62
    .line 63
    .line 64
    sget v0, Landroidx/media/R$id;->cancel_action:I

    .line 65
    .line 66
    iget-object v2, p0, Lvq0;->mBuilder:Lgq0;

    .line 67
    .line 68
    iget-object v2, v2, Lgq0;->a:Landroid/content/Context;

    .line 69
    .line 70
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    sget v3, Landroidx/media/R$integer;->cancel_button_image_alpha:I

    .line 75
    .line 76
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    const-string v3, "setAlpha"

    .line 81
    .line 82
    invoke-virtual {v1, v0, v3, v2}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 83
    .line 84
    .line 85
    sget v0, Landroidx/media/R$id;->cancel_action:I

    .line 86
    .line 87
    iget-object p0, p0, Landroidx/media/app/NotificationCompat$MediaStyle;->mCancelButtonIntent:Landroid/app/PendingIntent;

    .line 88
    .line 89
    invoke-virtual {v1, v0, p0}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 90
    .line 91
    .line 92
    return-object v1

    .line 93
    :cond_1
    sget p0, Landroidx/media/R$id;->cancel_action:I

    .line 94
    .line 95
    const/16 v0, 0x8

    .line 96
    .line 97
    invoke-virtual {v1, p0, v0}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 98
    .line 99
    .line 100
    return-object v1
.end method

.method public generateContentView()Landroid/widget/RemoteViews;
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroidx/media/app/NotificationCompat$MediaStyle;->getContentViewLayoutResource()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    invoke-virtual {p0, v1, v0, v2}, Lvq0;->applyStandardTemplate(ZIZ)Landroid/widget/RemoteViews;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v3, p0, Lvq0;->mBuilder:Lgq0;

    .line 12
    .line 13
    iget-object v3, v3, Lgq0;->b:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    iget-object v4, p0, Landroidx/media/app/NotificationCompat$MediaStyle;->mActionsToShowInCompact:[I

    .line 20
    .line 21
    if-nez v4, :cond_0

    .line 22
    .line 23
    move v4, v1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    array-length v4, v4

    .line 26
    const/4 v5, 0x3

    .line 27
    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    :goto_0
    sget v5, Landroidx/media/R$id;->media_actions:I

    .line 32
    .line 33
    invoke-virtual {v0, v5}, Landroid/widget/RemoteViews;->removeAllViews(I)V

    .line 34
    .line 35
    .line 36
    if-lez v4, :cond_2

    .line 37
    .line 38
    move v5, v1

    .line 39
    :goto_1
    if-ge v5, v4, :cond_2

    .line 40
    .line 41
    if-ge v5, v3, :cond_1

    .line 42
    .line 43
    iget-object v6, p0, Lvq0;->mBuilder:Lgq0;

    .line 44
    .line 45
    iget-object v6, v6, Lgq0;->b:Ljava/util/ArrayList;

    .line 46
    .line 47
    iget-object v7, p0, Landroidx/media/app/NotificationCompat$MediaStyle;->mActionsToShowInCompact:[I

    .line 48
    .line 49
    aget v7, v7, v5

    .line 50
    .line 51
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    check-cast v6, Lbq0;

    .line 56
    .line 57
    invoke-direct {p0, v6}, Landroidx/media/app/NotificationCompat$MediaStyle;->generateMediaActionButton(Lbq0;)Landroid/widget/RemoteViews;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    sget v7, Landroidx/media/R$id;->media_actions:I

    .line 62
    .line 63
    invoke-virtual {v0, v7, v6}, Landroid/widget/RemoteViews;->addView(ILandroid/widget/RemoteViews;)V

    .line 64
    .line 65
    .line 66
    add-int/lit8 v5, v5, 0x1

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 70
    .line 71
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sub-int/2addr v3, v2

    .line 76
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    const-string v1, "setShowActionsInCompactView: action %d out of bounds (max %d)"

    .line 85
    .line 86
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    throw p0

    .line 94
    :cond_2
    iget-boolean v2, p0, Landroidx/media/app/NotificationCompat$MediaStyle;->mShowCancelButton:Z

    .line 95
    .line 96
    const/16 v3, 0x8

    .line 97
    .line 98
    if-eqz v2, :cond_3

    .line 99
    .line 100
    sget v2, Landroidx/media/R$id;->end_padder:I

    .line 101
    .line 102
    invoke-virtual {v0, v2, v3}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 103
    .line 104
    .line 105
    sget v2, Landroidx/media/R$id;->cancel_action:I

    .line 106
    .line 107
    invoke-virtual {v0, v2, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 108
    .line 109
    .line 110
    sget v1, Landroidx/media/R$id;->cancel_action:I

    .line 111
    .line 112
    iget-object v2, p0, Landroidx/media/app/NotificationCompat$MediaStyle;->mCancelButtonIntent:Landroid/app/PendingIntent;

    .line 113
    .line 114
    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 115
    .line 116
    .line 117
    sget v1, Landroidx/media/R$id;->cancel_action:I

    .line 118
    .line 119
    iget-object p0, p0, Lvq0;->mBuilder:Lgq0;

    .line 120
    .line 121
    iget-object p0, p0, Lgq0;->a:Landroid/content/Context;

    .line 122
    .line 123
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    sget v2, Landroidx/media/R$integer;->cancel_button_image_alpha:I

    .line 128
    .line 129
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    const-string v2, "setAlpha"

    .line 134
    .line 135
    invoke-virtual {v0, v1, v2, p0}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 136
    .line 137
    .line 138
    return-object v0

    .line 139
    :cond_3
    sget p0, Landroidx/media/R$id;->end_padder:I

    .line 140
    .line 141
    invoke-virtual {v0, p0, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 142
    .line 143
    .line 144
    sget p0, Landroidx/media/R$id;->cancel_action:I

    .line 145
    .line 146
    invoke-virtual {v0, p0, v3}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 147
    .line 148
    .line 149
    return-object v0
.end method

.method public getBigContentViewLayoutResource(I)I
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    if-gt p1, p0, :cond_0

    .line 3
    .line 4
    sget p0, Landroidx/media/R$layout;->notification_template_big_media_narrow:I

    .line 5
    .line 6
    return p0

    .line 7
    :cond_0
    sget p0, Landroidx/media/R$layout;->notification_template_big_media:I

    .line 8
    .line 9
    return p0
.end method

.method public getContentViewLayoutResource()I
    .locals 0

    .line 1
    sget p0, Landroidx/media/R$layout;->notification_template_media:I

    .line 2
    .line 3
    return p0
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

.method public setCancelButtonIntent(Landroid/app/PendingIntent;)Landroidx/media/app/NotificationCompat$MediaStyle;
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/media/app/NotificationCompat$MediaStyle;->mCancelButtonIntent:Landroid/app/PendingIntent;

    .line 2
    .line 3
    return-object p0
.end method

.method public setMediaSession(Landroid/support/v4/media/session/MediaSessionCompat$Token;)Landroidx/media/app/NotificationCompat$MediaStyle;
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/media/app/NotificationCompat$MediaStyle;->mToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 2
    .line 3
    return-object p0
.end method

.method public varargs setShowActionsInCompactView([I)Landroidx/media/app/NotificationCompat$MediaStyle;
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/media/app/NotificationCompat$MediaStyle;->mActionsToShowInCompact:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public setShowCancelButton(Z)Landroidx/media/app/NotificationCompat$MediaStyle;
    .locals 0

    .line 1
    return-object p0
.end method
