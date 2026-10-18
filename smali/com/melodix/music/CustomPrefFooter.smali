.class public final Lcom/melodix/music/CustomPrefFooter;
.super Landroidx/preference/Preference;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    .line 6
    .line 7
    const p1, 0x7f0c001f

    .line 8
    .line 9
    .line 10
    iput p1, p0, Landroidx/preference/Preference;->M:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final k(Lmu0;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroidx/preference/Preference;->k(Lmu0;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lmu0;->a:Landroid/view/View;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 8
    .line 9
    .line 10
    const v0, 0x7f0900dc

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lmu0;->b(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    new-instance v2, Lft;

    .line 20
    .line 21
    invoke-direct {v2, p0, v1}, Lft;-><init>(Lcom/melodix/music/CustomPrefFooter;I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    const v0, 0x7f0900dd

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v0}, Lmu0;->b(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    new-instance v0, Lft;

    .line 37
    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-direct {v0, p0, v1}, Lft;-><init>(Lcom/melodix/music/CustomPrefFooter;I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method
