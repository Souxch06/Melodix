.class public Loj0;
.super Lzt0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public A0:[Ljava/lang/CharSequence;

.field public B0:[Ljava/lang/CharSequence;

.field public z0:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lzt0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final A(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lzt0;->A(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "ListPreferenceDialogFragment.index"

    .line 5
    .line 6
    iget v1, p0, Loj0;->z0:I

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    const-string v0, "ListPreferenceDialogFragment.entries"

    .line 12
    .line 13
    iget-object v1, p0, Loj0;->A0:[Ljava/lang/CharSequence;

    .line 14
    .line 15
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putCharSequenceArray(Ljava/lang/String;[Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    const-string v0, "ListPreferenceDialogFragment.entryValues"

    .line 19
    .line 20
    iget-object p0, p0, Loj0;->B0:[Ljava/lang/CharSequence;

    .line 21
    .line 22
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putCharSequenceArray(Ljava/lang/String;[Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final P(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p1, p0, Loj0;->z0:I

    .line 4
    .line 5
    if-ltz p1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Loj0;->B0:[Ljava/lang/CharSequence;

    .line 8
    .line 9
    aget-object p1, v0, p1

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0}, Lzt0;->N()Landroidx/preference/DialogPreference;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Landroidx/preference/ListPreference;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroidx/preference/ListPreference;->z(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final Q(Lf4;)V
    .locals 3

    .line 1
    iget-object v0, p0, Loj0;->A0:[Ljava/lang/CharSequence;

    .line 2
    .line 3
    iget v1, p0, Loj0;->z0:I

    .line 4
    .line 5
    new-instance v2, Lnj0;

    .line 6
    .line 7
    invoke-direct {v2, p0}, Lnj0;-><init>(Loj0;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p1, Lf4;->c:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p0, Lb4;

    .line 13
    .line 14
    iput-object v0, p0, Lb4;->o:[Ljava/lang/CharSequence;

    .line 15
    .line 16
    iput-object v2, p0, Lb4;->q:Landroid/content/DialogInterface$OnClickListener;

    .line 17
    .line 18
    iput v1, p0, Lb4;->v:I

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Lb4;->u:Z

    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    invoke-virtual {p1, p0, p0}, Lf4;->f(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final v(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lzt0;->v(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0}, Lzt0;->N()Landroidx/preference/DialogPreference;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroidx/preference/ListPreference;

    .line 11
    .line 12
    iget-object v0, p1, Landroidx/preference/ListPreference;->b0:[Ljava/lang/CharSequence;

    .line 13
    .line 14
    iget-object v1, p1, Landroidx/preference/ListPreference;->c0:[Ljava/lang/CharSequence;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-object v0, p1, Landroidx/preference/ListPreference;->d0:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroidx/preference/ListPreference;->y(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Loj0;->z0:I

    .line 27
    .line 28
    iget-object p1, p1, Landroidx/preference/ListPreference;->b0:[Ljava/lang/CharSequence;

    .line 29
    .line 30
    iput-object p1, p0, Loj0;->A0:[Ljava/lang/CharSequence;

    .line 31
    .line 32
    iput-object v1, p0, Loj0;->B0:[Ljava/lang/CharSequence;

    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const-string p0, "ListPreference requires an entries array and an entryValues array."

    .line 36
    .line 37
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    const-string v0, "ListPreferenceDialogFragment.index"

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iput v0, p0, Loj0;->z0:I

    .line 49
    .line 50
    const-string v0, "ListPreferenceDialogFragment.entries"

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getCharSequenceArray(Ljava/lang/String;)[Ljava/lang/CharSequence;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Loj0;->A0:[Ljava/lang/CharSequence;

    .line 57
    .line 58
    const-string v0, "ListPreferenceDialogFragment.entryValues"

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getCharSequenceArray(Ljava/lang/String;)[Ljava/lang/CharSequence;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p0, Loj0;->B0:[Ljava/lang/CharSequence;

    .line 65
    .line 66
    return-void
.end method
