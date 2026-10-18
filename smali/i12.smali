.class public final Li12;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lsr1;

.field public final synthetic k:Lk22;


# direct methods
.method public constructor <init>(Lk22;Lsr1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Li12;->j:Lsr1;

    .line 5
    .line 6
    iput-object p1, p0, Li12;->k:Lk22;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Li12;->k:Lk22;

    .line 2
    .line 3
    iget-object v0, v0, Lk22;->b:Lsa2;

    .line 4
    .line 5
    invoke-virtual {v0}, Lsa2;->V()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Li12;->j:Lsr1;

    .line 9
    .line 10
    iget-object v1, p0, Lsr1;->l:Lwa2;

    .line 11
    .line 12
    invoke-virtual {v1}, Lwa2;->b()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lsr1;->j:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1}, Lbh;->h(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lsa2;->Q(Ljava/lang/String;)Lbc2;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0, p0, v1}, Lsa2;->a0(Lsr1;Lbc2;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lsr1;->j:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v1}, Lbh;->h(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lsa2;->Q(Ljava/lang/String;)Lbc2;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    invoke-virtual {v0, p0, v1}, Lsa2;->Z(Lsr1;Lbc2;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method
