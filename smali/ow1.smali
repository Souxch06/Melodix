.class public final Low1;
.super Lzw1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic n:I

.field public final synthetic o:Ljava/lang/String;

.field public final synthetic p:Ljava/lang/String;

.field public final synthetic q:Landroid/os/Bundle;

.field public final synthetic r:Ldx1;


# direct methods
.method public constructor <init>(Ldx1;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;I)V
    .locals 1

    .line 1
    iput p5, p0, Low1;->n:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    packed-switch p5, :pswitch_data_0

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, Low1;->o:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p3, p0, Low1;->p:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p4, p0, Low1;->q:Landroid/os/Bundle;

    .line 12
    .line 13
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Low1;->r:Ldx1;

    .line 17
    .line 18
    invoke-direct {p0, p1, v0}, Lzw1;-><init>(Ldx1;Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :pswitch_0
    iput-object p2, p0, Low1;->o:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p3, p0, Low1;->p:Ljava/lang/String;

    .line 25
    .line 26
    iput-object p4, p0, Low1;->q:Landroid/os/Bundle;

    .line 27
    .line 28
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Low1;->r:Ldx1;

    .line 32
    .line 33
    invoke-direct {p0, p1, v0}, Lzw1;-><init>(Ldx1;Z)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final a()V
    .locals 11

    .line 1
    iget v0, p0, Low1;->n:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-wide v7, p0, Lzw1;->j:J

    .line 7
    .line 8
    iget-wide v9, p0, Lzw1;->k:J

    .line 9
    .line 10
    iget-object v0, p0, Low1;->r:Ldx1;

    .line 11
    .line 12
    iget-object v1, v0, Ldx1;->f:Ltv1;

    .line 13
    .line 14
    invoke-static {v1}, Lbh;->h(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Low1;->o:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v3, p0, Low1;->p:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v4, p0, Low1;->q:Landroid/os/Bundle;

    .line 22
    .line 23
    const/4 v5, 0x1

    .line 24
    const/4 v6, 0x1

    .line 25
    invoke-interface/range {v1 .. v10}, Ltv1;->logEventWithElapsedTime(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;ZZJJ)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :pswitch_0
    iget-object v0, p0, Low1;->r:Ldx1;

    .line 30
    .line 31
    iget-object v0, v0, Ldx1;->f:Ltv1;

    .line 32
    .line 33
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Low1;->o:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v2, p0, Low1;->p:Ljava/lang/String;

    .line 39
    .line 40
    iget-object p0, p0, Low1;->q:Landroid/os/Bundle;

    .line 41
    .line 42
    invoke-interface {v0, v1, v2, p0}, Ltv1;->clearConditionalUserProperty(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    nop

    .line 47
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
