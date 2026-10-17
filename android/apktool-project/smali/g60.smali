.class public final Lg60;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ls50;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lhz0;


# direct methods
.method public synthetic constructor <init>(Lhz0;I)V
    .locals 0

    .line 1
    iput p2, p0, Lg60;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lg60;->k:Lhz0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final h(Ljava/lang/Object;Liq;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget p2, p0, Lg60;->j:I

    .line 2
    .line 3
    iget-object v0, p0, Lg60;->k:Lhz0;

    .line 4
    .line 5
    packed-switch p2, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    iput-object p1, v0, Lhz0;->j:Ljava/lang/Object;

    .line 9
    .line 10
    new-instance p1, Lc;

    .line 11
    .line 12
    invoke-direct {p1, p0}, Lc;-><init>(Ls50;)V

    .line 13
    .line 14
    .line 15
    throw p1

    .line 16
    :pswitch_0
    iput-object p1, v0, Lhz0;->j:Ljava/lang/Object;

    .line 17
    .line 18
    new-instance p1, Lc;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Lc;-><init>(Ls50;)V

    .line 21
    .line 22
    .line 23
    throw p1

    .line 24
    nop

    .line 25
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
