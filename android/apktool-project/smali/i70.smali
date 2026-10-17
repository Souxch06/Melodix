.class public final synthetic Li70;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lsp;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Le6;


# direct methods
.method public synthetic constructor <init>(Le6;I)V
    .locals 0

    .line 1
    iput p2, p0, Li70;->a:I

    .line 2
    .line 3
    iput-object p1, p0, Li70;->b:Le6;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget v0, p0, Li70;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Li70;->b:Le6;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p1, Landroid/content/Intent;

    .line 9
    .line 10
    iget-object p0, p0, Le6;->A:Lbv1;

    .line 11
    .line 12
    invoke-virtual {p0}, Lbv1;->p()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :pswitch_0
    check-cast p1, Landroid/content/res/Configuration;

    .line 17
    .line 18
    iget-object p0, p0, Le6;->A:Lbv1;

    .line 19
    .line 20
    invoke-virtual {p0}, Lbv1;->p()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    nop

    .line 25
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
