.class public final Lt62;
.super Lfu1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Li82;


# direct methods
.method public synthetic constructor <init>(Li82;Lo22;I)V
    .locals 0

    .line 1
    iput p3, p0, Lt62;->e:I

    .line 2
    .line 3
    iput-object p1, p0, Lt62;->f:Li82;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Lfu1;-><init>(Lo22;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    iget v0, p0, Lt62;->e:I

    .line 2
    .line 3
    iget-object p0, p0, Lt62;->f:Li82;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p0, Ly02;

    .line 11
    .line 12
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 13
    .line 14
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lzy1;->r:Lso;

    .line 18
    .line 19
    const-string v0, "Tasks have been queued for a long time"

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lso;->b(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :pswitch_0
    invoke-virtual {p0}, Lgx1;->l()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Li82;->C()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v0, Ly02;

    .line 38
    .line 39
    iget-object v0, v0, Ly02;->o:Lzy1;

    .line 40
    .line 41
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, v0, Lzy1;->w:Lso;

    .line 45
    .line 46
    const-string v1, "Inactivity, disconnecting from the service"

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Li82;->t()V

    .line 52
    .line 53
    .line 54
    :goto_0
    return-void

    .line 55
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
