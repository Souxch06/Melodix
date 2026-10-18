.class public final Lis0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Llw0;


# static fields
.field public static final c:Lo40;

.field public static final d:Llm;


# instance fields
.field public a:Llw;

.field public volatile b:Llw0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lo40;

    .line 2
    .line 3
    const/16 v1, 0x11

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lo40;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lis0;->c:Lo40;

    .line 9
    .line 10
    new-instance v0, Llm;

    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    invoke-direct {v0, v1}, Llm;-><init>(I)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lis0;->d:Llm;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Lo40;Llw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lis0;->a:Llw;

    .line 5
    .line 6
    iput-object p2, p0, Lis0;->b:Llw0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Llw;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lis0;->b:Llw0;

    .line 2
    .line 3
    sget-object v1, Lis0;->d:Llm;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    invoke-interface {p1, v0}, Llw;->a(Llw0;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    monitor-enter p0

    .line 12
    :try_start_0
    iget-object v0, p0, Lis0;->b:Llw0;

    .line 13
    .line 14
    if-eq v0, v1, :cond_1

    .line 15
    .line 16
    move-object v1, v0

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    iget-object v1, p0, Lis0;->a:Llw;

    .line 19
    .line 20
    new-instance v2, Lkm;

    .line 21
    .line 22
    const/4 v3, 0x7

    .line 23
    invoke-direct {v2, v1, v3, p1}, Lkm;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iput-object v2, p0, Lis0;->a:Llw;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    invoke-interface {p1, v0}, Llw;->a(Llw0;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    return-void

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    throw p1
.end method

.method public final get()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lis0;->b:Llw0;

    .line 2
    .line 3
    invoke-interface {p0}, Llw0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
