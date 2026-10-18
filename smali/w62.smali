.class public final Lw62;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lbc2;

.field public final synthetic k:Z

.field public final synthetic l:Lsu1;

.field public final synthetic m:Landroid/os/Bundle;

.field public final synthetic n:Li82;


# direct methods
.method public constructor <init>(Li82;Lbc2;ZLsu1;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lw62;->j:Lbc2;

    .line 5
    .line 6
    iput-boolean p3, p0, Lw62;->k:Z

    .line 7
    .line 8
    iput-object p4, p0, Lw62;->l:Lsu1;

    .line 9
    .line 10
    iput-object p5, p0, Lw62;->m:Landroid/os/Bundle;

    .line 11
    .line 12
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lw62;->n:Li82;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lw62;->n:Li82;

    .line 2
    .line 3
    iget-object v1, v0, Li82;->m:Lcy1;

    .line 4
    .line 5
    iget-object v2, v0, Let;->j:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v2, Ly02;

    .line 8
    .line 9
    const-string v3, "Failed to send default event parameters to service"

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    iget-object p0, v2, Ly02;->o:Lzy1;

    .line 14
    .line 15
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 19
    .line 20
    invoke-virtual {p0, v3}, Lso;->b(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object v4, v2, Ly02;->m:Lmt1;

    .line 25
    .line 26
    sget-object v5, Lxx1;->W0:Lwx1;

    .line 27
    .line 28
    const/4 v6, 0x0

    .line 29
    invoke-virtual {v4, v6, v5}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    iget-object v5, p0, Lw62;->j:Lbc2;

    .line 34
    .line 35
    if-eqz v4, :cond_2

    .line 36
    .line 37
    iget-boolean v2, p0, Lw62;->k:Z

    .line 38
    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget-object v6, p0, Lw62;->l:Lsu1;

    .line 43
    .line 44
    :goto_0
    invoke-virtual {v0, v1, v6, v5}, Li82;->D(Lcy1;Ls0;Lbc2;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    :try_start_0
    iget-object p0, p0, Lw62;->m:Landroid/os/Bundle;

    .line 49
    .line 50
    invoke-interface {v1, p0, v5}, Lcy1;->f(Landroid/os/Bundle;Lbc2;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Li82;->y()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :catch_0
    move-exception p0

    .line 58
    iget-object v0, v2, Ly02;->o:Lzy1;

    .line 59
    .line 60
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, v0, Lzy1;->o:Lso;

    .line 64
    .line 65
    invoke-virtual {v0, p0, v3}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method
