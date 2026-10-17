.class public final Lfu;
.super Lcb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lf90;


# instance fields
.field public final synthetic n:I

.field public synthetic o:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILiq;I)V
    .locals 0

    .line 11
    iput p3, p0, Lfu;->n:I

    invoke-direct {p0, p1, p2}, Lcb1;-><init>(ILiq;)V

    return-void
.end method

.method public constructor <init>(Lr41;Liq;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    iput v0, p0, Lfu;->n:I

    .line 3
    .line 4
    iput-object p1, p0, Lfu;->o:Ljava/lang/Object;

    .line 5
    .line 6
    const/4 p1, 0x2

    .line 7
    invoke-direct {p0, p1, p2}, Lcb1;-><init>(ILiq;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, Lfu;->n:I

    .line 2
    .line 3
    sget-object v1, Lwe1;->a:Lwe1;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p1, Lr41;

    .line 9
    .line 10
    check-cast p2, Liq;

    .line 11
    .line 12
    invoke-virtual {p0, p2, p1}, Lfu;->j(Liq;Ljava/lang/Object;)Liq;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lfu;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Lfu;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :pswitch_0
    check-cast p1, Ljava/lang/String;

    .line 24
    .line 25
    check-cast p2, Liq;

    .line 26
    .line 27
    invoke-virtual {p0, p2, p1}, Lfu;->j(Liq;Ljava/lang/Object;)Liq;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lfu;

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Lfu;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    return-object v1

    .line 37
    :pswitch_1
    check-cast p1, Lr91;

    .line 38
    .line 39
    check-cast p2, Liq;

    .line 40
    .line 41
    invoke-virtual {p0, p2, p1}, Lfu;->j(Liq;Ljava/lang/Object;)Liq;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Lfu;

    .line 46
    .line 47
    invoke-virtual {p0, v1}, Lfu;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0

    .line 52
    nop

    .line 53
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final j(Liq;Ljava/lang/Object;)Liq;
    .locals 2

    .line 1
    iget v0, p0, Lfu;->n:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance p2, Lfu;

    .line 7
    .line 8
    iget-object p0, p0, Lfu;->o:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p0, Lr41;

    .line 11
    .line 12
    invoke-direct {p2, p0, p1}, Lfu;-><init>(Lr41;Liq;)V

    .line 13
    .line 14
    .line 15
    return-object p2

    .line 16
    :pswitch_0
    new-instance p0, Lfu;

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-direct {p0, v0, p1, v1}, Lfu;-><init>(ILiq;I)V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Lfu;->o:Ljava/lang/Object;

    .line 24
    .line 25
    return-object p0

    .line 26
    :pswitch_1
    new-instance p0, Lfu;

    .line 27
    .line 28
    const/4 v0, 0x2

    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-direct {p0, v0, p1, v1}, Lfu;-><init>(ILiq;I)V

    .line 31
    .line 32
    .line 33
    iput-object p2, p0, Lfu;->o:Ljava/lang/Object;

    .line 34
    .line 35
    return-object p0

    .line 36
    nop

    .line 37
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Lfu;->n:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lfu;->o:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Lr41;

    .line 12
    .line 13
    return-object p0

    .line 14
    :pswitch_0
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lfu;->o:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p0, Ljava/lang/String;

    .line 20
    .line 21
    sget-object p0, Lwe1;->a:Lwe1;

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_1
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lfu;->o:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p0, Lr91;

    .line 30
    .line 31
    instance-of p0, p0, Lp30;

    .line 32
    .line 33
    xor-int/lit8 p0, p0, 0x1

    .line 34
    .line 35
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    nop

    .line 41
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
