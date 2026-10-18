.class public final Lhj0;
.super Landroid/database/DataSetObserver;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic a:Llj0;


# direct methods
.method public constructor <init>(Llj0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lhj0;->a:Llj0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onChanged()V
    .locals 1

    .line 1
    iget-object p0, p0, Lhj0;->a:Llj0;

    .line 2
    .line 3
    iget-object v0, p0, Llj0;->I:Lr7;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Llj0;->c()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final onInvalidated()V
    .locals 0

    .line 1
    iget-object p0, p0, Lhj0;->a:Llj0;

    .line 2
    .line 3
    invoke-virtual {p0}, Llj0;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
