.class public final Lrw1;
.super Lzw1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic n:I

.field public final synthetic o:Ljava/lang/String;

.field public final synthetic p:Ldx1;


# direct methods
.method public constructor <init>(Ldx1;Ljava/lang/String;I)V
    .locals 1

    .line 1
    iput p3, p0, Lrw1;->n:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    packed-switch p3, :pswitch_data_0

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, Lrw1;->o:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lrw1;->p:Ldx1;

    .line 13
    .line 14
    invoke-direct {p0, p1, v0}, Lzw1;-><init>(Ldx1;Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :pswitch_0
    iput-object p2, p0, Lrw1;->o:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lrw1;->p:Ldx1;

    .line 24
    .line 25
    invoke-direct {p0, p1, v0}, Lzw1;-><init>(Ldx1;Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final a()V
    .locals 4

    .line 1
    iget v0, p0, Lrw1;->n:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lrw1;->p:Ldx1;

    .line 7
    .line 8
    iget-object v0, v0, Ldx1;->f:Ltv1;

    .line 9
    .line 10
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lrw1;->o:Ljava/lang/String;

    .line 14
    .line 15
    iget-wide v2, p0, Lzw1;->k:J

    .line 16
    .line 17
    invoke-interface {v0, v1, v2, v3}, Ltv1;->endAdUnitExposure(Ljava/lang/String;J)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :pswitch_0
    iget-object v0, p0, Lrw1;->p:Ldx1;

    .line 22
    .line 23
    iget-object v0, v0, Ldx1;->f:Ltv1;

    .line 24
    .line 25
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lrw1;->o:Ljava/lang/String;

    .line 29
    .line 30
    iget-wide v2, p0, Lzw1;->k:J

    .line 31
    .line 32
    invoke-interface {v0, v1, v2, v3}, Ltv1;->beginAdUnitExposure(Ljava/lang/String;J)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    nop

    .line 37
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
