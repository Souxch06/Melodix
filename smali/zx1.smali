.class public final Lzx1;
.super Lwm1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic g:Ljg;


# direct methods
.method public constructor <init>(Ljg;ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lzx1;->g:Ljg;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, p3}, Lwm1;-><init>(Ljg;ILandroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lzx1;->g:Ljg;

    .line 2
    .line 3
    iget-object p0, p0, Ljg;->s:Lig;

    .line 4
    .line 5
    sget-object v0, Loo;->o:Loo;

    .line 6
    .line 7
    invoke-interface {p0, v0}, Lig;->b(Loo;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public final b(Loo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lzx1;->g:Ljg;

    .line 2
    .line 3
    iget-object p0, p0, Ljg;->s:Lig;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lig;->b(Loo;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    return-void
.end method
