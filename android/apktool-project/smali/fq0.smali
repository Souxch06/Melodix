.class public final Lfq0;
.super Lvq0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic a:I

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lfq0;->a:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lvq0;-><init>()V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :pswitch_0
    invoke-direct {p0}, Lvq0;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance p1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lfq0;->b:Ljava/lang/Object;

    .line 19
    .line 20
    return-void

    .line 21
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final apply(Lzp0;)V
    .locals 3

    .line 1
    iget v0, p0, Lfq0;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, Ler0;

    .line 7
    .line 8
    iget-object p1, p1, Ler0;->l:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p1, Landroid/app/Notification$Builder;

    .line 11
    .line 12
    new-instance v0, Landroid/app/Notification$InboxStyle;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Landroid/app/Notification$InboxStyle;-><init>(Landroid/app/Notification$Builder;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lvq0;->mBigContentTitle:Ljava/lang/CharSequence;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Landroid/app/Notification$InboxStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$InboxStyle;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-boolean v0, p0, Lvq0;->mSummaryTextSet:Z

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lvq0;->mSummaryText:Ljava/lang/CharSequence;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/app/Notification$InboxStyle;->setSummaryText(Ljava/lang/CharSequence;)Landroid/app/Notification$InboxStyle;

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p0, p0, Lfq0;->b:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast p0, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    const/4 v1, 0x0

    .line 41
    :goto_0
    if-ge v1, v0, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    check-cast v2, Ljava/lang/CharSequence;

    .line 50
    .line 51
    invoke-virtual {p1, v2}, Landroid/app/Notification$InboxStyle;->addLine(Ljava/lang/CharSequence;)Landroid/app/Notification$InboxStyle;

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    return-void

    .line 56
    :pswitch_0
    check-cast p1, Ler0;

    .line 57
    .line 58
    iget-object p1, p1, Ler0;->l:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast p1, Landroid/app/Notification$Builder;

    .line 61
    .line 62
    new-instance v0, Landroid/app/Notification$BigTextStyle;

    .line 63
    .line 64
    invoke-direct {v0, p1}, Landroid/app/Notification$BigTextStyle;-><init>(Landroid/app/Notification$Builder;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lvq0;->mBigContentTitle:Ljava/lang/CharSequence;

    .line 68
    .line 69
    invoke-virtual {v0, p1}, Landroid/app/Notification$BigTextStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iget-object v0, p0, Lfq0;->b:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast v0, Ljava/lang/CharSequence;

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iget-boolean v0, p0, Lvq0;->mSummaryTextSet:Z

    .line 82
    .line 83
    if-eqz v0, :cond_2

    .line 84
    .line 85
    iget-object p0, p0, Lvq0;->mSummaryText:Ljava/lang/CharSequence;

    .line 86
    .line 87
    invoke-virtual {p1, p0}, Landroid/app/Notification$BigTextStyle;->setSummaryText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    .line 88
    .line 89
    .line 90
    :cond_2
    return-void

    .line 91
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final clearCompatExtraKeys(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget v0, p0, Lfq0;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Lvq0;->clearCompatExtraKeys(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    const-string p0, "android.textLines"

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :pswitch_0
    invoke-super {p0, p1}, Lvq0;->clearCompatExtraKeys(Landroid/os/Bundle;)V

    .line 16
    .line 17
    .line 18
    const-string p0, "android.bigText"

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    nop

    .line 25
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final getClassName()Ljava/lang/String;
    .locals 0

    .line 1
    iget p0, p0, Lfq0;->a:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const-string p0, "androidx.core.app.NotificationCompat$InboxStyle"

    .line 7
    .line 8
    return-object p0

    .line 9
    :pswitch_0
    const-string p0, "androidx.core.app.NotificationCompat$BigTextStyle"

    .line 10
    .line 11
    return-object p0

    .line 12
    nop

    .line 13
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final restoreFromCompatExtras(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget v0, p0, Lfq0;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Lvq0;->restoreFromCompatExtras(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lfq0;->b:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 14
    .line 15
    .line 16
    const-string v0, "android.textLines"

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getCharSequenceArray(Ljava/lang/String;)[Ljava/lang/CharSequence;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {p0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void

    .line 32
    :pswitch_0
    invoke-super {p0, p1}, Lvq0;->restoreFromCompatExtras(Landroid/os/Bundle;)V

    .line 33
    .line 34
    .line 35
    const-string v0, "android.bigText"

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lfq0;->b:Ljava/lang/Object;

    .line 42
    .line 43
    return-void

    .line 44
    nop

    .line 45
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
