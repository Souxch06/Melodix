.class public final Lkv;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lub0;
.implements Lvb0;


# instance fields
.field public final a:Llh0;

.field public final b:Landroid/content/Context;

.field public final c:Llw0;

.field public final d:Ljava/util/Set;

.field public final e:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/util/Set;Llw0;Ljava/util/concurrent/Executor;)V
    .locals 3

    .line 1
    new-instance v0, Llh0;

    .line 2
    .line 3
    new-instance v1, Lmm;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-direct {v1, p1, v2, p2}, Lmm;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    invoke-direct {v0, v1}, Llh0;-><init>(Llw0;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lkv;->a:Llh0;

    .line 16
    .line 17
    iput-object p3, p0, Lkv;->d:Ljava/util/Set;

    .line 18
    .line 19
    iput-object p5, p0, Lkv;->e:Ljava/util/concurrent/Executor;

    .line 20
    .line 21
    iput-object p4, p0, Lkv;->c:Llw0;

    .line 22
    .line 23
    iput-object p1, p0, Lkv;->b:Landroid/content/Context;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final a()Ljd2;
    .locals 2

    .line 1
    iget-object v0, p0, Lkv;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lbg1;->a(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    invoke-static {p0}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    new-instance v0, Ljv;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-direct {v0, p0, v1}, Ljv;-><init>(Lkv;I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lkv;->e:Ljava/util/concurrent/Executor;

    .line 23
    .line 24
    invoke-static {p0, v0}, Lbe2;->c(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Ljd2;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public final b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lkv;->d:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Set;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-gtz v0, :cond_0

    .line 9
    .line 10
    invoke-static {v1}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lkv;->b:Landroid/content/Context;

    .line 15
    .line 16
    invoke-static {v0}, Lbg1;->a(Landroid/content/Context;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-static {v1}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    new-instance v0, Ljv;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-direct {v0, p0, v1}, Ljv;-><init>(Lkv;I)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lkv;->e:Ljava/util/concurrent/Executor;

    .line 33
    .line 34
    invoke-static {p0, v0}, Lbe2;->c(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Ljd2;

    .line 35
    .line 36
    .line 37
    return-void
.end method
