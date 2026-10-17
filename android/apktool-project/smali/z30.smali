.class public final synthetic Lz30;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lwr0;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Landroid/content/ContextWrapper;


# direct methods
.method public synthetic constructor <init>(Landroid/content/ContextWrapper;I)V
    .locals 0

    .line 1
    iput p2, p0, Lz30;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lz30;->k:Landroid/content/ContextWrapper;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final j(Ljd2;)V
    .locals 2

    .line 1
    iget v0, p0, Lz30;->j:I

    .line 2
    .line 3
    iget-object p0, p0, Lz30;->k:Landroid/content/ContextWrapper;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    packed-switch v0, :pswitch_data_0

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ljd2;->j()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Ljd2;->h()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    sget p1, Lcom/melodix/music/AppSingleton;->j:I

    .line 30
    .line 31
    :cond_0
    new-instance p1, Ljava/lang/Thread;

    .line 32
    .line 33
    new-instance v0, La40;

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-direct {v0, p0, v1}, La40;-><init>(Landroid/content/ContextWrapper;I)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void

    .line 46
    :pswitch_0
    invoke-virtual {p1}, Ljd2;->j()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    invoke-virtual {p1}, Ljd2;->h()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Ljava/lang/Boolean;

    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    sget p1, Lcom/melodix/music/AppSingleton;->j:I

    .line 65
    .line 66
    :cond_2
    new-instance p1, Ljava/lang/Thread;

    .line 67
    .line 68
    new-instance v0, La40;

    .line 69
    .line 70
    const/4 v1, 0x0

    .line 71
    invoke-direct {v0, p0, v1}, La40;-><init>(Landroid/content/ContextWrapper;I)V

    .line 72
    .line 73
    .line 74
    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_3
    invoke-virtual {p1}, Ljd2;->g()Ljava/lang/Exception;

    .line 82
    .line 83
    .line 84
    :goto_0
    return-void

    .line 85
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
