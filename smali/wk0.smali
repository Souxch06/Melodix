.class public final synthetic Lwk0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lp80;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lcom/melodix/music/MainActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/melodix/music/MainActivity;I)V
    .locals 0

    .line 1
    iput p2, p0, Lwk0;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lwk0;->k:Lcom/melodix/music/MainActivity;

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
    .locals 3

    .line 1
    iget v0, p0, Lwk0;->j:I

    .line 2
    .line 3
    sget-object v1, Lwe1;->a:Lwe1;

    .line 4
    .line 5
    iget-object p0, p0, Lwk0;->k:Lcom/melodix/music/MainActivity;

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    sget v0, Lcom/melodix/music/MainActivity;->h0:I

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->A()V

    .line 13
    .line 14
    .line 15
    return-object v1

    .line 16
    :pswitch_0
    sget v0, Lcom/melodix/music/MainActivity;->h0:I

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->A()V

    .line 19
    .line 20
    .line 21
    return-object v1

    .line 22
    :pswitch_1
    sget v0, Lcom/melodix/music/MainActivity;->h0:I

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->A()V

    .line 25
    .line 26
    .line 27
    return-object v1

    .line 28
    :pswitch_2
    sget v0, Lcom/melodix/music/MainActivity;->h0:I

    .line 29
    .line 30
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->m:Z

    .line 31
    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    new-instance v0, Lwk0;

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-direct {v0, p0, v2}, Lwk0;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->w(Lp80;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    new-instance v0, Ls4;

    .line 45
    .line 46
    const/4 v2, 0x5

    .line 47
    invoke-direct {v0, p0, v2}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    return-object v1

    .line 54
    nop

    .line 55
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
