.class public final Lur0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lsi;


# instance fields
.field public final j:Lr70;

.field public final synthetic k:Landroidx/activity/b;


# direct methods
.method public constructor <init>(Landroidx/activity/b;Lr70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lur0;->k:Landroidx/activity/b;

    .line 8
    .line 9
    iput-object p2, p0, Lur0;->j:Lr70;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final cancel()V
    .locals 4

    .line 1
    iget-object v0, p0, Lur0;->k:Landroidx/activity/b;

    .line 2
    .line 3
    iget-object v1, v0, Landroidx/activity/b;->b:Laa;

    .line 4
    .line 5
    iget-object v2, p0, Lur0;->j:Lr70;

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Laa;->remove(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object v1, v0, Landroidx/activity/b;->c:Lr70;

    .line 11
    .line 12
    invoke-static {v1, v2}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v3, 0x0

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iput-object v3, v0, Landroidx/activity/b;->c:Lr70;

    .line 23
    .line 24
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    iget-object v0, v2, Lr70;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    iget-object p0, v2, Lr70;->c:Lp80;

    .line 33
    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    invoke-interface {p0}, Lp80;->a()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    :cond_1
    iput-object v3, v2, Lr70;->c:Lp80;

    .line 40
    .line 41
    return-void
.end method
