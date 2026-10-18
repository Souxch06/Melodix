.class public final Le52;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final j:Ljava/lang/Object;

.field public static final k:Ljava/util/concurrent/atomic/AtomicReference;

.field public static volatile l:Le52;

.field public static final m:Lsa1;


# instance fields
.field public final a:Ll42;

.field public final b:Landroid/content/Context;

.field public final c:Lsa1;

.field public final d:Lsa1;

.field public final e:Lsa1;

.field public final f:Lsa1;

.field public final g:Lec2;

.field public final h:Lsa1;

.field public final i:Lqb2;


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
    sput-object v0, Le52;->j:Ljava/lang/Object;

    .line 7
    .line 8
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Le52;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    sput-object v0, Le52;->l:Le52;

    .line 17
    .line 18
    sget-object v0, Lnv1;->J:Lnv1;

    .line 19
    .line 20
    invoke-static {v0}, Lkn1;->h(Lsa1;)Lsa1;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sput-object v0, Le52;->m:Lsa1;

    .line 25
    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lsa1;Lsa1;Lsa1;Lsa1;Lsa1;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll42;

    .line 5
    .line 6
    invoke-direct {v0}, Ll42;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Le52;->a:Ll42;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    invoke-static {p2}, Lkn1;->h(Lsa1;)Lsa1;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-static {p3}, Lkn1;->h(Lsa1;)Lsa1;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    new-instance v0, Lmd1;

    .line 42
    .line 43
    const/16 v1, 0xe

    .line 44
    .line 45
    invoke-direct {v0, v1, p4}, Lmd1;-><init>(ILjava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0}, Lkn1;->h(Lsa1;)Lsa1;

    .line 49
    .line 50
    .line 51
    move-result-object p4

    .line 52
    invoke-static {p5}, Lkn1;->h(Lsa1;)Lsa1;

    .line 53
    .line 54
    .line 55
    move-result-object p5

    .line 56
    invoke-static {p6}, Lkn1;->h(Lsa1;)Lsa1;

    .line 57
    .line 58
    .line 59
    move-result-object p6

    .line 60
    iput-object p1, p0, Le52;->b:Landroid/content/Context;

    .line 61
    .line 62
    iput-object p2, p0, Le52;->c:Lsa1;

    .line 63
    .line 64
    iput-object p3, p0, Le52;->d:Lsa1;

    .line 65
    .line 66
    iput-object p4, p0, Le52;->e:Lsa1;

    .line 67
    .line 68
    iput-object p5, p0, Le52;->f:Lsa1;

    .line 69
    .line 70
    new-instance v0, Lec2;

    .line 71
    .line 72
    invoke-direct {v0, p1, p2, p5, p3}, Lec2;-><init>(Landroid/content/Context;Lsa1;Lsa1;Lsa1;)V

    .line 73
    .line 74
    .line 75
    iput-object v0, p0, Le52;->g:Lec2;

    .line 76
    .line 77
    iput-object p6, p0, Le52;->h:Lsa1;

    .line 78
    .line 79
    new-instance p5, Lqb2;

    .line 80
    .line 81
    invoke-direct {p5, p1, p2, p4, p3}, Lqb2;-><init>(Landroid/content/Context;Lsa1;Lsa1;Lsa1;)V

    .line 82
    .line 83
    .line 84
    iput-object p5, p0, Le52;->i:Lqb2;

    .line 85
    .line 86
    return-void
.end method

.method public static b()V
    .locals 2

    .line 1
    sget-object v0, Lrs0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    sget-object v0, Le52;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lrs0;->d:Lab0;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Lab0;

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-direct {v0, v1}, Lab0;-><init>(I)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lrs0;->d:Lab0;

    .line 24
    .line 25
    :cond_0
    return-void

    .line 26
    :catchall_0
    move-exception v1

    .line 27
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw v1
.end method


# virtual methods
.method public final a()Lho0;
    .locals 0

    .line 1
    iget-object p0, p0, Le52;->c:Lsa1;

    .line 2
    .line 3
    invoke-interface {p0}, Lsa1;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lho0;

    .line 8
    .line 9
    return-object p0
.end method
