.class public final Lu62;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lm52;

.field public final synthetic k:Li82;


# direct methods
.method public constructor <init>(Li82;Lm52;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lu62;->j:Lm52;

    .line 5
    .line 6
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lu62;->k:Li82;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    iget-object v1, p0, Lu62;->k:Li82;

    .line 2
    .line 3
    iget-object v2, v1, Li82;->m:Lcy1;

    .line 4
    .line 5
    iget-object v0, v1, Let;->j:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Ly02;

    .line 8
    .line 9
    if-nez v2, :cond_0

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
    const-string v0, "Failed to send current screen to service"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lso;->b(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    :try_start_0
    iget-object p0, p0, Lu62;->j:Lm52;

    .line 25
    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    iget-object p0, v0, Ly02;->j:Landroid/content/Context;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v7

    .line 34
    const-wide/16 v3, 0x0

    .line 35
    .line 36
    const/4 v5, 0x0

    .line 37
    const/4 v6, 0x0

    .line 38
    invoke-interface/range {v2 .. v7}, Lcy1;->n(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catch_0
    move-exception v0

    .line 43
    move-object p0, v0

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    iget-wide v3, p0, Lm52;->c:J

    .line 46
    .line 47
    iget-object v5, p0, Lm52;->a:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v6, p0, Lm52;->b:Ljava/lang/String;

    .line 50
    .line 51
    iget-object p0, v0, Ly02;->j:Landroid/content/Context;

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v7

    .line 57
    invoke-interface/range {v2 .. v7}, Lcy1;->n(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :goto_0
    invoke-virtual {v1}, Li82;->y()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :goto_1
    iget-object v0, v1, Let;->j:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v0, Ly02;

    .line 67
    .line 68
    iget-object v0, v0, Ly02;->o:Lzy1;

    .line 69
    .line 70
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, v0, Lzy1;->o:Lso;

    .line 74
    .line 75
    const-string v1, "Failed to send current screen to the service"

    .line 76
    .line 77
    invoke-virtual {v0, p0, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method
