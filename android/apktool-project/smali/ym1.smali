.class public final synthetic Lym1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lfv1;


# direct methods
.method public synthetic constructor <init>(Lfv1;I)V
    .locals 0

    .line 1
    iput p2, p0, Lym1;->a:I

    .line 2
    .line 3
    iput-object p1, p0, Lym1;->b:Lfv1;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Lym1;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Lym1;->b:Lfv1;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    new-instance v0, Li32;

    .line 9
    .line 10
    iget-object p0, p0, Lfv1;->d:Lka2;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Li32;-><init>(Lka2;)V

    .line 13
    .line 14
    .line 15
    return-object v0

    .line 16
    :pswitch_0
    new-instance v0, Li32;

    .line 17
    .line 18
    iget-object p0, p0, Lfv1;->c:Lc9;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Li32;-><init>(Lc9;)V

    .line 21
    .line 22
    .line 23
    return-object v0

    .line 24
    nop

    .line 25
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
