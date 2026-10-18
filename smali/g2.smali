.class public final Lg2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lg2;->j:I

    .line 2
    .line 3
    iput-object p2, p0, Lg2;->k:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget v0, p0, Lg2;->j:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object p0, p0, Lg2;->k:Ljava/lang/Object;

    .line 5
    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    check-cast p0, Landroidx/appcompat/widget/Toolbar;

    .line 10
    .line 11
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->U:Lwc1;

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v1, p0, Lwc1;->k:Lvm0;

    .line 17
    .line 18
    :goto_0
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lvm0;->collapseActionView()Z

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void

    .line 24
    :pswitch_0
    check-cast p0, Landroidx/preference/Preference;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->r(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :pswitch_1
    check-cast p0, Le4;

    .line 31
    .line 32
    iget-object v0, p0, Le4;->i:Landroid/widget/Button;

    .line 33
    .line 34
    if-ne p1, v0, :cond_2

    .line 35
    .line 36
    iget-object v0, p0, Le4;->k:Landroid/os/Message;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-static {v0}, Landroid/os/Message;->obtain(Landroid/os/Message;)Landroid/os/Message;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    goto :goto_1

    .line 45
    :cond_2
    iget-object v0, p0, Le4;->l:Landroid/widget/Button;

    .line 46
    .line 47
    if-ne p1, v0, :cond_3

    .line 48
    .line 49
    iget-object v0, p0, Le4;->n:Landroid/os/Message;

    .line 50
    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    invoke-static {v0}, Landroid/os/Message;->obtain(Landroid/os/Message;)Landroid/os/Message;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    goto :goto_1

    .line 58
    :cond_3
    iget-object v0, p0, Le4;->o:Landroid/widget/Button;

    .line 59
    .line 60
    if-ne p1, v0, :cond_4

    .line 61
    .line 62
    iget-object p1, p0, Le4;->q:Landroid/os/Message;

    .line 63
    .line 64
    if-eqz p1, :cond_4

    .line 65
    .line 66
    invoke-static {p1}, Landroid/os/Message;->obtain(Landroid/os/Message;)Landroid/os/Message;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    :cond_4
    :goto_1
    if-eqz v1, :cond_5

    .line 71
    .line 72
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 73
    .line 74
    .line 75
    :cond_5
    iget-object p1, p0, Le4;->F:Lc4;

    .line 76
    .line 77
    const/4 v0, 0x1

    .line 78
    iget-object p0, p0, Le4;->b:Lg4;

    .line 79
    .line 80
    invoke-virtual {p1, v0, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :pswitch_2
    check-cast p0, Ly2;

    .line 89
    .line 90
    invoke-virtual {p0}, Ly2;->a()V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    nop

    .line 95
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
