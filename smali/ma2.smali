.class public final Lma2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljava/lang/String;

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Landroid/os/Bundle;

.field public final synthetic m:Lna2;


# direct methods
.method public constructor <init>(Lna2;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lma2;->j:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p3, p0, Lma2;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Lma2;->l:Landroid/os/Bundle;

    .line 9
    .line 10
    iput-object p1, p0, Lma2;->m:Lna2;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    .line 1
    iget-object v0, p0, Lma2;->m:Lna2;

    .line 2
    .line 3
    iget-object v0, v0, Lna2;->j:Lsa2;

    .line 4
    .line 5
    invoke-virtual {v0}, Lsa2;->k0()Lcb2;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0}, Lsa2;->f()Lmz;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v5

    .line 20
    invoke-virtual {v0}, Lsa2;->e0()Lmt1;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const/4 v3, 0x0

    .line 25
    sget-object v4, Lxx1;->e1:Lwx1;

    .line 26
    .line 27
    invoke-virtual {v2, v3, v4}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    invoke-virtual {v0}, Lsa2;->f()Lmz;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 41
    .line 42
    .line 43
    move-result-wide v2

    .line 44
    :goto_0
    move-wide v7, v2

    .line 45
    goto :goto_1

    .line 46
    :cond_0
    const-wide/16 v2, 0x0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :goto_1
    const-string v4, "auto"

    .line 50
    .line 51
    const/4 v9, 0x0

    .line 52
    iget-object v2, p0, Lma2;->k:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v3, p0, Lma2;->l:Landroid/os/Bundle;

    .line 55
    .line 56
    invoke-virtual/range {v1 .. v9}, Lcb2;->S(Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;JJZ)Ltu1;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-static {v1}, Lbh;->h(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lma2;->j:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v0, p0, v1}, Lsa2;->h(Ljava/lang/String;Ltu1;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method
