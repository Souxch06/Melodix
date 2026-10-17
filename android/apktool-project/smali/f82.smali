.class public final synthetic Lf82;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Li82;

.field public final synthetic k:Lbc2;

.field public final synthetic l:Ljq1;


# direct methods
.method public synthetic constructor <init>(Li82;Lbc2;Ljq1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lf82;->j:Li82;

    .line 5
    .line 6
    iput-object p2, p0, Lf82;->k:Lbc2;

    .line 7
    .line 8
    iput-object p3, p0, Lf82;->l:Ljq1;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lf82;->k:Lbc2;

    .line 2
    .line 3
    iget-object v1, p0, Lf82;->l:Ljq1;

    .line 4
    .line 5
    iget-object p0, p0, Lf82;->j:Li82;

    .line 6
    .line 7
    iget-object v2, p0, Let;->j:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v2, Ly02;

    .line 10
    .line 11
    iget-object v3, p0, Li82;->m:Lcy1;

    .line 12
    .line 13
    if-nez v3, :cond_0

    .line 14
    .line 15
    iget-object p0, v2, Ly02;->o:Lzy1;

    .line 16
    .line 17
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 21
    .line 22
    const-string v0, "[sgtm] Discarding data. Failed to update batch upload status."

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lso;->b(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    :try_start_0
    invoke-interface {v3, v0, v1}, Lcy1;->D(Lbc2;Ljq1;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Li82;->y()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :catch_0
    move-exception p0

    .line 36
    iget-object v0, v2, Ly02;->o:Lzy1;

    .line 37
    .line 38
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, v0, Lzy1;->o:Lso;

    .line 42
    .line 43
    iget-wide v1, v1, Ljq1;->j:J

    .line 44
    .line 45
    const-string v3, "[sgtm] Failed to update batch upload status, rowId, exception"

    .line 46
    .line 47
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v3, v1, p0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
