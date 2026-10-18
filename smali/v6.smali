.class public final Lv6;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lg7;


# direct methods
.method public constructor <init>(Lg7;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv6;->j:Lg7;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lv6;->j:Lg7;

    .line 2
    .line 3
    iget-object v1, v0, Lg7;->E:Landroid/widget/PopupWindow;

    .line 4
    .line 5
    iget-object v2, v0, Lg7;->D:Landroidx/appcompat/widget/ActionBarContextView;

    .line 6
    .line 7
    const/16 v3, 0x37

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-virtual {v1, v2, v3, v4, v4}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 11
    .line 12
    .line 13
    iget-object v1, v0, Lg7;->G:Lmi1;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1}, Lmi1;->b()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-boolean v1, v0, Lg7;->I:Z

    .line 21
    .line 22
    const/high16 v2, 0x3f800000    # 1.0f

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iget-object v1, v0, Lg7;->J:Landroid/view/ViewGroup;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/view/View;->isLaidOut()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    iget-object v1, v0, Lg7;->D:Landroidx/appcompat/widget/ActionBarContextView;

    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    invoke-virtual {v1, v3}, Landroid/view/View;->setAlpha(F)V

    .line 40
    .line 41
    .line 42
    iget-object v1, v0, Lg7;->D:Landroidx/appcompat/widget/ActionBarContextView;

    .line 43
    .line 44
    invoke-static {v1}, Lzh1;->a(Landroid/view/View;)Lmi1;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1, v2}, Lmi1;->a(F)V

    .line 49
    .line 50
    .line 51
    iput-object v1, v0, Lg7;->G:Lmi1;

    .line 52
    .line 53
    new-instance v0, Lu6;

    .line 54
    .line 55
    invoke-direct {v0, v4, p0}, Lu6;-><init>(ILjava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v0}, Lmi1;->d(Loi1;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    iget-object p0, v0, Lg7;->D:Landroidx/appcompat/widget/ActionBarContextView;

    .line 63
    .line 64
    invoke-virtual {p0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 65
    .line 66
    .line 67
    iget-object p0, v0, Lg7;->D:Landroidx/appcompat/widget/ActionBarContextView;

    .line 68
    .line 69
    invoke-virtual {p0, v4}, Landroidx/appcompat/widget/ActionBarContextView;->setVisibility(I)V

    .line 70
    .line 71
    .line 72
    return-void
.end method
