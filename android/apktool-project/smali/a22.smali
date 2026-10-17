.class public final synthetic La22;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lk22;

.field public final synthetic k:Lbc2;

.field public final synthetic l:Landroid/os/Bundle;

.field public final synthetic m:Lfy1;

.field public final synthetic n:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lk22;Lbc2;Landroid/os/Bundle;Lfy1;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, La22;->j:Lk22;

    .line 5
    .line 6
    iput-object p2, p0, La22;->k:Lbc2;

    .line 7
    .line 8
    iput-object p3, p0, La22;->l:Landroid/os/Bundle;

    .line 9
    .line 10
    iput-object p4, p0, La22;->m:Lfy1;

    .line 11
    .line 12
    iput-object p5, p0, La22;->n:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, La22;->m:Lfy1;

    .line 2
    .line 3
    iget-object v1, p0, La22;->j:Lk22;

    .line 4
    .line 5
    iget-object v1, v1, Lk22;->b:Lsa2;

    .line 6
    .line 7
    invoke-virtual {v1}, Lsa2;->V()V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, La22;->l:Landroid/os/Bundle;

    .line 11
    .line 12
    iget-object v3, p0, La22;->k:Lbc2;

    .line 13
    .line 14
    invoke-virtual {v1, v2, v3}, Lsa2;->d0(Landroid/os/Bundle;Lbc2;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    :try_start_0
    invoke-interface {v0, v2}, Lfy1;->r(Ljava/util/List;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catch_0
    move-exception v0

    .line 23
    invoke-virtual {v1}, Lsa2;->b()Lzy1;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v1, v1, Lzy1;->o:Lso;

    .line 28
    .line 29
    const-string v2, "Failed to return trigger URIs for app"

    .line 30
    .line 31
    iget-object p0, p0, La22;->n:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v1, v2, p0, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
