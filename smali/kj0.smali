.class public final Lkj0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Llj0;


# direct methods
.method public constructor <init>(Llj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lkj0;->j:Llj0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object p0, p0, Lkj0;->j:Llj0;

    .line 2
    .line 3
    iget-object v0, p0, Llj0;->l:Lzy;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Llj0;->l:Lzy;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/widget/AdapterView;->getCount()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Llj0;->l:Lzy;

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-le v0, v1, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Llj0;->l:Lzy;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iget v1, p0, Llj0;->v:I

    .line 34
    .line 35
    if-gt v0, v1, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Llj0;->I:Lr7;

    .line 38
    .line 39
    const/4 v1, 0x2

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Llj0;->c()V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method
