.class public Landroidx/lifecycle/b;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final j:Ljava/lang/Object;


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Lq21;

.field public c:I

.field public d:Z

.field public volatile e:Ljava/lang/Object;

.field public volatile f:Ljava/lang/Object;

.field public g:I

.field public h:Z

.field public i:Z


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
    sput-object v0, Landroidx/lifecycle/b;->j:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroidx/lifecycle/b;->a:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance v0, Lq21;

    .line 12
    .line 13
    invoke-direct {v0}, Lq21;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Landroidx/lifecycle/b;->b:Lq21;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Landroidx/lifecycle/b;->c:I

    .line 20
    .line 21
    sget-object v0, Landroidx/lifecycle/b;->j:Ljava/lang/Object;

    .line 22
    .line 23
    iput-object v0, p0, Landroidx/lifecycle/b;->f:Ljava/lang/Object;

    .line 24
    .line 25
    iput-object v0, p0, Landroidx/lifecycle/b;->e:Ljava/lang/Object;

    .line 26
    .line 27
    const/4 v0, -0x1

    .line 28
    iput v0, p0, Landroidx/lifecycle/b;->g:I

    .line 29
    .line 30
    return-void
.end method

.method public static a(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ly9;->B()Ly9;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string v0, "Cannot invoke "

    .line 24
    .line 25
    const-string v1, " on a background thread"

    .line 26
    .line 27
    invoke-static {v0, p0, v1}, Loq;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public final b(Lwj0;)V
    .locals 2

    .line 1
    iget-boolean v0, p1, Lwj0;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Lwj0;->e()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    invoke-virtual {p1, p0}, Lwj0;->a(Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    iget v0, p1, Lwj0;->l:I

    .line 18
    .line 19
    iget v1, p0, Landroidx/lifecycle/b;->g:I

    .line 20
    .line 21
    if-lt v0, v1, :cond_2

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_2
    iput v1, p1, Lwj0;->l:I

    .line 25
    .line 26
    iget-object p1, p1, Lwj0;->j:Lbv1;

    .line 27
    .line 28
    iget-object p0, p0, Landroidx/lifecycle/b;->e:Ljava/lang/Object;

    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    check-cast p0, Lci0;

    .line 34
    .line 35
    iget-object p1, p1, Lbv1;->k:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p1, Lpx;

    .line 38
    .line 39
    if-eqz p0, :cond_5

    .line 40
    .line 41
    iget-boolean p0, p1, Lpx;->i0:Z

    .line 42
    .line 43
    if-eqz p0, :cond_5

    .line 44
    .line 45
    invoke-virtual {p1}, Lh70;->I()Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    if-nez v0, :cond_4

    .line 54
    .line 55
    iget-object v0, p1, Lpx;->m0:Landroid/app/Dialog;

    .line 56
    .line 57
    if-eqz v0, :cond_5

    .line 58
    .line 59
    const/4 v0, 0x3

    .line 60
    invoke-static {v0}, Lz70;->F(I)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_3

    .line 65
    .line 66
    iget-object v0, p1, Lpx;->m0:Landroid/app/Dialog;

    .line 67
    .line 68
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    :cond_3
    iget-object p1, p1, Lpx;->m0:Landroid/app/Dialog;

    .line 72
    .line 73
    invoke-virtual {p1, p0}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_4
    const-string p0, "DialogFragment can not be attached to a container view"

    .line 78
    .line 79
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :cond_5
    :goto_0
    return-void
.end method

.method public final c(Lwj0;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Landroidx/lifecycle/b;->h:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Landroidx/lifecycle/b;->i:Z

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iput-boolean v1, p0, Landroidx/lifecycle/b;->h:Z

    .line 10
    .line 11
    :cond_1
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Landroidx/lifecycle/b;->i:Z

    .line 13
    .line 14
    if-eqz p1, :cond_2

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroidx/lifecycle/b;->b(Lwj0;)V

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    goto :goto_0

    .line 21
    :cond_2
    iget-object v1, p0, Landroidx/lifecycle/b;->b:Lq21;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    new-instance v2, Lo21;

    .line 27
    .line 28
    invoke-direct {v2, v1}, Lo21;-><init>(Lq21;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, v1, Lq21;->l:Ljava/util/WeakHashMap;

    .line 32
    .line 33
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-virtual {v1, v2, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    :cond_3
    invoke-virtual {v2}, Lo21;->hasNext()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_4

    .line 43
    .line 44
    invoke-virtual {v2}, Lo21;->next()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Ljava/util/Map$Entry;

    .line 49
    .line 50
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Lwj0;

    .line 55
    .line 56
    invoke-virtual {p0, v1}, Landroidx/lifecycle/b;->b(Lwj0;)V

    .line 57
    .line 58
    .line 59
    iget-boolean v1, p0, Landroidx/lifecycle/b;->i:Z

    .line 60
    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    :cond_4
    :goto_0
    iget-boolean v1, p0, Landroidx/lifecycle/b;->i:Z

    .line 64
    .line 65
    if-nez v1, :cond_1

    .line 66
    .line 67
    iput-boolean v0, p0, Landroidx/lifecycle/b;->h:Z

    .line 68
    .line 69
    return-void
.end method

.method public final d(Lbv1;)V
    .locals 3

    .line 1
    const-string v0, "observeForever"

    .line 2
    .line 3
    invoke-static {v0}, Landroidx/lifecycle/b;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lvj0;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Lwj0;-><init>(Landroidx/lifecycle/b;Lbv1;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Landroidx/lifecycle/b;->b:Lq21;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lq21;->b(Ljava/lang/Object;)Ln21;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/4 v2, 0x1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-object p0, v1, Ln21;->k:Ljava/lang/Object;

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    new-instance v1, Ln21;

    .line 24
    .line 25
    invoke-direct {v1, p1, v0}, Ln21;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget p1, p0, Lq21;->m:I

    .line 29
    .line 30
    add-int/2addr p1, v2

    .line 31
    iput p1, p0, Lq21;->m:I

    .line 32
    .line 33
    iget-object p1, p0, Lq21;->k:Ln21;

    .line 34
    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    iput-object v1, p0, Lq21;->j:Ln21;

    .line 38
    .line 39
    iput-object v1, p0, Lq21;->k:Ln21;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iput-object v1, p1, Ln21;->l:Ln21;

    .line 43
    .line 44
    iput-object p1, v1, Ln21;->m:Ln21;

    .line 45
    .line 46
    iput-object v1, p0, Lq21;->k:Ln21;

    .line 47
    .line 48
    :goto_0
    const/4 p0, 0x0

    .line 49
    :goto_1
    check-cast p0, Lwj0;

    .line 50
    .line 51
    instance-of p1, p0, Landroidx/lifecycle/LiveData$LifecycleBoundObserver;

    .line 52
    .line 53
    if-nez p1, :cond_3

    .line 54
    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    invoke-virtual {v0, v2}, Lwj0;->a(Z)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_3
    const-string p0, "Cannot add the same observer with different lifecycles"

    .line 63
    .line 64
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method
