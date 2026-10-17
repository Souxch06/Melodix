.class public final Lpl1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lig;


# instance fields
.field public final j:Lu5;

.field public final k:Lb6;

.field public l:Lgd0;

.field public m:Ljava/util/Set;

.field public n:Z

.field public final synthetic o:Lza0;


# direct methods
.method public constructor <init>(Lza0;Lu5;Lb6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lpl1;->o:Lza0;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Lpl1;->l:Lgd0;

    .line 8
    .line 9
    iput-object p1, p0, Lpl1;->m:Ljava/util/Set;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lpl1;->n:Z

    .line 13
    .line 14
    iput-object p2, p0, Lpl1;->j:Lu5;

    .line 15
    .line 16
    iput-object p3, p0, Lpl1;->k:Lb6;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a(Loo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lpl1;->o:Lza0;

    .line 2
    .line 3
    iget-object v0, v0, Lza0;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    iget-object p0, p0, Lpl1;->k:Lb6;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lml1;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lml1;->p(Loo;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final b(Loo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lpl1;->o:Lza0;

    .line 2
    .line 3
    iget-object v0, v0, Lza0;->m:Lum1;

    .line 4
    .line 5
    new-instance v1, Lol1;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Lol1;-><init>(Lpl1;Loo;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method
