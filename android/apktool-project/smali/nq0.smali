.class public final Lnq0;
.super Lvq0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# virtual methods
.method public final apply(Lzp0;)V
    .locals 0

    .line 1
    check-cast p1, Ler0;

    .line 2
    .line 3
    iget-object p0, p1, Ler0;->l:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Landroid/app/Notification$Builder;

    .line 6
    .line 7
    invoke-static {}, Lmq0;->a()Landroid/app/Notification$Style;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/app/Notification$Builder;->setStyle(Landroid/app/Notification$Style;)Landroid/app/Notification$Builder;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final displayCustomViewInline()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final getClassName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "androidx.core.app.NotificationCompat$DecoratedCustomViewStyle"

    .line 2
    .line 3
    return-object p0
.end method

.method public final makeBigContentView(Lzp0;)Landroid/widget/RemoteViews;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final makeContentView(Lzp0;)Landroid/widget/RemoteViews;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final makeHeadsUpContentView(Lzp0;)Landroid/widget/RemoteViews;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
