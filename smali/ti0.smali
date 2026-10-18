.class public final synthetic Lti0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lcom/melodix/music/LinkHandler;

.field public final synthetic l:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/melodix/music/LinkHandler;Ljava/lang/String;I)V
    .locals 0

    .line 1
    iput p3, p0, Lti0;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lti0;->k:Lcom/melodix/music/LinkHandler;

    .line 4
    .line 5
    iput-object p2, p0, Lti0;->l:Ljava/lang/String;

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
    iget v0, p0, Lti0;->j:I

    .line 2
    .line 3
    iget-object v1, p0, Lti0;->l:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lti0;->k:Lcom/melodix/music/LinkHandler;

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    sget v0, Lcom/melodix/music/LinkHandler;->H:I

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Lcom/melodix/music/LinkHandler;->u(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :pswitch_0
    sget v0, Lcom/melodix/music/LinkHandler;->H:I

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Lcom/melodix/music/LinkHandler;->u(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    nop

    .line 23
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
