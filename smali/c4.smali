.class public final Lc4;
.super Landroid/os/Handler;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic a:I

.field public b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .locals 1

    .line 10
    const/4 v0, 0x0

    iput v0, p0, Lc4;->a:I

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcu0;Landroid/os/Looper;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Lc4;->a:I

    .line 3
    .line 4
    iput-object p1, p0, Lc4;->b:Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 1
    iget v0, p0, Lc4;->a:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    packed-switch v0, :pswitch_data_0

    .line 5
    .line 6
    .line 7
    iget p1, p1, Landroid/os/Message;->what:I

    .line 8
    .line 9
    if-eq p1, v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lc4;->b:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p0, Lcu0;

    .line 15
    .line 16
    iget-object p1, p0, Lcu0;->e0:Lju0;

    .line 17
    .line 18
    iget-object p1, p1, Lju0;->g:Landroidx/preference/PreferenceScreen;

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcu0;->f0:Landroidx/recyclerview/widget/RecyclerView;

    .line 23
    .line 24
    new-instance v0, Lhu0;

    .line 25
    .line 26
    invoke-direct {v0, p1}, Lhu0;-><init>(Landroidx/preference/PreferenceGroup;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Lhy0;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Landroidx/preference/PreferenceGroup;->i()V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void

    .line 36
    :pswitch_0
    iget v0, p1, Landroid/os/Message;->what:I

    .line 37
    .line 38
    const/4 v2, -0x3

    .line 39
    if-eq v0, v2, :cond_3

    .line 40
    .line 41
    const/4 v2, -0x2

    .line 42
    if-eq v0, v2, :cond_3

    .line 43
    .line 44
    const/4 v2, -0x1

    .line 45
    if-eq v0, v2, :cond_3

    .line 46
    .line 47
    if-eq v0, v1, :cond_2

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast p0, Landroid/content/DialogInterface;

    .line 53
    .line 54
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast v0, Landroid/content/DialogInterface$OnClickListener;

    .line 61
    .line 62
    iget-object p0, p0, Lc4;->b:Ljava/lang/Object;

    .line 63
    .line 64
    check-cast p0, Ljava/lang/ref/WeakReference;

    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    check-cast p0, Landroid/content/DialogInterface;

    .line 71
    .line 72
    iget p1, p1, Landroid/os/Message;->what:I

    .line 73
    .line 74
    invoke-interface {v0, p0, p1}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    .line 75
    .line 76
    .line 77
    :goto_1
    return-void

    .line 78
    nop

    .line 79
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
