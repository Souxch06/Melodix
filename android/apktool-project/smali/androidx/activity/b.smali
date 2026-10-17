.class public final Landroidx/activity/b;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ljava/lang/Runnable;

.field public final b:Laa;

.field public c:Lr70;

.field public final d:Landroid/window/OnBackInvokedCallback;

.field public e:Landroid/window/OnBackInvokedDispatcher;

.field public f:Z

.field public g:Z


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/activity/b;->a:Ljava/lang/Runnable;

    .line 5
    .line 6
    new-instance p1, Laa;

    .line 7
    .line 8
    invoke-direct {p1}, Laa;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Landroidx/activity/b;->b:Laa;

    .line 12
    .line 13
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 14
    .line 15
    const/16 v0, 0x21

    .line 16
    .line 17
    if-lt p1, v0, :cond_1

    .line 18
    .line 19
    const/16 v0, 0x22

    .line 20
    .line 21
    if-lt p1, v0, :cond_0

    .line 22
    .line 23
    new-instance p1, Lpr0;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-direct {p1, p0, v0}, Lpr0;-><init>(Landroidx/activity/b;I)V

    .line 27
    .line 28
    .line 29
    new-instance v1, Lpr0;

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    invoke-direct {v1, p0, v2}, Lpr0;-><init>(Landroidx/activity/b;I)V

    .line 33
    .line 34
    .line 35
    new-instance v3, Lqr0;

    .line 36
    .line 37
    invoke-direct {v3, p0, v0}, Lqr0;-><init>(Landroidx/activity/b;I)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Lqr0;

    .line 41
    .line 42
    invoke-direct {v0, p0, v2}, Lqr0;-><init>(Landroidx/activity/b;I)V

    .line 43
    .line 44
    .line 45
    sget-object v2, Ltr0;->a:Ltr0;

    .line 46
    .line 47
    invoke-virtual {v2, p1, v1, v3, v0}, Ltr0;->a(Lr80;Lr80;Lp80;Lp80;)Landroid/window/OnBackInvokedCallback;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    new-instance p1, Lqr0;

    .line 53
    .line 54
    const/4 v0, 0x2

    .line 55
    invoke-direct {p1, p0, v0}, Lqr0;-><init>(Landroidx/activity/b;I)V

    .line 56
    .line 57
    .line 58
    sget-object v0, Lrr0;->a:Lrr0;

    .line 59
    .line 60
    invoke-virtual {v0, p1}, Lrr0;->a(Lp80;)Landroid/window/OnBackInvokedCallback;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    :goto_0
    iput-object p1, p0, Landroidx/activity/b;->d:Landroid/window/OnBackInvokedCallback;

    .line 65
    .line 66
    :cond_1
    return-void
.end method


# virtual methods
.method public final a(Lci0;Lr70;)V
    .locals 9

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Lci0;->e()Landroidx/lifecycle/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object v0, p1, Landroidx/lifecycle/a;->b:Lwh0;

    .line 9
    .line 10
    sget-object v1, Lwh0;->j:Lwh0;

    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance v0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1, p2}, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;-><init>(Landroidx/activity/b;Landroidx/lifecycle/a;Lr70;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p2, Lr70;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/activity/b;->d()V

    .line 26
    .line 27
    .line 28
    new-instance v1, Lat;

    .line 29
    .line 30
    const/4 v7, 0x0

    .line 31
    const/4 v8, 0x2

    .line 32
    const/4 v2, 0x0

    .line 33
    const-class v4, Landroidx/activity/b;

    .line 34
    .line 35
    const-string v5, "updateEnabledCallbacks"

    .line 36
    .line 37
    const-string v6, "updateEnabledCallbacks()V"

    .line 38
    .line 39
    move-object v3, p0

    .line 40
    invoke-direct/range {v1 .. v8}, Lat;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;II)V

    .line 41
    .line 42
    .line 43
    iput-object v1, p2, Lr70;->c:Lp80;

    .line 44
    .line 45
    return-void
.end method

