.class public final Lo12;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lbc2;

.field public final synthetic k:Lk22;


# direct methods
.method public constructor <init>(Lk22;Lbc2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lo12;->j:Lbc2;

    .line 5
    .line 6
    iput-object p1, p0, Lo12;->k:Lk22;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lo12;->k:Lk22;

    .line 2
    .line 3
    iget-object v0, v0, Lk22;->b:Lsa2;

    .line 4
    .line 5
    invoke-virtual {v0}, Lsa2;->V()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Lsa2;->c()Ls02;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ls02;->l()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Lsa2;->l0()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lo12;->j:Lbc2;

    .line 19
    .line 20
    iget-object v1, p0, Lbc2;->j:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v1}, Lbh;->e(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p0}, Lsa2;->c0(Lbc2;)Ljz1;

    .line 26
    .line 27
    .line 28
    return-void
.end method
