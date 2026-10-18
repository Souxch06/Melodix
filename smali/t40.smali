.class public final Lt40;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lkw0;


# instance fields
.field public final synthetic j:I

.field public final k:Ler0;


# direct methods
.method public synthetic constructor <init>(Ler0;I)V
    .locals 0

    .line 1
    iput p2, p0, Lt40;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lt40;->k:Ler0;

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
    iget v0, p0, Lt40;->j:I

    .line 2
    .line 3
    iget-object p0, p0, Lt40;->k:Ler0;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ler0;->n:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p0, Llw0;

    .line 11
    .line 12
    invoke-static {p0}, Lbv;->e(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-object p0

    .line 16
    :pswitch_0
    iget-object p0, p0, Ler0;->l:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p0, Lh40;

    .line 19
    .line 20
    invoke-static {p0}, Lbv;->e(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-object p0

    .line 24
    nop

    .line 25
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
