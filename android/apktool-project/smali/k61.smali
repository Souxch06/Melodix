.class public final Lk61;
.super Lcb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lf90;


# instance fields
.field public final synthetic n:I

.field public o:I

.field public final synthetic p:Lm61;


# direct methods
.method public synthetic constructor <init>(Lm61;Liq;I)V
    .locals 0

    .line 1
    iput p3, p0, Lk61;->n:I

    .line 2
    .line 3
    iput-object p1, p0, Lk61;->p:Lm61;

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-direct {p0, p1, p2}, Lcb1;-><init>(ILiq;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, Lk61;->n:I

    .line 2
    .line 3
    sget-object v1, Lwe1;->a:Lwe1;

    .line 4
    .line 5
    check-cast p1, Lzq;

    .line 6
    .line 7
    check-cast p2, Liq;

    .line 8
    .line 9
    packed-switch v0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p2, p1}, Lk61;->j(Liq;Ljava/lang/Object;)Liq;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lk61;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Lk61;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :pswitch_0
    invoke-virtual {p0, p2, p1}, Lk61;->j(Liq;Ljava/lang/Object;)Liq;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lk61;

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Lk61;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    nop

    .line 35
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final j(Liq;Ljava/lang/Object;)Liq;
    .locals 1

    .line 1
    iget p2, p0, Lk61;->n:I

    .line 2
    .line 3
    iget-object p0, p0, Lk61;->p:Lm61;

    .line 4
    .line 5
    packed-switch p2, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    new-instance p2, Lk61;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-direct {p2, p0, p1, v0}, Lk61;-><init>(Lm61;Liq;I)V

    .line 12
    .line 13
    .line 14
    return-object p2

    .line 15
    :pswitch_0
    new-instance p2, Lk61;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-direct {p2, p0, p1, v0}, Lk61;-><init>(Lm61;Liq;I)V

    .line 19
    .line 20
    .line 21
    return-object p2

    .line 22
    nop

    .line 23
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget v0, p0, Lk61;->n:I

    .line 2
    .line 3
    iget-object v1, p0, Lk61;->p:Lm61;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    .line 7
    .line 8
    sget-object v4, Lar;->j:Lar;

    .line 9
    .line 10
    const/4 v5, 0x1

    .line 11
    packed-switch v0, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    iget v0, p0, Lk61;->o:I

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    if-ne v0, v5, :cond_0

    .line 19
    .line 20
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-static {v3}, Lz0;->g(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    move-object p1, v2

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, v1, Lm61;->b:Lyt;

    .line 33
    .line 34
    invoke-interface {p1}, Lyt;->getData()Lr50;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput v5, p0, Lk61;->o:I

    .line 39
    .line 40
    invoke-static {p1, p0}, Lea1;->d(Lr50;Lkq;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    if-ne p1, v4, :cond_2

    .line 45
    .line 46
    move-object p1, v4

    .line 47
    :cond_2
    :goto_0
    return-object p1

    .line 48
    :pswitch_0
    iget v0, p0, Lk61;->o:I

    .line 49
    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    if-ne v0, v5, :cond_3

    .line 53
    .line 54
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    invoke-static {v3}, Lz0;->g(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_4
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, v1, Lm61;->b:Lyt;

    .line 66
    .line 67
    invoke-interface {p1}, Lyt;->getData()Lr50;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iget-object v0, v1, Lm61;->c:Ljava/util/concurrent/atomic/AtomicReference;

    .line 72
    .line 73
    new-instance v1, Lj61;

    .line 74
    .line 75
    invoke-direct {v1, v0}, Lj61;-><init>(Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 76
    .line 77
    .line 78
    iput v5, p0, Lk61;->o:I

    .line 79
    .line 80
    invoke-interface {p1, v1, p0}, Lr50;->q(Ls50;Lkq;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    if-ne p0, v4, :cond_5

    .line 85
    .line 86
    move-object v2, v4

    .line 87
    goto :goto_2

    .line 88
    :cond_5
    :goto_1
    sget-object v2, Lwe1;->a:Lwe1;

    .line 89
    .line 90
    :goto_2
    return-object v2

    .line 91
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
