.class public final Lcom/melodix/music/ExpandablePreferenceCategory;
.super Landroidx/preference/PreferenceCategory;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public d0:Z

.field public e0:Ll21;

.field public f0:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 24
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/melodix/music/ExpandablePreferenceCategory;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILdv;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2}, Landroidx/preference/PreferenceCategory;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    .line 6
    .line 7
    const p1, 0x7f0c007e

    .line 8
    .line 9
    .line 10
    iput p1, p0, Landroidx/preference/Preference;->M:I

    .line 11
    .line 12
    iget-boolean p1, p0, Landroidx/preference/Preference;->y:Z

    .line 13
    .line 14
    const/4 p2, 0x1

    .line 15
    if-eq p1, p2, :cond_0

    .line 16
    .line 17
    iput-boolean p2, p0, Landroidx/preference/Preference;->y:Z

    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/preference/Preference;->g()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILdv;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 23
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/melodix/music/ExpandablePreferenceCategory;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final B(Z)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/melodix/music/ExpandablePreferenceCategory;->d0:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_4

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/melodix/music/ExpandablePreferenceCategory;->d0:Z

    .line 6
    .line 7
    iget-object p1, p0, Lcom/melodix/music/ExpandablePreferenceCategory;->f0:Landroid/widget/ImageView;

    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/melodix/music/ExpandablePreferenceCategory;->d0:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/high16 v0, 0x43340000    # 180.0f

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->rotation(F)Landroid/view/ViewPropertyAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    const-wide/16 v0, 0xc8

    .line 32
    .line 33
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object p1, p0, Landroidx/preference/PreferenceGroup;->X:Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    const/4 v0, 0x0

    .line 49
    :goto_1
    if-ge v0, p1, :cond_3

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceGroup;->A(I)Landroidx/preference/Preference;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    iget-boolean v2, p0, Lcom/melodix/music/ExpandablePreferenceCategory;->d0:Z

    .line 59
    .line 60
    iget-boolean v3, v1, Landroidx/preference/Preference;->E:Z

    .line 61
    .line 62
    if-eq v3, v2, :cond_2

    .line 63
    .line 64
    iput-boolean v2, v1, Landroidx/preference/Preference;->E:Z

    .line 65
    .line 66
    iget-object v1, v1, Landroidx/preference/Preference;->O:Lhu0;

    .line 67
    .line 68
    if-eqz v1, :cond_2

    .line 69
    .line 70
    iget-object v2, v1, Lhu0;->g:Landroid/os/Handler;

    .line 71
    .line 72
    iget-object v1, v1, Lhu0;->h:Lfu0;

    .line 73
    .line 74
    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 78
    .line 79
    .line 80
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_3
    iget-object p1, p0, Lcom/melodix/music/ExpandablePreferenceCategory;->e0:Ll21;

    .line 84
    .line 85
    if-eqz p1, :cond_4

    .line 86
    .line 87
    iget-boolean v0, p0, Lcom/melodix/music/ExpandablePreferenceCategory;->d0:Z

    .line 88
    .line 89
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p1, p0, v0}, Ll21;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    :cond_4
    return-void
.end method

.method public final i()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroidx/preference/PreferenceGroup;->i()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/preference/PreferenceGroup;->X:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Landroidx/preference/PreferenceGroup;->A(I)Landroidx/preference/Preference;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    iget-boolean v3, p0, Lcom/melodix/music/ExpandablePreferenceCategory;->d0:Z

    .line 21
    .line 22
    iget-boolean v4, v2, Landroidx/preference/Preference;->E:Z

    .line 23
    .line 24
    if-eq v4, v3, :cond_0

    .line 25
    .line 26
    iput-boolean v3, v2, Landroidx/preference/Preference;->E:Z

    .line 27
    .line 28
    iget-object v2, v2, Landroidx/preference/Preference;->O:Lhu0;

    .line 29
    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    iget-object v3, v2, Lhu0;->g:Landroid/os/Handler;

    .line 33
    .line 34
    iget-object v2, v2, Lhu0;->h:Lfu0;

    .line 35
    .line 36
    invoke-virtual {v3, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 40
    .line 41
    .line 42
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    return-void
.end method

.method public final k(Lmu0;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lmu0;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-super {p0, p1}, Landroidx/preference/PreferenceCategory;->k(Lmu0;)V

    .line 4
    .line 5
    .line 6
    const v1, 0x7f0900cc

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1, v1}, Lmu0;->b(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    instance-of v2, v1, Landroid/widget/ImageView;

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    check-cast v1, Landroid/widget/ImageView;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    iput-object v1, p0, Lcom/melodix/music/ExpandablePreferenceCategory;->f0:Landroid/widget/ImageView;

    .line 22
    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    iget-boolean v2, p0, Lcom/melodix/music/ExpandablePreferenceCategory;->d0:Z

    .line 26
    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    const/high16 v2, 0x43340000    # 180.0f

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    const/4 v2, 0x0

    .line 33
    :goto_1
    invoke-virtual {v1, v2}, Landroid/view/View;->setRotation(F)V

    .line 34
    .line 35
    .line 36
    :cond_2
    const/4 v1, 0x1

    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 38
    .line 39
    .line 40
    new-instance v2, La20;

    .line 41
    .line 42
    const/4 v3, 0x0

    .line 43
    invoke-direct {v2, p0, v3}, La20;-><init>(Lcom/melodix/music/ExpandablePreferenceCategory;I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    const v0, 0x7f090079

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v0}, Lmu0;->b(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    if-eqz p1, :cond_3

    .line 57
    .line 58
    new-instance v0, La20;

    .line 59
    .line 60
    invoke-direct {v0, p0, v1}, La20;-><init>(Lcom/melodix/music/ExpandablePreferenceCategory;I)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 64
    .line 65
    .line 66
    :cond_3
    return-void
.end method

.method public final l()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/melodix/music/ExpandablePreferenceCategory;->d0:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/melodix/music/ExpandablePreferenceCategory;->B(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final y(Landroidx/preference/Preference;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroidx/preference/PreferenceGroup;->y(Landroidx/preference/Preference;)V

    .line 5
    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/melodix/music/ExpandablePreferenceCategory;->d0:Z

    .line 8
    .line 9
    iget-boolean v0, p1, Landroidx/preference/Preference;->E:Z

    .line 10
    .line 11
    if-eq v0, p0, :cond_0

    .line 12
    .line 13
    iput-boolean p0, p1, Landroidx/preference/Preference;->E:Z

    .line 14
    .line 15
    iget-object p0, p1, Landroidx/preference/Preference;->O:Lhu0;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lhu0;->g:Landroid/os/Handler;

    .line 20
    .line 21
    iget-object p0, p0, Lhu0;->h:Lfu0;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method
