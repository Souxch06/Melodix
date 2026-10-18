.class public Lqo0;
.super Lzt0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public A0:Z

.field public B0:[Ljava/lang/CharSequence;

.field public C0:[Ljava/lang/CharSequence;

.field public final z0:Ljava/util/HashSet;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lzt0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lqo0;->z0:Ljava/util/HashSet;

    .line 10
    .line 11
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
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    iget-object v1, p0, Lqo0;->z0:Ljava/util/HashSet;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 9
    .line 10
    .line 11
    const-string v1, "MultiSelectListPreferenceDialogFragmentCompat.values"

    .line 12
    .line 13
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "MultiSelectListPreferenceDialogFragmentCompat.changed"

    .line 17
    .line 18
    iget-boolean v1, p0, Lqo0;->A0:Z

    .line 19
    .line 20
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 21
    .line 22
    .line 23
    const-string v0, "MultiSelectListPreferenceDialogFragmentCompat.entries"

    .line 24
    .line 25
    iget-object v1, p0, Lqo0;->B0:[Ljava/lang/CharSequence;

    .line 26
    .line 27
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putCharSequenceArray(Ljava/lang/String;[Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    const-string v0, "MultiSelectListPreferenceDialogFragmentCompat.entryValues"

    .line 31
    .line 32
    iget-object p0, p0, Lqo0;->C0:[Ljava/lang/CharSequence;

    .line 33
    .line 34
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putCharSequenceArray(Ljava/lang/String;[Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final P(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-boolean p1, p0, Lqo0;->A0:Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lzt0;->N()Landroidx/preference/DialogPreference;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Landroidx/preference/MultiSelectListPreference;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lqo0;->z0:Ljava/util/HashSet;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroidx/preference/MultiSelectListPreference;->y(Ljava/util/Set;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    const/4 p1, 0x0

    .line 22
    iput-boolean p1, p0, Lqo0;->A0:Z

    .line 23
    .line 24
    return-void
.end method

.method public final Q(Lf4;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lqo0;->C0:[Ljava/lang/CharSequence;

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    new-array v1, v0, [Z

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v0, :cond_0

    .line 8
    .line 9
    iget-object v3, p0, Lqo0;->C0:[Ljava/lang/CharSequence;

    .line 10
    .line 11
    aget-object v3, v3, v2

    .line 12
    .line 13
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    iget-object v4, p0, Lqo0;->z0:Ljava/util/HashSet;

    .line 18
    .line 19
    invoke-virtual {v4, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    aput-boolean v3, v1, v2

    .line 24
    .line 25
    add-int/lit8 v2, v2, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v0, p0, Lqo0;->B0:[Ljava/lang/CharSequence;

    .line 29
    .line 30
    new-instance v2, Lpo0;

    .line 31
    .line 32
    invoke-direct {v2, p0}, Lpo0;-><init>(Lqo0;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p1, Lf4;->c:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p0, Lb4;

    .line 38
    .line 39
    iput-object v0, p0, Lb4;->o:[Ljava/lang/CharSequence;

    .line 40
    .line 41
    iput-object v2, p0, Lb4;->w:Lpo0;

    .line 42
    .line 43
    iput-object v1, p0, Lb4;->s:[Z

    .line 44
    .line 45
    const/4 p1, 0x1

    .line 46
    iput-boolean p1, p0, Lb4;->t:Z

    .line 47
    .line 48
    return-void
.end method

.method public final v(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lzt0;->v(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iget-object v1, p0, Lqo0;->z0:Ljava/util/HashSet;

    .line 6
    .line 7
    if-nez p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lzt0;->N()Landroidx/preference/DialogPreference;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Landroidx/preference/MultiSelectListPreference;

    .line 14
    .line 15
    iget-object v2, p1, Landroidx/preference/MultiSelectListPreference;->b0:[Ljava/lang/CharSequence;

    .line 16
    .line 17
    iget-object v3, p1, Landroidx/preference/MultiSelectListPreference;->c0:[Ljava/lang/CharSequence;

    .line 18
    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/util/HashSet;->clear()V

    .line 24
    .line 25
    .line 26
    iget-object v2, p1, Landroidx/preference/MultiSelectListPreference;->d0:Ljava/util/HashSet;

    .line 27
    .line 28
    invoke-interface {v1, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    iput-boolean v0, p0, Lqo0;->A0:Z

    .line 32
    .line 33
    iget-object p1, p1, Landroidx/preference/MultiSelectListPreference;->b0:[Ljava/lang/CharSequence;

    .line 34
    .line 35
    iput-object p1, p0, Lqo0;->B0:[Ljava/lang/CharSequence;

    .line 36
    .line 37
    iput-object v3, p0, Lqo0;->C0:[Ljava/lang/CharSequence;

    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    const-string p0, "MultiSelectListPreference requires an entries array and an entryValues array."

    .line 41
    .line 42
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    invoke-virtual {v1}, Ljava/util/HashSet;->clear()V

    .line 47
    .line 48
    .line 49
    const-string v2, "MultiSelectListPreferenceDialogFragmentCompat.values"

    .line 50
    .line 51
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-interface {v1, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 56
    .line 57
    .line 58
    const-string v1, "MultiSelectListPreferenceDialogFragmentCompat.changed"

    .line 59
    .line 60
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iput-boolean v0, p0, Lqo0;->A0:Z

    .line 65
    .line 66
    const-string v0, "MultiSelectListPreferenceDialogFragmentCompat.entries"

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getCharSequenceArray(Ljava/lang/String;)[Ljava/lang/CharSequence;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Lqo0;->B0:[Ljava/lang/CharSequence;

    .line 73
    .line 74
    const-string v0, "MultiSelectListPreferenceDialogFragmentCompat.entryValues"

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getCharSequenceArray(Ljava/lang/String;)[Ljava/lang/CharSequence;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Lqo0;->C0:[Ljava/lang/CharSequence;

    .line 81
    .line 82
    return-void
.end method
