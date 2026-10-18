.class public final Lx12;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lbc2;

.field public final synthetic c:Landroid/os/Bundle;

.field public final synthetic d:Lk22;


# direct methods
.method public synthetic constructor <init>(Lk22;Lbc2;Landroid/os/Bundle;I)V
    .locals 0

    .line 1
    iput p4, p0, Lx12;->a:I

    .line 2
    .line 3
    iput-object p2, p0, Lx12;->b:Lbc2;

    .line 4
    .line 5
    iput-object p3, p0, Lx12;->c:Landroid/os/Bundle;

    .line 6
    .line 7
    iput-object p1, p0, Lx12;->d:Lk22;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final synthetic call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget v0, p0, Lx12;->a:I

    .line 2
    .line 3
    iget-object v1, p0, Lx12;->c:Landroid/os/Bundle;

    .line 4
    .line 5
    iget-object v2, p0, Lx12;->b:Lbc2;

    .line 6
    .line 7
    iget-object p0, p0, Lx12;->d:Lk22;

    .line 8
    .line 9
    packed-switch v0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lk22;->b:Lsa2;

    .line 13
    .line 14
    invoke-virtual {p0}, Lsa2;->V()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v1, v2}, Lsa2;->d0(Landroid/os/Bundle;Lbc2;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :pswitch_0
    iget-object p0, p0, Lk22;->b:Lsa2;

    .line 23
    .line 24
    invoke-virtual {p0}, Lsa2;->V()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v1, v2}, Lsa2;->d0(Landroid/os/Bundle;Lbc2;)Ljava/util/List;

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
