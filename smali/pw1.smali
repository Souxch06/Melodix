.class public final Lpw1;
.super Lzw1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic n:I

.field public final synthetic o:Ljava/lang/String;

.field public final synthetic p:Ljava/lang/String;

.field public final synthetic q:Ldx1;

.field public final synthetic r:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ldx1;Ljava/lang/String;Ljava/lang/String;Lqv1;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lpw1;->n:I

    .line 3
    .line 4
    iput-object p2, p0, Lpw1;->o:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p3, p0, Lpw1;->p:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Lpw1;->r:Ljava/lang/Object;

    .line 9
    .line 10
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lpw1;->q:Ldx1;

    .line 14
    .line 15
    const/4 p2, 0x1

    .line 16
    invoke-direct {p0, p1, p2}, Lzw1;-><init>(Ldx1;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Ldx1;Lmw1;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lpw1;->n:I

    .line 20
    iput-object p2, p0, Lpw1;->r:Ljava/lang/Object;

    iput-object p3, p0, Lpw1;->o:Ljava/lang/String;

    iput-object p4, p0, Lpw1;->p:Ljava/lang/String;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lpw1;->q:Ldx1;

    .line 21
    invoke-direct {p0, p1, v0}, Lzw1;-><init>(Ldx1;Z)V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 7

    .line 1
    iget v0, p0, Lpw1;->n:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lpw1;->q:Ldx1;

    .line 7
    .line 8
    iget-object v1, v0, Ldx1;->f:Ltv1;

    .line 9
    .line 10
    invoke-static {v1}, Lbh;->h(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lpw1;->r:Ljava/lang/Object;

    .line 14
    .line 15
    move-object v2, v0

    .line 16
    check-cast v2, Lmw1;

    .line 17
    .line 18
    iget-object v3, p0, Lpw1;->o:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v4, p0, Lpw1;->p:Ljava/lang/String;

    .line 21
    .line 22
    iget-wide v5, p0, Lzw1;->j:J

    .line 23
    .line 24
    invoke-interface/range {v1 .. v6}, Ltv1;->setCurrentScreenByScionActivityInfo(Lmw1;Ljava/lang/String;Ljava/lang/String;J)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :pswitch_0
    iget-object v0, p0, Lpw1;->q:Ldx1;

    .line 29
    .line 30
    iget-object v0, v0, Ldx1;->f:Ltv1;

    .line 31
    .line 32
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lpw1;->o:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v2, p0, Lpw1;->p:Ljava/lang/String;

    .line 38
    .line 39
    iget-object p0, p0, Lpw1;->r:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast p0, Lqv1;

    .line 42
    .line 43
    invoke-interface {v0, v1, v2, p0}, Ltv1;->getConditionalUserProperties(Ljava/lang/String;Ljava/lang/String;Lvv1;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public b()V
    .locals 1

    .line 1
    iget v0, p0, Lpw1;->n:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :pswitch_0
    iget-object p0, p0, Lpw1;->r:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Lqv1;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lqv1;->l(Landroid/os/Bundle;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    nop

    .line 17
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
