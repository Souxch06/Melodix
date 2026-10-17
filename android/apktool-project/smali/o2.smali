.class public final Lo2;
.super La70;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic s:I

.field public final synthetic t:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroidx/appcompat/view/menu/ActionMenuItemView;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lo2;->s:I

    .line 3
    .line 4
    iput-object p1, p0, Lo2;->t:Landroid/view/View;

    .line 5
    .line 6
    invoke-direct {p0, p1}, La70;-><init>(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lt2;Lt2;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lo2;->s:I

    .line 10
    iput-object p1, p0, Lo2;->t:Landroid/view/View;

    invoke-direct {p0, p2}, La70;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b()Lr71;
    .locals 2

    .line 1
    iget v0, p0, Lo2;->s:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object p0, p0, Lo2;->t:Landroid/view/View;

    .line 5
    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    check-cast p0, Lt2;

    .line 10
    .line 11
    iget-object p0, p0, Lt2;->m:Lu2;

    .line 12
    .line 13
    iget-object p0, p0, Lu2;->B:Lq2;

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcn0;->a()Lan0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    :goto_0
    return-object v1

    .line 23
    :pswitch_0
    check-cast p0, Landroidx/appcompat/view/menu/ActionMenuItemView;

    .line 24
    .line 25
    iget-object p0, p0, Landroidx/appcompat/view/menu/ActionMenuItemView;->v:Lp2;

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    check-cast p0, Lr2;

    .line 30
    .line 31
    iget-object p0, p0, Lr2;->a:Lu2;

    .line 32
    .line 33
    iget-object p0, p0, Lu2;->C:Lq2;

    .line 34
    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcn0;->a()Lan0;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    :cond_1
    return-object v1

    .line 42
    nop

    .line 43
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final c()Z
    .locals 3

    .line 1
    iget v0, p0, Lo2;->s:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iget-object v2, p0, Lo2;->t:Landroid/view/View;

    .line 5
    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    check-cast v2, Lt2;

    .line 10
    .line 11
    iget-object p0, v2, Lt2;->m:Lu2;

    .line 12
    .line 13
    invoke-virtual {p0}, Lu2;->l()Z

    .line 14
    .line 15
    .line 16
    return v1

    .line 17
    :pswitch_0
    check-cast v2, Landroidx/appcompat/view/menu/ActionMenuItemView;

    .line 18
    .line 19
    iget-object v0, v2, Landroidx/appcompat/view/menu/ActionMenuItemView;->t:Lqm0;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v2, v2, Landroidx/appcompat/view/menu/ActionMenuItemView;->q:Lvm0;

    .line 24
    .line 25
    invoke-interface {v0, v2}, Lqm0;->a(Lvm0;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Lo2;->b()Lr71;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    invoke-interface {p0}, Lr71;->a()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/4 v1, 0x0

    .line 45
    :goto_0
    return v1

    .line 46
    nop

    .line 47
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public d()Z
    .locals 1

    .line 1
    iget v0, p0, Lo2;->s:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, La70;->d()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0

    .line 11
    :pswitch_0
    iget-object p0, p0, Lo2;->t:Landroid/view/View;

    .line 12
    .line 13
    check-cast p0, Lt2;

    .line 14
    .line 15
    iget-object p0, p0, Lt2;->m:Lu2;

    .line 16
    .line 17
    iget-object v0, p0, Lu2;->D:Ls2;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0}, Lu2;->c()Z

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    :goto_0
    return p0

    .line 28
    nop

    .line 29
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
