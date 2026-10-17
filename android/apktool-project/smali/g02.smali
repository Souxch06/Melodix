.class public final synthetic Lg02;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lk02;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lg02;->a:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lg02;->b:Ljava/lang/Object;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lk22;Ltu1;Ljava/lang/String;)V
    .locals 0

    const/4 p2, 0x1

    iput p2, p0, Lg02;->a:I

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lg02;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Lg02;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Lg02;->b:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lk22;

    .line 9
    .line 10
    iget-object p0, p0, Lk22;->b:Lsa2;

    .line 11
    .line 12
    invoke-virtual {p0}, Lsa2;->V()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lsa2;->q:Lhz1;

    .line 16
    .line 17
    invoke-static {p0}, Lsa2;->T(Laa2;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Let;->l()V

    .line 21
    .line 22
    .line 23
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 24
    .line 25
    const-string v0, "Unexpected call on client side"

    .line 26
    .line 27
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw p0

    .line 31
    :pswitch_0
    check-cast p0, Lk02;

    .line 32
    .line 33
    new-instance v0, Li32;

    .line 34
    .line 35
    iget-object p0, p0, Lk02;->u:Lny0;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Li32;-><init>(Lny0;)V

    .line 38
    .line 39
    .line 40
    return-object v0

    .line 41
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
