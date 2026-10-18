.class Lcom/squareup/picasso/RemoteViewsAction$NotificationAction;
.super Lcom/squareup/picasso/RemoteViewsAction;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/picasso/RemoteViewsAction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NotificationAction"
.end annotation


# instance fields
.field private final notification:Landroid/app/Notification;

.field private final notificationId:I

.field private final notificationTag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/squareup/picasso/Picasso;Lcom/squareup/picasso/Request;Landroid/widget/RemoteViews;IILandroid/app/Notification;Ljava/lang/String;IILjava/lang/String;Ljava/lang/Object;ILcom/squareup/picasso/Callback;)V
    .locals 11

    .line 1
    move-object v0, p0

    .line 2
    move-object v1, p1

    .line 3
    move-object v2, p2

    .line 4
    move-object v3, p3

    .line 5
    move v4, p4

    .line 6
    move/from16 v6, p8

    .line 7
    .line 8
    move/from16 v7, p9

    .line 9
    .line 10
    move-object/from16 v9, p10

    .line 11
    .line 12
    move-object/from16 v8, p11

    .line 13
    .line 14
    move/from16 v5, p12

    .line 15
    .line 16
    move-object/from16 v10, p13

    .line 17
    .line 18
    invoke-direct/range {v0 .. v10}, Lcom/squareup/picasso/RemoteViewsAction;-><init>(Lcom/squareup/picasso/Picasso;Lcom/squareup/picasso/Request;Landroid/widget/RemoteViews;IIIILjava/lang/Object;Ljava/lang/String;Lcom/squareup/picasso/Callback;)V

    .line 19
    .line 20
    .line 21
    move/from16 p1, p5

    .line 22
    .line 23
    iput p1, p0, Lcom/squareup/picasso/RemoteViewsAction$NotificationAction;->notificationId:I

    .line 24
    .line 25
    move-object/from16 p1, p7

    .line 26
    .line 27
    iput-object p1, p0, Lcom/squareup/picasso/RemoteViewsAction$NotificationAction;->notificationTag:Ljava/lang/String;

    .line 28
    .line 29
    move-object/from16 p1, p6

    .line 30
    .line 31
    iput-object p1, p0, Lcom/squareup/picasso/RemoteViewsAction$NotificationAction;->notification:Landroid/app/Notification;

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public bridge synthetic getTarget()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/squareup/picasso/RemoteViewsAction;->getTarget()Lcom/squareup/picasso/RemoteViewsAction$RemoteViewsTarget;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public update()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/squareup/picasso/Action;->picasso:Lcom/squareup/picasso/Picasso;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/squareup/picasso/Picasso;->context:Landroid/content/Context;

    .line 4
    .line 5
    const-string v1, "notification"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/squareup/picasso/Utils;->getService(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/app/NotificationManager;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/squareup/picasso/RemoteViewsAction$NotificationAction;->notificationTag:Ljava/lang/String;

    .line 14
    .line 15
    iget v2, p0, Lcom/squareup/picasso/RemoteViewsAction$NotificationAction;->notificationId:I

    .line 16
    .line 17
    iget-object p0, p0, Lcom/squareup/picasso/RemoteViewsAction$NotificationAction;->notification:Landroid/app/Notification;

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2, p0}, Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
