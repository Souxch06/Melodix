.class public final Lgw1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Llb2;
.implements Lcs0;
.implements Lyr0;
.implements Lvr0;


# instance fields
.field public final synthetic j:I

.field public final k:Ljava/util/concurrent/Executor;

.field public final l:Ljq;

.field public final m:Ljd2;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/Executor;Ljq;Ljd2;I)V
    .locals 0

    .line 1
    iput p4, p0, Lgw1;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lgw1;->k:Ljava/util/concurrent/Executor;

    .line 4
    .line 5
    iput-object p2, p0, Lgw1;->l:Ljq;

    .line 6
    .line 7
    iput-object p3, p0, Lgw1;->m:Ljd2;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a(Ljd2;)V
    .locals 1

    .line 1
    iget v0, p0, Lgw1;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance v0, Lyw1;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Lyw1;-><init>(Lgw1;Ljd2;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lgw1;->k:Ljava/util/concurrent/Executor;

    .line 12
    .line 13
    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :pswitch_0
    new-instance v0, Liv1;

    .line 18
    .line 19
    invoke-direct {v0, p0, p1}, Liv1;-><init>(Lgw1;Ljd2;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lgw1;->k:Ljava/util/concurrent/Executor;

    .line 23
    .line 24
    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    nop

    .line 29
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public g()V
    .locals 0

    .line 1
    iget-object p0, p0, Lgw1;->m:Ljd2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljd2;->o()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lgw1;->m:Ljd2;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljd2;->l(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lgw1;->m:Ljd2;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljd2;->n(Ljava/lang/Exception;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
