.class public final synthetic Lu72;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lx72;


# direct methods
.method public synthetic constructor <init>(Lx72;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lu72;->j:Lx72;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object p0, p0, Lu72;->j:Lx72;

    .line 2
    .line 3
    iget-object p0, p0, Lx72;->k:Ly72;

    .line 4
    .line 5
    iget-object p0, p0, Ly72;->l:Li82;

    .line 6
    .line 7
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ly02;

    .line 10
    .line 11
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 12
    .line 13
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Lv72;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lv72;-><init>(Li82;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
