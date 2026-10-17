.class public final Lgq0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/util/ArrayList;

.field public final c:Ljava/util/ArrayList;

.field public final d:Ljava/util/ArrayList;

.field public e:Ljava/lang/CharSequence;

.field public f:Ljava/lang/CharSequence;

.field public g:Landroid/app/PendingIntent;

.field public h:Landroidx/core/graphics/drawable/IconCompat;

.field public i:I

.field public final j:Z

.field public k:Lvq0;

.field public l:Z

.field public m:Landroid/os/Bundle;

.field public n:I

.field public o:Ljava/lang/String;

.field public final p:Z

.field public final q:Landroid/app/Notification;

.field public final r:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lgq0;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lgq0;->c:Ljava/util/ArrayList;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lgq0;->d:Ljava/util/ArrayList;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Lgq0;->j:Z

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    iput-boolean v1, p0, Lgq0;->l:Z

    .line 30
    .line 31
    iput v1, p0, Lgq0;->n:I

    .line 32
    .line 33
    new-instance v2, Landroid/app/Notification;

    .line 34
    .line 35
    invoke-direct {v2}, Landroid/app/Notification;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v2, p0, Lgq0;->q:Landroid/app/Notification;

    .line 39
    .line 40
    iput-object p1, p0, Lgq0;->a:Landroid/content/Context;

    .line 41
    .line 42
    iput-object p2, p0, Lgq0;->o:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 45
    .line 46
    .line 47
    move-result-wide p1

    .line 48
    iput-wide p1, v2, Landroid/app/Notification;->when:J

    .line 49
    .line 50
    const/4 p1, -0x1

    .line 51
    iput p1, v2, Landroid/app/Notification;->audioStreamType:I

    .line 52
    .line 53
    iput v1, p0, Lgq0;->i:I

    .line 54
    .line 55
    new-instance p1, Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object p1, p0, Lgq0;->r:Ljava/util/ArrayList;

    .line 61
    .line 62
    iput-boolean v0, p0, Lgq0;->p:Z

    .line 63
    .line 64
    return-void
.end method

.method public static b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-object p0

    .line 4
    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/16 v1, 0x1400

    .line 9
    .line 10
    if-le v0, v1, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-interface {p0, v0, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :cond_1
    return-object p0
.end method


# virtual methods
.method public final a()Landroid/app/Notification;
    .locals 6

    .line 1
    new-instance v0, Ler0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ler0;-><init>(Lgq0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, v0, Ler0;->m:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Lgq0;

    .line 9
    .line 10
    iget-object v1, p0, Lgq0;->k:Lvq0;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Lvq0;->apply(Lzp0;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Lvq0;->makeContentView(Lzp0;)Landroid/widget/RemoteViews;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const/4 v2, 0x0

    .line 25
    :goto_0
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 26
    .line 27
    iget-object v4, v0, Ler0;->l:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v4, Landroid/app/Notification$Builder;

    .line 30
    .line 31
    const/16 v5, 0x1a

    .line 32
    .line 33
    if-lt v3, v5, :cond_2

    .line 34
    .line 35
    invoke-virtual {v4}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    goto :goto_1

    .line 40
    :cond_2
    invoke-virtual {v4}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    :goto_1
    if-eqz v2, :cond_3

    .line 45
    .line 46
    iput-object v2, v3, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 47
    .line 48
    :cond_3
    if-eqz v1, :cond_4

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Lvq0;->makeBigContentView(Lzp0;)Landroid/widget/RemoteViews;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    if-eqz v2, :cond_4

    .line 55
    .line 56
    iput-object v2, v3, Landroid/app/Notification;->bigContentView:Landroid/widget/RemoteViews;

    .line 57
    .line 58
    :cond_4
    if-eqz v1, :cond_5

    .line 59
    .line 60
    iget-object p0, p0, Lgq0;->k:Lvq0;

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Lvq0;->makeHeadsUpContentView(Lzp0;)Landroid/widget/RemoteViews;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    if-eqz p0, :cond_5

    .line 67
    .line 68
    iput-object p0, v3, Landroid/app/Notification;->headsUpContentView:Landroid/widget/RemoteViews;

    .line 69
    .line 70
    :cond_5
    if-eqz v1, :cond_6

    .line 71
    .line 72
    iget-object p0, v3, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    .line 73
    .line 74
    if-eqz p0, :cond_6

    .line 75
    .line 76
    invoke-virtual {v1, p0}, Lvq0;->addCompatExtras(Landroid/os/Bundle;)V

    .line 77
    .line 78
    .line 79
    :cond_6
    return-object v3
.end method

.method public final c(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lgq0;->q:Landroid/app/Notification;

    .line 2
    .line 3
    iget v0, p0, Landroid/app/Notification;->flags:I

    .line 4
    .line 5
    or-int/2addr p1, v0

    .line 6
    iput p1, p0, Landroid/app/Notification;->flags:I

    .line 7
    .line 8
    return-void
.end method
