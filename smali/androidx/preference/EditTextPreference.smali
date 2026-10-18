.class public Landroidx/preference/EditTextPreference;
.super Landroidx/preference/DialogPreference;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public b0:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 1
    const v0, 0x7f040195

    .line 2
    .line 3
    .line 4
    const v1, 0x1010092

    .line 5
    .line 6
    .line 7
    invoke-static {p1, v0, v1}, Les0;->d(Landroid/content/Context;II)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-direct {p0, p1, p2, v0}, Landroidx/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    .line 13
    .line 14
    sget-object v1, Ldx0;->d:[I

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {p1, p2, v1, v0, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1, v2, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    invoke-virtual {p1, v2, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-eqz p2, :cond_1

    .line 30
    .line 31
    sget-object p2, Lmz;->s:Lmz;

    .line 32
    .line 33
    if-nez p2, :cond_0

    .line 34
    .line 35
    new-instance p2, Lmz;

    .line 36
    .line 37
    const/16 v0, 0xd

    .line 38
    .line 39
    invoke-direct {p2, v0}, Lmz;-><init>(I)V

    .line 40
    .line 41
    .line 42
    sput-object p2, Lmz;->s:Lmz;

    .line 43
    .line 44
    :cond_0
    iput-object p2, p0, Landroidx/preference/Preference;->T:Lmz;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroidx/preference/Preference;->g()V

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 50
    .line 51
    .line 52
    return-void
.end method


# virtual methods
.method public final n(Landroid/content/res/TypedArray;I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
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
    const-class v1, Lnz;

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
    check-cast p1, Lnz;

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
    iget-object p1, p1, Lnz;->j:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroidx/preference/EditTextPreference;->y(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
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
    new-instance v0, Lnz;

    .line 12
    .line 13
    invoke-direct {v0}, Lst0;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Landroidx/preference/EditTextPreference;->b0:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p0, v0, Lnz;->j:Ljava/lang/String;

    .line 19
    .line 20
    return-object v0
.end method

.method public final q(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroidx/preference/EditTextPreference;->y(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final v()Z
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/preference/EditTextPreference;->b0:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-super {p0}, Landroidx/preference/Preference;->v()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public final y(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/preference/EditTextPreference;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-object p1, p0, Landroidx/preference/EditTextPreference;->b0:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->s(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroidx/preference/EditTextPreference;->v()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eq p1, v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->h(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Landroidx/preference/Preference;->g()V

    .line 20
    .line 21
    .line 22
    return-void
.end method
