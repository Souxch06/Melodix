.class public abstract Landroidx/preference/DialogPreference;
.super Landroidx/preference/Preference;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final V:Ljava/lang/CharSequence;

.field public final W:Ljava/lang/String;

.field public final X:Landroid/graphics/drawable/Drawable;

.field public final Y:Ljava/lang/String;

.field public final Z:Ljava/lang/String;

.field public final a0:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    const v0, 0x7f04016f

    const v1, 0x1010091

    .line 106
    invoke-static {p1, v0, v1}, Les0;->d(Landroid/content/Context;II)I

    move-result v0

    .line 107
    invoke-direct {p0, p1, p2, v0}, Landroidx/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ldx0;->c:[I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/16 p2, 0x9

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    :cond_0
    iput-object p2, p0, Landroidx/preference/DialogPreference;->V:Ljava/lang/CharSequence;

    .line 24
    .line 25
    if-nez p2, :cond_1

    .line 26
    .line 27
    iget-object p2, p0, Landroidx/preference/Preference;->p:Ljava/lang/CharSequence;

    .line 28
    .line 29
    iput-object p2, p0, Landroidx/preference/DialogPreference;->V:Ljava/lang/CharSequence;

    .line 30
    .line 31
    :cond_1
    const/16 p2, 0x8

    .line 32
    .line 33
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    if-nez p2, :cond_2

    .line 38
    .line 39
    const/4 p2, 0x1

    .line 40
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    :cond_2
    iput-object p2, p0, Landroidx/preference/DialogPreference;->W:Ljava/lang/String;

    .line 45
    .line 46
    const/4 p2, 0x6

    .line 47
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    if-nez p2, :cond_3

    .line 52
    .line 53
    const/4 p2, 0x2

    .line 54
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    :cond_3
    iput-object p2, p0, Landroidx/preference/DialogPreference;->X:Landroid/graphics/drawable/Drawable;

    .line 59
    .line 60
    const/16 p2, 0xb

    .line 61
    .line 62
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    if-nez p2, :cond_4

    .line 67
    .line 68
    const/4 p2, 0x3

    .line 69
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    :cond_4
    iput-object p2, p0, Landroidx/preference/DialogPreference;->Y:Ljava/lang/String;

    .line 74
    .line 75
    const/16 p2, 0xa

    .line 76
    .line 77
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    if-nez p2, :cond_5

    .line 82
    .line 83
    const/4 p2, 0x4

    .line 84
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    :cond_5
    iput-object p2, p0, Landroidx/preference/DialogPreference;->Z:Ljava/lang/String;

    .line 89
    .line 90
    const/4 p2, 0x5

    .line 91
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    const/4 p3, 0x7

    .line 96
    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    iput p2, p0, Landroidx/preference/DialogPreference;->a0:I

    .line 101
    .line 102
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 103
    .line 104
    .line 105
    return-void
.end method


# virtual methods
.method public l()V
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/preference/Preference;->k:Lju0;

    .line 2
    .line 3
    iget-object v0, v0, Lju0;->i:Lcu0;

    .line 4
    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    move-object v1, v0

    .line 8
    :goto_0
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-object v1, v1, Lh70;->D:Lh70;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {v0}, Lh70;->k()Lz70;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "androidx.preference.PreferenceFragment.DIALOG"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Lz70;->B(Ljava/lang/String;)Lh70;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    goto/16 :goto_2

    .line 26
    .line 27
    :cond_1
    instance-of v1, p0, Landroidx/preference/EditTextPreference;

    .line 28
    .line 29
    iget-object v3, p0, Landroidx/preference/Preference;->t:Ljava/lang/String;

    .line 30
    .line 31
    const/4 v4, 0x1

    .line 32
    const-string v5, "key"

    .line 33
    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    new-instance p0, Lpz;

    .line 37
    .line 38
    invoke-direct {p0}, Lpz;-><init>()V

    .line 39
    .line 40
    .line 41
    new-instance v1, Landroid/os/Bundle;

    .line 42
    .line 43
    invoke-direct {v1, v4}, Landroid/os/Bundle;-><init>(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v5, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v1}, Lh70;->K(Landroid/os/Bundle;)V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    instance-of v1, p0, Landroidx/preference/ListPreference;

    .line 54
    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    new-instance p0, Loj0;

    .line 58
    .line 59
    invoke-direct {p0}, Loj0;-><init>()V

    .line 60
    .line 61
    .line 62
    new-instance v1, Landroid/os/Bundle;

    .line 63
    .line 64
    invoke-direct {v1, v4}, Landroid/os/Bundle;-><init>(I)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, v5, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, v1}, Lh70;->K(Landroid/os/Bundle;)V

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_3
    instance-of v1, p0, Landroidx/preference/MultiSelectListPreference;

    .line 75
    .line 76
    if-eqz v1, :cond_4

    .line 77
    .line 78
    new-instance p0, Lqo0;

    .line 79
    .line 80
    invoke-direct {p0}, Lqo0;-><init>()V

    .line 81
    .line 82
    .line 83
    new-instance v1, Landroid/os/Bundle;

    .line 84
    .line 85
    invoke-direct {v1, v4}, Landroid/os/Bundle;-><init>(I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, v5, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, v1}, Lh70;->K(Landroid/os/Bundle;)V

    .line 92
    .line 93
    .line 94
    :goto_1
    invoke-virtual {p0, v0}, Lh70;->L(Lh70;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0}, Lh70;->k()Lz70;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    const/4 v1, 0x0

    .line 102
    iput-boolean v1, p0, Lpx;->o0:Z

    .line 103
    .line 104
    iput-boolean v4, p0, Lpx;->p0:Z

    .line 105
    .line 106
    new-instance v3, Ltf;

    .line 107
    .line 108
    invoke-direct {v3, v0}, Ltf;-><init>(Lz70;)V

    .line 109
    .line 110
    .line 111
    iput-boolean v4, v3, Ltf;->p:Z

    .line 112
    .line 113
    invoke-virtual {v3, v1, p0, v2, v4}, Ltf;->e(ILh70;Ljava/lang/String;I)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v3, v1}, Ltf;->d(Z)I

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 121
    .line 122
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    new-instance v1, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    const-string v2, "Cannot display dialog for an unknown Preference type: "

    .line 133
    .line 134
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    const-string p0, ". Make sure to implement onPreferenceDisplayDialog() to handle displaying a custom dialog for this Preference."

    .line 141
    .line 142
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    throw v0

    .line 153
    :cond_5
    :goto_2
    return-void
.end method
