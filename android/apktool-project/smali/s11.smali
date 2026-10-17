.class public final synthetic Ls11;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lur;

.field public final synthetic l:Lgf;


# direct methods
.method public synthetic constructor <init>(Lur;Lgf;I)V
    .locals 0

    .line 1
    iput p3, p0, Ls11;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Ls11;->k:Lur;

    .line 4
    .line 5
    iput-object p2, p0, Ls11;->l:Lgf;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget v0, p0, Ls11;->j:I

    .line 2
    .line 3
    iget-object v1, p0, Ls11;->l:Lgf;

    .line 4
    .line 5
    iget-object p0, p0, Ls11;->k:Lur;

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v1}, Lur;->a(Lgf;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    invoke-virtual {p0, v1}, Lur;->a(Lgf;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    nop

    .line 19
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
