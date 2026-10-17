.class public final synthetic Lf61;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic j:Ljava/util/ArrayList;

.field public final synthetic k:Landroid/widget/EditText;

.field public final synthetic l:Landroid/widget/LinearLayout;

.field public final synthetic m:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Landroid/widget/EditText;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lf61;->j:Ljava/util/ArrayList;

    .line 5
    .line 6
    iput-object p2, p0, Lf61;->k:Landroid/widget/EditText;

    .line 7
    .line 8
    iput-object p3, p0, Lf61;->l:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    iput-object p4, p0, Lf61;->m:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lf61;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    iget-object v2, p0, Lf61;->k:Landroid/widget/EditText;

    .line 9
    .line 10
    if-le v0, v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lf61;->l:Landroid/widget/LinearLayout;

    .line 16
    .line 17
    iget-object p0, p0, Lf61;->m:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string p0, ""

    .line 24
    .line 25
    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
