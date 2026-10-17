.class public final Lg10;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljw0;


# instance fields
.field public final synthetic j:I

.field public final k:Lbv1;


# direct methods
.method public synthetic constructor <init>(Lbv1;I)V
    .locals 0

    .line 1
    iput p2, p0, Lg10;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lg10;->k:Lbv1;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Lg10;->j:I

    .line 2
    .line 3
    iget-object p0, p0, Lg10;->k:Lbv1;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p0, Lu30;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    sget-object v0, La51;->a:La51;

    .line 16
    .line 17
    invoke-static {p0}, La51;->a(Lu30;)Lv9;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :pswitch_0
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p0, Llw0;

    .line 25
    .line 26
    new-instance v0, Lf10;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Lf10;-><init>(Llw0;)V

    .line 29
    .line 30
    .line 31
    return-object v0

    .line 32
    nop

    .line 33
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
