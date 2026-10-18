.class public final Lm70;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# instance fields
.field public final synthetic j:Landroidx/fragment/app/a;

.field public final synthetic k:Ln70;


# direct methods
.method public constructor <init>(Ln70;Landroidx/fragment/app/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lm70;->k:Ln70;

    .line 5
    .line 6
    iput-object p2, p0, Lm70;->j:Landroidx/fragment/app/a;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onViewAttachedToWindow(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lm70;->j:Landroidx/fragment/app/a;

    .line 2
    .line 3
    iget-object v0, p1, Landroidx/fragment/app/a;->c:Lh70;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroidx/fragment/app/a;->k()V

    .line 6
    .line 7
    .line 8
    iget-object p1, v0, Lh70;->N:Landroid/view/View;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Landroid/view/ViewGroup;

    .line 15
    .line 16
    iget-object p0, p0, Lm70;->k:Ln70;

    .line 17
    .line 18
    iget-object p0, p0, Ln70;->j:Lz70;

    .line 19
    .line 20
    invoke-virtual {p0}, Lz70;->E()Lt11;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p1, p0}, Lhw;->f(Landroid/view/ViewGroup;Lt11;)Lhw;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lhw;->e()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method
