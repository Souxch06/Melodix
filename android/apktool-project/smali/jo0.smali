.class public final Ljo0;
.super Lcb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lf90;


# instance fields
.field public final synthetic n:I

.field public final synthetic o:Lno0;


# direct methods
.method public synthetic constructor <init>(Lno0;Liq;I)V
    .locals 0

    .line 1
    iput p3, p0, Ljo0;->n:I

    .line 2
    .line 3
    iput-object p1, p0, Ljo0;->o:Lno0;

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
    iget v0, p0, Ljo0;->n:I

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
    invoke-virtual {p0, p2, p1}, Ljo0;->j(Liq;Ljava/lang/Object;)Liq;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljo0;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ljo0;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :pswitch_0
    invoke-virtual {p0, p2, p1}, Ljo0;->j(Liq;Ljava/lang/Object;)Liq;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ljo0;

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Ljo0;->m(Ljava/lang/Object;)Ljava/lang/Object;

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
    iget p2, p0, Ljo0;->n:I

    .line 2
    .line 3
    iget-object p0, p0, Ljo0;->o:Lno0;

    .line 4
    .line 5
    packed-switch p2, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    new-instance p2, Ljo0;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-direct {p2, p0, p1, v0}, Ljo0;-><init>(Lno0;Liq;I)V

    .line 12
    .line 13
    .line 14
    return-object p2

    .line 15
    :pswitch_0
    new-instance p2, Ljo0;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-direct {p2, p0, p1, v0}, Ljo0;-><init>(Lno0;Liq;I)V

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
    .locals 2

    .line 1
    iget v0, p0, Ljo0;->n:I

    .line 2
    .line 3
    sget-object v1, Ld71;->b:Landroidx/datastore/core/NativeSharedCounter;

    .line 4
    .line 5
    iget-object p0, p0, Ljo0;->o:Lno0;

    .line 6
    .line 7
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    packed-switch v0, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lno0;->i:Lgb1;

    .line 14
    .line 15
    invoke-virtual {p0}, Lgb1;->getValue()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ld71;

    .line 20
    .line 21
    iget-wide p0, p0, Ld71;->a:J

    .line 22
    .line 23
    invoke-virtual {v1, p0, p1}, Landroidx/datastore/core/NativeSharedCounter;->nativeIncrementAndGetCounterValue(J)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    new-instance p1, Ljava/lang/Integer;

    .line 28
    .line 29
    invoke-direct {p1, p0}, Ljava/lang/Integer;-><init>(I)V

    .line 30
    .line 31
    .line 32
    return-object p1

    .line 33
    :pswitch_0
    iget-object p0, p0, Lno0;->i:Lgb1;

    .line 34
    .line 35
    invoke-virtual {p0}, Lgb1;->getValue()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Ld71;

    .line 40
    .line 41
    iget-wide p0, p0, Ld71;->a:J

    .line 42
    .line 43
    invoke-virtual {v1, p0, p1}, Landroidx/datastore/core/NativeSharedCounter;->nativeGetCounterValue(J)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    new-instance p1, Ljava/lang/Integer;

    .line 48
    .line 49
    invoke-direct {p1, p0}, Ljava/lang/Integer;-><init>(I)V

    .line 50
    .line 51
    .line 52
    return-object p1

    .line 53
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
