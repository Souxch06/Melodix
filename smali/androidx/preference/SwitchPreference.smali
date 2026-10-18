.class public Landroidx/preference/SwitchPreference;
.super Landroidx/preference/TwoStatePreference;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a0:Lzj;

.field public final b0:Ljava/lang/String;

.field public final c0:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4

    .line 1
    const v0, 0x7f04040b

    .line 2
    .line 3
    .line 4
    const v1, 0x101036d

    .line 5
    .line 6
    .line 7
    invoke-static {p1, v0, v1}, Les0;->d(Landroid/content/Context;II)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-direct {p0, p1, p2, v0}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Lzj;

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-direct {v1, p0, v2}, Lzj;-><init>(Landroidx/preference/TwoStatePreference;I)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Landroidx/preference/SwitchPreference;->a0:Lzj;

    .line 21
    .line 22
    sget-object v1, Ldx0;->l:[I

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    invoke-virtual {p1, p2, v1, v0, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 p2, 0x7

    .line 30
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    if-nez p2, :cond_0

    .line 35
    .line 36
    invoke-virtual {p1, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    :cond_0
    iput-object p2, p0, Landroidx/preference/TwoStatePreference;->W:Ljava/lang/CharSequence;

    .line 41
    .line 42
    iget-boolean p2, p0, Landroidx/preference/TwoStatePreference;->V:Z

    .line 43
    .line 44
    if-eqz p2, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Landroidx/preference/Preference;->g()V

    .line 47
    .line 48
    .line 49
    :cond_1
    const/4 p2, 0x6

    .line 50
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    if-nez p2, :cond_2

    .line 55
    .line 56
    invoke-virtual {p1, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    :cond_2
    iput-object p2, p0, Landroidx/preference/TwoStatePreference;->X:Ljava/lang/CharSequence;

    .line 61
    .line 62
    iget-boolean p2, p0, Landroidx/preference/TwoStatePreference;->V:Z

    .line 63
    .line 64
    if-nez p2, :cond_3

    .line 65
    .line 66
    invoke-virtual {p0}, Landroidx/preference/Preference;->g()V

    .line 67
    .line 68
    .line 69
    :cond_3
    const/16 p2, 0x9

    .line 70
    .line 71
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    if-nez p2, :cond_4

    .line 76
    .line 77
    const/4 p2, 0x3

    .line 78
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    :cond_4
    iput-object p2, p0, Landroidx/preference/SwitchPreference;->b0:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p0}, Landroidx/preference/Preference;->g()V

    .line 85
    .line 86
    .line 87
    const/16 p2, 0x8

    .line 88
    .line 89
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    if-nez p2, :cond_5

    .line 94
    .line 95
    const/4 p2, 0x4

    .line 96
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    :cond_5
    iput-object p2, p0, Landroidx/preference/SwitchPreference;->c0:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {p0}, Landroidx/preference/Preference;->g()V

    .line 103
    .line 104
    .line 105
    const/4 p2, 0x2

    .line 106
    invoke-virtual {p1, p2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 107
    .line 108
    .line 109
    move-result p2

    .line 110
    const/4 v0, 0x5

    .line 111
    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 112
    .line 113
    .line 114
    move-result p2

    .line 115
    iput-boolean p2, p0, Landroidx/preference/TwoStatePreference;->Z:Z

    .line 116
    .line 117
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 118
    .line 119
    .line 120
    return-void
.end method


# virtual methods
.method public final A(Landroid/view/View;)V
    .locals 3

    .line 1
    instance-of v0, p1, Landroid/widget/Switch;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v1, p1

    .line 6
    check-cast v1, Landroid/widget/Switch;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {v1, v2}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    instance-of v1, p1, Landroid/widget/Checkable;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    move-object v1, p1

    .line 17
    check-cast v1, Landroid/widget/Checkable;

    .line 18
    .line 19
    iget-boolean v2, p0, Landroidx/preference/TwoStatePreference;->V:Z

    .line 20
    .line 21
    invoke-interface {v1, v2}, Landroid/widget/Checkable;->setChecked(Z)V

    .line 22
    .line 23
    .line 24
    :cond_1
    if-eqz v0, :cond_2

    .line 25
    .line 26
    check-cast p1, Landroid/widget/Switch;

    .line 27
    .line 28
    iget-object v0, p0, Landroidx/preference/SwitchPreference;->b0:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setTextOn(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Landroidx/preference/SwitchPreference;->c0:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setTextOff(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Landroidx/preference/SwitchPreference;->a0:Lzj;

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    return-void
.end method

.method public final k(Lmu0;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/preference/Preference;->k(Lmu0;)V

    .line 2
    .line 3
    .line 4
    const v0, 0x1020040

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lmu0;->b(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Landroidx/preference/SwitchPreference;->A(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    const v0, 0x1020010

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lmu0;->b(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Landroidx/preference/TwoStatePreference;->z(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final r(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroidx/preference/Preference;->r(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/preference/Preference;->j:Landroid/content/Context;

    .line 5
    .line 6
    const-string v1, "accessibility"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const v0, 0x1020040

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Landroidx/preference/SwitchPreference;->A(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    const v0, 0x1020010

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Landroidx/preference/TwoStatePreference;->z(Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
