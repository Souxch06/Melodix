.class public abstract Lq6;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final j:Lp6;

.field public static final k:I

.field public static l:Lbk0;

.field public static m:Lbk0;

.field public static n:Ljava/lang/Boolean;

.field public static o:Z

.field public static final p:Lha;

.field public static final q:Ljava/lang/Object;

.field public static final r:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lp6;

    .line 2
    .line 3
    new-instance v1, Lsx;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-direct {v1, v2}, Lsx;-><init>(I)V

    .line 7
    .line 8
    .line 9
    invoke-direct {v0, v1}, Lp6;-><init>(Lsx;)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lq6;->j:Lp6;

    .line 13
    .line 14
    const/16 v0, -0x64

    .line 15
    .line 16
    sput v0, Lq6;->k:I

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    sput-object v0, Lq6;->l:Lbk0;

    .line 20
    .line 21
    sput-object v0, Lq6;->m:Lbk0;

    .line 22
    .line 23
    sput-object v0, Lq6;->n:Ljava/lang/Boolean;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    sput-boolean v0, Lq6;->o:Z

    .line 27
    .line 28
    new-instance v1, Lha;

    .line 29
    .line 30
    invoke-direct {v1, v0}, Lha;-><init>(I)V

    .line 31
    .line 32
    .line 33
    sput-object v1, Lq6;->p:Lha;

    .line 34
    .line 35
    new-instance v0, Ljava/lang/Object;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lq6;->q:Ljava/lang/Object;

    .line 41
    .line 42
    new-instance v0, Ljava/lang/Object;

    .line 43
    .line 44
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lq6;->r:Ljava/lang/Object;

    .line 48
    .line 49
    return-void
.end method

.method public static a(Landroid/content/Context;)Z
    .locals 4

    .line 1
    sget-object v0, Lq6;->n:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    sget v0, Le9;->j:I

    .line 6
    .line 7
    invoke-static {}, Ld9;->a()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    or-int/lit16 v0, v0, 0x80

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Landroid/content/ComponentName;

    .line 18
    .line 19
    const-class v3, Le9;

    .line 20
    .line 21
    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v2, v0}, Landroid/content/pm/PackageManager;->getServiceInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ServiceInfo;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    iget-object p0, p0, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;

    .line 29
    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    const-string v0, "autoStoreLocales"

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sput-object p0, Lq6;->n:Ljava/lang/Boolean;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catch_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 46
    .line 47
    sput-object p0, Lq6;->n:Ljava/lang/Boolean;

    .line 48
    .line 49
    :cond_0
    :goto_0
    sget-object p0, Lq6;->n:Ljava/lang/Boolean;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0
.end method

.method public static d(Lg7;)V
    .locals 4

    .line 1
    sget-object v0, Lq6;->q:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lq6;->p:Lha;

    .line 5
    .line 6
    invoke-virtual {v1}, Lha;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    :cond_0
    :goto_0
    move-object v2, v1

    .line 11
    check-cast v2, Lgl0;

    .line 12
    .line 13
    invoke-virtual {v2}, Lgl0;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-eqz v3, :cond_2

    .line 18
    .line 19
    invoke-virtual {v2}, Lgl0;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    check-cast v3, Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Lq6;

    .line 30
    .line 31
    if-eq v3, p0, :cond_1

    .line 32
    .line 33
    if-nez v3, :cond_0

    .line 34
    .line 35
    :cond_1
    invoke-virtual {v2}, Lgl0;->remove()V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto :goto_1

    .line 41
    :cond_2
    monitor-exit v0

    .line 42
    return-void

    .line 43
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    throw p0
.end method


# virtual methods
.method public abstract b()V
.end method

.method public abstract c()V
.end method

.method public abstract f(I)Z
.end method

.method public abstract g(I)V
.end method

.method public abstract h(Landroid/view/View;)V
.end method

.method public abstract i(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
.end method

.method public abstract j(Ljava/lang/CharSequence;)V
.end method
