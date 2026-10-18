.class public final synthetic La82;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Li82;


# direct methods
.method public synthetic constructor <init>(Li82;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, La82;->j:Li82;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object p0, p0, La82;->j:Li82;

    .line 2
    .line 3
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Ly02;

    .line 6
    .line 7
    iget-object v1, p0, Li82;->m:Lcy1;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iget-object p0, v0, Ly02;->o:Lzy1;

    .line 12
    .line 13
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 17
    .line 18
    const-string v0, "Failed to send Dma consent settings to service"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lso;->b(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const/4 v2, 0x0

    .line 25
    :try_start_0
    invoke-virtual {p0, v2}, Li82;->B(Z)Lbc2;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-interface {v1, v2}, Lcy1;->z(Lbc2;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Li82;->y()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :catch_0
    move-exception p0

    .line 37
    iget-object v0, v0, Ly02;->o:Lzy1;

    .line 38
    .line 39
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, v0, Lzy1;->o:Lso;

    .line 43
    .line 44
    const-string v1, "Failed to send Dma consent settings to the service"

    .line 45
    .line 46
    invoke-virtual {v0, p0, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method