.method public final b()V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/activity/b;->b:Laa;

    .line 2
    .line 3
    iget v1, v0, Laa;->l:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/AbstractList;->listIterator(I)Ljava/util/ListIterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    move-object v3, v1

    .line 21
    check-cast v3, Lr70;

    .line 22
    .line 23
    iget-boolean v3, v3, Lr70;->a:Z

    .line 24
    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    move-object v1, v2

    .line 29
    :goto_0
    check-cast v1, Lr70;

    .line 30
    .line 31
    iput-object v2, p0, Landroidx/activity/b;->c:Lr70;

    .line 32
    .line 33
    if-eqz v1, :cond_5

    .line 34
    .line 35
    iget p0, v1, Lr70;->d:I

    .line 36
    .line 37
    packed-switch p0, :pswitch_data_0

    .line 38
    .line 39
    .line 40
    sget-boolean p0, Lcom/melodix/music/AppSingleton;->B:Z

    .line 41
    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    sget-boolean p0, Lcom/melodix/music/WebService;->r:Z

    .line 45
    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    iget-object p0, v1, Lr70;->e:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;

    .line 53
    .line 54
    if-eqz p0, :cond_4

    .line 55
    .line 56
    new-instance v0, Lal0;

    .line 57
    .line 58
    const/4 v2, 0x2

    .line 59
    invoke-direct {v0, v2, v1}, Lal0;-><init>(ILjava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    const-string v1, "(function() { if(window.closeFullscreenPlayer) { let open = !!document.getElementById(\'sf-fs-player\'); if(open) { window.closeFullscreenPlayer(); return true; } } if(document.body.classList.contains(\'sf-expanded\')) { let minBtn = document.querySelector(\'button[aria-label*=\"Minimize\"]:not(#Desktop_LeftSidebar_Id *):not(.YourLibraryX *):not([aria-label*=\"Library\"]), button[aria-label*=\"Back to player\"]\'); if(minBtn) { minBtn.click(); return true; } } if(document.body.classList.contains(\'sf-show-nowplaying\')) { if(window.triggerCloseNowPlay) { window.triggerCloseNowPlay(); } else { document.body.classList.remove(\'sf-show-nowplaying\'); } return true; } if(document.body.classList.contains(\'sf-show-library\')) { if(window.triggerCloseLib) { window.triggerCloseLib(); } else { document.body.classList.remove(\'sf-show-library\'); } return true; } return false; })();"

    .line 63
    .line 64
    invoke-virtual {p0, v1, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    invoke-virtual {v1}, Lr70;->a()V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :pswitch_0
    iget-object p0, v1, Lr70;->e:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast p0, Lz70;

    .line 75
    .line 76
    const/4 v0, 0x1

    .line 77
    invoke-virtual {p0, v0}, Lz70;->y(Z)Z

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lz70;->h:Lr70;

    .line 81
    .line 82
    iget-boolean v0, v0, Lr70;->a:Z

    .line 83
    .line 84
    if-eqz v0, :cond_3

    .line 85
    .line 86
    invoke-virtual {p0}, Lz70;->M()Z

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_3
    iget-object p0, p0, Lz70;->g:Landroidx/activity/b;

    .line 91
    .line 92
    invoke-virtual {p0}, Landroidx/activity/b;->b()V

    .line 93
    .line 94
    .line 95
    :cond_4
    :goto_1
    return-void

    .line 96
    :cond_5
    iget-object p0, p0, Landroidx/activity/b;->a:Ljava/lang/Runnable;

    .line 97
    .line 98
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    nop

    .line 103
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final c(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/activity/b;->e:Landroid/window/OnBackInvokedDispatcher;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Landroidx/activity/b;->d:Landroid/window/OnBackInvokedCallback;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    sget-object v3, Lrr0;->a:Lrr0;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-boolean v4, p0, Landroidx/activity/b;->f:Z

    .line 15
    .line 16
    if-nez v4, :cond_0

    .line 17
    .line 18
    invoke-virtual {v3, v0, v2, v1}, Lrr0;->b(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Landroidx/activity/b;->f:Z

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    if-nez p1, :cond_1

    .line 26
    .line 27
    iget-boolean p1, p0, Landroidx/activity/b;->f:Z

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    invoke-virtual {v3, v0, v1}, Lrr0;->c(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iput-boolean v2, p0, Landroidx/activity/b;->f:Z

    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public final d()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Landroidx/activity/b;->g:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object v2, p0, Landroidx/activity/b;->b:Laa;

    .line 5
    .line 6
    if-eqz v2, :cond_0

    .line 7
    .line 8
    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_2

    .line 24
    .line 25
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Lr70;

    .line 30
    .line 31
    iget-boolean v3, v3, Lr70;->a:Z

    .line 32
    .line 33
    if-eqz v3, :cond_1

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    :cond_2
    :goto_0
    iput-boolean v1, p0, Landroidx/activity/b;->g:Z

    .line 37
    .line 38
    if-eq v1, v0, :cond_3

    .line 39
    .line 40
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 41
    .line 42
    const/16 v2, 0x21

    .line 43
    .line 44
    if-lt v0, v2, :cond_3

    .line 45
    .line 46
    invoke-virtual {p0, v1}, Landroidx/activity/b;->c(Z)V

    .line 47
    .line 48
    .line 49
    :cond_3
    return-void
.end method
