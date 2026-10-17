.class public final synthetic Lkt0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lp80;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Llt0;


# direct methods
.method public synthetic constructor <init>(Llt0;I)V
    .locals 0

    .line 1
    iput p2, p0, Lkt0;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lkt0;->k:Llt0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Lkt0;->j:I

    .line 2
    .line 3
    iget-object p0, p0, Lkt0;->k:Llt0;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Llt0;->j:Lkh0;

    .line 9
    .line 10
    invoke-interface {v0}, Lkh0;->getValue()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, [Li41;

    .line 15
    .line 16
    invoke-static {p0, v0}, Lxg;->k(Li41;[Li41;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :pswitch_0
    iget-object p0, p0, Llt0;->b:Lka0;

    .line 26
    .line 27
    invoke-interface {p0}, Lka0;->a()[Ldh0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    nop

    .line 33
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
