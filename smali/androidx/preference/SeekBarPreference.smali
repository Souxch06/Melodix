.class public Landroidx/preference/SeekBarPreference;
.super Landroidx/preference/Preference;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public V:I

.field public W:I

.field public X:I

.field public Y:I

.field public Z:Z

.field public a0:Landroid/widget/SeekBar;

.field public b0:Landroid/widget/TextView;

.field public final c0:Z

.field public final d0:Z

.field public final e0:Z

.field public final f0:Lm31;

.field public final g0:Ln31;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4

    .line 1
    const v0, 0x7f0403a6

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2, v0}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Lm31;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Lm31;-><init>(Landroidx/preference/SeekBarPreference;)V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Landroidx/preference/SeekBarPreference;->f0:Lm31;

    .line 13
    .line 14
    new-instance v1, Ln31;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ln31;-><init>(Landroidx/preference/SeekBarPreference;)V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Landroidx/preference/SeekBarPreference;->g0:Ln31;

    .line 20
    .line 21
    sget-object v1, Ldx0;->k:[I

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {p1, p2, v1, v0, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const/4 p2, 0x3

    .line 29
    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    iput p2, p0, Landroidx/preference/SeekBarPreference;->W:I

    .line 34
    .line 35
    const/16 p2, 0x64

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    iget v1, p0, Landroidx/preference/SeekBarPreference;->W:I

    .line 43
    .line 44
    if-ge p2, v1, :cond_0

    .line 45
    .line 46
    move p2, v1

    .line 47
    :cond_0
    iget v1, p0, Landroidx/preference/SeekBarPreference;->X:I

    .line 48
    .line 49
    if-eq p2, v1, :cond_1

    .line 50
    .line 51
    iput p2, p0, Landroidx/preference/SeekBarPreference;->X:I

    .line 52
    .line 53
    invoke-virtual {p0}, Landroidx/preference/Preference;->g()V

    .line 54
    .line 55
    .line 56
    :cond_1
    const/4 p2, 0x4

    .line 57
    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    iget v1, p0, Landroidx/preference/SeekBarPreference;->Y:I

    .line 62
    .line 63
    if-eq p2, v1, :cond_2

    .line 64
    .line 65
    iget v1, p0, Landroidx/preference/SeekBarPreference;->X:I

    .line 66
    .line 67
    iget v3, p0, Landroidx/preference/SeekBarPreference;->W:I

    .line 68
    .line 69
    sub-int/2addr v1, v3

    .line 70
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    invoke-static {v1, p2}, Ljava/lang/Math;->min(II)I

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    iput p2, p0, Landroidx/preference/SeekBarPreference;->Y:I

    .line 79
    .line 80
    invoke-virtual {p0}, Landroidx/preference/Preference;->g()V

    .line 81
    .line 82
    .line 83
    :cond_2
    const/4 p2, 0x2

    .line 84
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    iput-boolean p2, p0, Landroidx/preference/SeekBarPreference;->c0:Z

    .line 89
    .line 90
    const/4 p2, 0x5

    .line 91
    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    iput-boolean p2, p0, Landroidx/preference/SeekBarPreference;->d0:Z

    .line 96
    .line 97
    const/4 p2, 0x6

    .line 98
    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    iput-boolean p2, p0, Landroidx/preference/SeekBarPreference;->e0:Z

    .line 103
    .line 104
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 105
    .line 106
    .line 107
    return-void
.end method


# virtual methods
.method public final k(Lmu0;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroidx/preference/Preference;->k(Lmu0;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lmu0;->a:Landroid/view/View;

    .line 5
    .line 6
    iget-object v1, p0, Landroidx/preference/SeekBarPreference;->g0:Ln31;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 9
    .line 10
    .line 11
    const v0, 0x7f0901b0

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lmu0;->b(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Landroid/widget/SeekBar;

    .line 19
    .line 20
    iput-object v0, p0, Landroidx/preference/SeekBarPreference;->a0:Landroid/widget/SeekBar;

    .line 21
    .line 22
    const v0, 0x7f0901b1

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lmu0;->b(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Landroid/widget/TextView;

    .line 30
    .line 31
    iput-object p1, p0, Landroidx/preference/SeekBarPreference;->b0:Landroid/widget/TextView;

    .line 32
    .line 33
    iget-boolean v0, p0, Landroidx/preference/SeekBarPreference;->d0:Z

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/16 v0, 0x8

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    const/4 p1, 0x0

    .line 48
    iput-object p1, p0, Landroidx/preference/SeekBarPreference;->b0:Landroid/widget/TextView;

    .line 49
    .line 50
    :goto_0
    iget-object p1, p0, Landroidx/preference/SeekBarPreference;->a0:Landroid/widget/SeekBar;

    .line 51
    .line 52
    if-nez p1, :cond_1

    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    iget-object v0, p0, Landroidx/preference/SeekBarPreference;->f0:Lm31;

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Landroidx/preference/SeekBarPreference;->a0:Landroid/widget/SeekBar;

    .line 61
    .line 62
    iget v0, p0, Landroidx/preference/SeekBarPreference;->X:I

    .line 63
    .line 64
    iget v1, p0, Landroidx/preference/SeekBarPreference;->W:I

    .line 65
    .line 66
    sub-int/2addr v0, v1

    .line 67
    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 68
    .line 69
    .line 70
    iget p1, p0, Landroidx/preference/SeekBarPreference;->Y:I

    .line 71
    .line 72
    iget-object v0, p0, Landroidx/preference/SeekBarPreference;->a0:Landroid/widget/SeekBar;

    .line 73
    .line 74
    if-eqz p1, :cond_2

    .line 75
    .line 76
    invoke-virtual {v0, p1}, Landroid/widget/AbsSeekBar;->setKeyProgressIncrement(I)V

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_2
    invoke-virtual {v0}, Landroid/widget/AbsSeekBar;->getKeyProgressIncrement()I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    iput p1, p0, Landroidx/preference/SeekBarPreference;->Y:I

    .line 85
    .line 86
    :goto_1
    iget-object p1, p0, Landroidx/preference/SeekBarPreference;->a0:Landroid/widget/SeekBar;

    .line 87
    .line 88
    iget v0, p0, Landroidx/preference/SeekBarPreference;->V:I

    .line 89
    .line 90
    iget v1, p0, Landroidx/preference/SeekBarPreference;->W:I

    .line 91
    .line 92
    sub-int/2addr v0, v1

    .line 93
    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 94
    .line 95
    .line 96
    iget p1, p0, Landroidx/preference/SeekBarPreference;->V:I

    .line 97
    .line 98
    iget-object v0, p0, Landroidx/preference/SeekBarPreference;->b0:Landroid/widget/TextView;

    .line 99
    .line 100
    if-eqz v0, :cond_3

    .line 101
    .line 102
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    :cond_3
    iget-object p1, p0, Landroidx/preference/SeekBarPreference;->a0:Landroid/widget/SeekBar;

    .line 110
    .line 111
    invoke-virtual {p0}, Landroidx/preference/Preference;->f()Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    invoke-virtual {p1, p0}, Landroid/view/View;->setEnabled(Z)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public final n(Landroid/content/res/TypedArray;I)Ljava/lang/Object;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p1, p2, p0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final o(Landroid/os/Parcelable;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Lo31;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-super {p0, p1}, Landroidx/preference/Preference;->o(Landroid/os/Parcelable;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    check-cast p1, Lo31;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/AbsSavedState;->getSuperState()Landroid/os/Parcelable;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-super {p0, v0}, Landroidx/preference/Preference;->o(Landroid/os/Parcelable;)V

    .line 24
    .line 25
    .line 26
    iget v0, p1, Lo31;->j:I

    .line 27
    .line 28
    iput v0, p0, Landroidx/preference/SeekBarPreference;->V:I

    .line 29
    .line 30
    iget v0, p1, Lo31;->k:I

    .line 31
    .line 32
    iput v0, p0, Landroidx/preference/SeekBarPreference;->W:I

    .line 33
    .line 34
    iget p1, p1, Lo31;->l:I

    .line 35
    .line 36
    iput p1, p0, Landroidx/preference/SeekBarPreference;->X:I

    .line 37
    .line 38
    invoke-virtual {p0}, Landroidx/preference/Preference;->g()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final p()Landroid/os/Parcelable;
    .locals 2

    .line 1
    invoke-super {p0}, Landroidx/preference/Preference;->p()Landroid/os/Parcelable;

    .line 2
    .line 3
    .line 4
    sget-object v0, Landroid/view/AbsSavedState;->EMPTY_STATE:Landroid/view/AbsSavedState;

    .line 5
    .line 6
    iget-boolean v1, p0, Landroidx/preference/Preference;->z:Z

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    new-instance v0, Lo31;

    .line 12
    .line 13
    invoke-direct {v0}, Lst0;-><init>()V

    .line 14
    .line 15
    .line 16
    iget v1, p0, Landroidx/preference/SeekBarPreference;->V:I

    .line 17
    .line 18
    iput v1, v0, Lo31;->j:I

    .line 19
    .line 20
    iget v1, p0, Landroidx/preference/SeekBarPreference;->W:I

    .line 21
    .line 22
    iput v1, v0, Lo31;->k:I

    .line 23
    .line 24
    iget p0, p0, Landroidx/preference/SeekBarPreference;->X:I

    .line 25
    .line 26
    iput p0, v0, Lo31;->l:I

    .line 27
    .line 28
    return-object v0
.end method

.method public final q(Ljava/lang/Object;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    :cond_0
    check-cast p1, Ljava/lang/Integer;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-virtual {p0}, Landroidx/preference/Preference;->w()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget-object v0, p0, Landroidx/preference/Preference;->k:Lju0;

    .line 22
    .line 23
    invoke-virtual {v0}, Lju0;->c()Landroid/content/SharedPreferences;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Landroidx/preference/Preference;->t:Ljava/lang/String;

    .line 28
    .line 29
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    :goto_0
    const/4 v0, 0x1

    .line 34
    invoke-virtual {p0, p1, v0}, Landroidx/preference/SeekBarPreference;->y(IZ)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final y(IZ)V
    .locals 3

    .line 1
    iget v0, p0, Landroidx/preference/SeekBarPreference;->W:I

    .line 2
    .line 3
    if-ge p1, v0, :cond_0

    .line 4
    .line 5
    move p1, v0

    .line 6
    :cond_0
    iget v0, p0, Landroidx/preference/SeekBarPreference;->X:I

    .line 7
    .line 8
    if-le p1, v0, :cond_1

    .line 9
    .line 10
    move p1, v0

    .line 11
    :cond_1
    iget v0, p0, Landroidx/preference/SeekBarPreference;->V:I

    .line 12
    .line 13
    if-eq p1, v0, :cond_7

    .line 14
    .line 15
    iput p1, p0, Landroidx/preference/SeekBarPreference;->V:I

    .line 16
    .line 17
    iget-object v0, p0, Landroidx/preference/SeekBarPreference;->b0:Landroid/widget/TextView;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    invoke-virtual {p0}, Landroidx/preference/Preference;->w()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_3

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_3
    not-int v0, p1

    .line 36
    invoke-virtual {p0}, Landroidx/preference/Preference;->w()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iget-object v2, p0, Landroidx/preference/Preference;->t:Ljava/lang/String;

    .line 41
    .line 42
    if-nez v1, :cond_4

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_4
    iget-object v1, p0, Landroidx/preference/Preference;->k:Lju0;

    .line 46
    .line 47
    invoke-virtual {v1}, Lju0;->c()Landroid/content/SharedPreferences;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    :goto_0
    if-ne p1, v0, :cond_5

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_5
    iget-object v0, p0, Landroidx/preference/Preference;->k:Lju0;

    .line 59
    .line 60
    invoke-virtual {v0}, Lju0;->b()Landroid/content/SharedPreferences$Editor;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Landroidx/preference/Preference;->k:Lju0;

    .line 68
    .line 69
    iget-boolean p1, p1, Lju0;->e:Z

    .line 70
    .line 71
    if-nez p1, :cond_6

    .line 72
    .line 73
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 74
    .line 75
    .line 76
    :cond_6
    :goto_1
    if-eqz p2, :cond_7

    .line 77
    .line 78
    invoke-virtual {p0}, Landroidx/preference/Preference;->g()V

    .line 79
    .line 80
    .line 81
    :cond_7
    return-void
.end method
