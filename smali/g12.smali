.class public final Lg12;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lsr1;

.field public final synthetic k:Lbc2;

.field public final synthetic l:Lk22;


# direct methods
.method public constructor <init>(Lk22;Lsr1;Lbc2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lg12;->j:Lsr1;

    .line 5
    .line 6
    iput-object p3, p0, Lg12;->k:Lbc2;

    .line 7
    .line 8
    iput-object p1, p0, Lg12;->l:Lk22;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lg12;->l:Lk22;

    .line 2
    .line 3
    iget-object v0, v0, Lk22;->b:Lsa2;

    .line 4
    .line 5
    invoke-virtual {v0}, Lsa2;->V()V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lg12;->j:Lsr1;

    .line 9
    .line 10
    iget-object v2, v1, Lsr1;->l:Lwa2;

    .line 11
    .line 12
    invoke-virtual {v2}, Lwa2;->b()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget-object p0, p0, Lg12;->k:Lbc2;

    .line 17
    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0, v1, p0}, Lsa2;->a0(Lsr1;Lbc2;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {v0, v1, p0}, Lsa2;->Z(Lsr1;Lbc2;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
