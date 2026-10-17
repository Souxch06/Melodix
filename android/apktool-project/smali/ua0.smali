.class public abstract Lua0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/lang/String;

.field public final c:Ls7;

.field public final d:Lt5;

.field public final e:Lb6;

.field public final f:Landroid/os/Looper;

.field public final g:I

.field public final h:Lok0;

.field public final i:Lza0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ls7;Lt5;Lta0;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "Null context is not permitted."

    .line 5
    .line 6
    invoke-static {p1, v0}, Lbh;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string v0, "Api must not be null."

    .line 10
    .line 11
    invoke-static {p2, v0}, Lbh;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v0, "Settings must not be null; use Settings.DEFAULT_SETTINGS instead."

    .line 15
    .line 16
    invoke-static {p4, v0}, Lbh;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "The provided context did not have an application context."

    .line 24
    .line 25
    invoke-static {v0, v1}, Lbh;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lua0;->a:Landroid/content/Context;

    .line 29
    .line 30
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 31
    .line 32
    const/16 v2, 0x1e

    .line 33
    .line 34
    if-lt v1, v2, :cond_0

    .line 35
    .line 36
    invoke-static {p1}, Lf1;->k(Landroid/content/Context;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/4 p1, 0x0

    .line 42
    :goto_0
    iput-object p1, p0, Lua0;->b:Ljava/lang/String;

    .line 43
    .line 44
    iput-object p2, p0, Lua0;->c:Ls7;

    .line 45
    .line 46
    iput-object p3, p0, Lua0;->d:Lt5;

    .line 47
    .line 48
    iget-object v1, p4, Lta0;->b:Landroid/os/Looper;

    .line 49
    .line 50
    iput-object v1, p0, Lua0;->f:Landroid/os/Looper;

    .line 51
    .line 52
    new-instance v1, Lb6;

    .line 53
    .line 54
    invoke-direct {v1, p2, p3, p1}, Lb6;-><init>(Ls7;Lt5;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iput-object v1, p0, Lua0;->e:Lb6;

    .line 58
    .line 59
    new-instance p1, Lql1;

    .line 60
    .line 61
    invoke-static {v0}, Lza0;->e(Landroid/content/Context;)Lza0;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Lua0;->i:Lza0;

    .line 66
    .line 67
    iget-object p2, p1, Lza0;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 68
    .line 69
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    iput p2, p0, Lua0;->g:I

    .line 74
    .line 75
    iget-object p2, p4, Lta0;->a:Lok0;

    .line 76
    .line 77
    iput-object p2, p0, Lua0;->h:Lok0;

    .line 78
    .line 79
    iget-object p1, p1, Lza0;->m:Lum1;

    .line 80
    .line 81
    const/4 p2, 0x7

    .line 82
    invoke-virtual {p1, p2, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p1, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 87
    .line 88
    .line 89
    return-void
.end method


# virtual methods
.method public final a()Lc9;
    .locals 4

    .line 1
    new-instance v0, Lc9;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lc9;-><init>(IZ)V

    .line 7
    .line 8
    .line 9
    sget-object v1, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 10
    .line 11
    iget-object v3, v0, Lc9;->k:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v3, Lha;

    .line 14
    .line 15
    if-nez v3, :cond_0

    .line 16
    .line 17
    new-instance v3, Lha;

    .line 18
    .line 19
    invoke-direct {v3, v2}, Lha;-><init>(I)V

    .line 20
    .line 21
    .line 22
    iput-object v3, v0, Lc9;->k:Ljava/lang/Object;

    .line 23
    .line 24
    :cond_0
    invoke-virtual {v3, v1}, Lha;->addAll(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lua0;->a:Landroid/content/Context;

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iput-object v1, v0, Lc9;->m:Ljava/lang/Object;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    iput-object p0, v0, Lc9;->l:Ljava/lang/Object;

    .line 44
    .line 45
    return-object v0
.end method

.method public final b(ILo80;)Ljd2;
    .locals 4

    .line 1
    new-instance v0, Llb1;

    .line 2
    .line 3
    invoke-direct {v0}, Llb1;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lua0;->i:Lza0;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    new-instance v2, Llm1;

    .line 12
    .line 13
    iget-object v3, p0, Lua0;->h:Lok0;

    .line 14
    .line 15
    invoke-direct {v2, p1, p2, v0, v3}, Llm1;-><init>(ILo80;Llb1;Lok0;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, v1, Lza0;->i:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 19
    .line 20
    new-instance p2, Lxl1;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-direct {p2, v2, p1, p0}, Lxl1;-><init>(Lul1;ILua0;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, v1, Lza0;->m:Lum1;

    .line 30
    .line 31
    const/4 p1, 0x4

    .line 32
    invoke-virtual {p0, p1, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 37
    .line 38
    .line 39
    iget-object p0, v0, Llb1;->a:Ljd2;

    .line 40
    .line 41
    return-object p0
.end method
