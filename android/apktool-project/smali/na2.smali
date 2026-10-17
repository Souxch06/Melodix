.class public final Lna2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lbb2;
.implements Lcz1;


# instance fields
.field public final synthetic j:Lsa2;


# direct methods
.method public synthetic constructor <init>(Lsa2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lna2;->j:Lsa2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public synthetic a(Ljava/lang/String;ILjava/lang/Throwable;[BLjava/util/Map;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lna2;->j:Lsa2;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Lsa2;->B(Ljava/lang/String;ILjava/lang/Throwable;[BLjava/util/Map;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lna2;->j:Lsa2;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, v1, Lsa2;->u:Ly02;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 14
    .line 15
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 19
    .line 20
    const-string p1, "AppId not known when logging event"

    .line 21
    .line 22
    invoke-virtual {p0, p2, p1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void

    .line 26
    :cond_1
    invoke-virtual {v1}, Lsa2;->c()Ls02;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Lma2;

    .line 31
    .line 32
    invoke-direct {v1, p0, p1, p2, p3}, Lma2;-><init>(Lna2;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
