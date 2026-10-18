.class public Landroidx/media/app/NotificationCompat$DecoratedMediaCustomViewStyle;
.super Landroidx/media/app/NotificationCompat$MediaStyle;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/app/NotificationCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DecoratedMediaCustomViewStyle"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/media/app/NotificationCompat$MediaStyle;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private setBackgroundColor(Landroid/widget/RemoteViews;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lvq0;->mBuilder:Lgq0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lvq0;->mBuilder:Lgq0;

    .line 7
    .line 8
    iget-object p0, p0, Lgq0;->a:Landroid/content/Context;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget v0, Landroidx/media/R$color;->notification_material_background_media_default_color:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    sget v0, Landroidx/media/R$id;->status_bar_latest_event_content:I

    .line 21
    .line 22
    const-string v1, "setBackgroundColor"

    .line 23
    .line 24
    invoke-virtual {p1, v0, v1, p0}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    return-void
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
    invoke-static {}, Landroidx/media/app/NotificationCompat$Api24Impl;->createDecoratedMediaCustomViewStyle()Landroid/app/Notification$DecoratedMediaCustomViewStyle;

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

.method public getBigContentViewLayoutResource(I)I
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    if-gt p1, p0, :cond_0

    .line 3
    .line 4
    sget p0, Landroidx/media/R$layout;->notification_template_big_media_narrow_custom:I

    .line 5
    .line 6
    return p0

    .line 7
    :cond_0
    sget p0, Landroidx/media/R$layout;->notification_template_big_media_custom:I

    .line 8
    .line 9
    return p0
.end method

.method public getContentViewLayoutResource()I
    .locals 1

    .line 1
    iget-object v0, p0, Lvq0;->mBuilder:Lgq0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Landroidx/media/app/NotificationCompat$MediaStyle;->getContentViewLayoutResource()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
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

.method public makeHeadsUpContentView(Lzp0;)Landroid/widget/RemoteViews;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
