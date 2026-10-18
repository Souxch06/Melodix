.class public abstract Landroidx/preference/PreferenceGroup;
.super Landroidx/preference/Preference;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final V:Lu71;

.field public final W:Landroid/os/Handler;

.field public final X:Ljava/util/ArrayList;

.field public Y:Z

.field public Z:I

.field public a0:Z

.field public b0:I

.field public final c0:Ldu0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 93
    invoke-direct {p0, p1, p2, v0, v0}, Landroidx/preference/PreferenceGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p4, Lu71;

    .line 5
    .line 6
    invoke-direct {p4}, Lu71;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p4, p0, Landroidx/preference/PreferenceGroup;->V:Lu71;

    .line 10
    .line 11
    new-instance p4, Landroid/os/Handler;

    .line 12
    .line 13
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-direct {p4, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 18
    .line 19
    .line 20
    iput-object p4, p0, Landroidx/preference/PreferenceGroup;->W:Landroid/os/Handler;

    .line 21
    .line 22
    const/4 p4, 0x1

    .line 23
    iput-boolean p4, p0, Landroidx/preference/PreferenceGroup;->Y:Z

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput v0, p0, Landroidx/preference/PreferenceGroup;->Z:I

    .line 27
    .line 28
    iput-boolean v0, p0, Landroidx/preference/PreferenceGroup;->a0:Z

    .line 29
    .line 30
    const v1, 0x7fffffff

    .line 31
    .line 32
    .line 33
    iput v1, p0, Landroidx/preference/PreferenceGroup;->b0:I

    .line 34
    .line 35
    new-instance v2, Ldu0;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ldu0;-><init>(Landroidx/preference/PreferenceGroup;)V

    .line 38
    .line 39
    .line 40
    iput-object v2, p0, Landroidx/preference/PreferenceGroup;->c0:Ldu0;

    .line 41
    .line 42
    new-instance v2, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v2, p0, Landroidx/preference/PreferenceGroup;->X:Ljava/util/ArrayList;

    .line 48
    .line 49
    sget-object v2, Ldx0;->i:[I

    .line 50
    .line 51
    invoke-virtual {p1, p2, v2, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const/4 p2, 0x2

    .line 56
    invoke-virtual {p1, p2, p4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 57
    .line 58
    .line 59
    move-result p3

    .line 60
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    iput-boolean p2, p0, Landroidx/preference/PreferenceGroup;->Y:Z

    .line 65
    .line 66
    invoke-virtual {p1, p4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    if-eqz p2, :cond_1

    .line 71
    .line 72
    invoke-virtual {p1, p4, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    invoke-virtual {p1, p4, p2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    if-eq p2, v1, :cond_0

    .line 81
    .line 82
    iget-object p3, p0, Landroidx/preference/Preference;->t:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 85
    .line 86
    .line 87
    :cond_0
    iput p2, p0, Landroidx/preference/PreferenceGroup;->b0:I

    .line 88
    .line 89
    :cond_1
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 90
    .line 91
    .line 92
    return-void
.end method


# virtual methods
.method public final A(I)Landroidx/preference/Preference;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/preference/PreferenceGroup;->X:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroidx/preference/Preference;

    .line 8
    .line 9
    return-object p0
.end method

.method public final a(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroidx/preference/Preference;->a(Landroid/os/Bundle;)V

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
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Landroidx/preference/PreferenceGroup;->A(I)Landroidx/preference/Preference;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2, p1}, Landroidx/preference/Preference;->a(Landroid/os/Bundle;)V

    .line 18
    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public final b(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroidx/preference/Preference;->b(Landroid/os/Bundle;)V

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
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Landroidx/preference/PreferenceGroup;->A(I)Landroidx/preference/Preference;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2, p1}, Landroidx/preference/Preference;->b(Landroid/os/Bundle;)V

    .line 18
    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public final h(Z)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroidx/preference/Preference;->h(Z)V

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
    iget-boolean v3, v2, Landroidx/preference/Preference;->D:Z

    .line 18
    .line 19
    if-ne v3, p1, :cond_0

    .line 20
    .line 21
    xor-int/lit8 v3, p1, 0x1

    .line 22
    .line 23
    iput-boolean v3, v2, Landroidx/preference/Preference;->D:Z

    .line 24
    .line 25
    invoke-virtual {v2}, Landroidx/preference/Preference;->v()Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    invoke-virtual {v2, v3}, Landroidx/preference/Preference;->h(Z)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Landroidx/preference/Preference;->g()V

    .line 33
    .line 34
    .line 35
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void
.end method

.method public i()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroidx/preference/Preference;->i()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Landroidx/preference/PreferenceGroup;->a0:Z

    .line 6
    .line 7
    iget-object v0, p0, Landroidx/preference/PreferenceGroup;->X:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    :goto_0
    if-ge v1, v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Landroidx/preference/PreferenceGroup;->A(I)Landroidx/preference/Preference;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2}, Landroidx/preference/Preference;->i()V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method public final m()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/preference/Preference;->x()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Landroidx/preference/PreferenceGroup;->a0:Z

    .line 6
    .line 7
    iget-object v1, p0, Landroidx/preference/PreferenceGroup;->X:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    :goto_0
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceGroup;->A(I)Landroidx/preference/Preference;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Landroidx/preference/Preference;->m()V

    .line 20
    .line 21
    .line 22
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
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
    const-class v1, Leu0;

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
    check-cast p1, Leu0;

    .line 18
    .line 19
    iget v0, p1, Leu0;->j:I

    .line 20
    .line 21
    iput v0, p0, Landroidx/preference/PreferenceGroup;->b0:I

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/AbsSavedState;->getSuperState()Landroid/os/Parcelable;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-super {p0, p1}, Landroidx/preference/Preference;->o(Landroid/os/Parcelable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final p()Landroid/os/Parcelable;
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/preference/Preference;->p()Landroid/os/Parcelable;

    .line 2
    .line 3
    .line 4
    sget-object v0, Landroid/view/AbsSavedState;->EMPTY_STATE:Landroid/view/AbsSavedState;

    .line 5
    .line 6
    new-instance v0, Leu0;

    .line 7
    .line 8
    iget p0, p0, Landroidx/preference/PreferenceGroup;->b0:I

    .line 9
    .line 10
    invoke-direct {v0, p0}, Leu0;-><init>(I)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public y(Landroidx/preference/Preference;)V
    .locals 7

    .line 1
    iget-object v0, p0, Landroidx/preference/PreferenceGroup;->X:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_2

    .line 10
    .line 11
    :cond_0
    iget-object v0, p1, Landroidx/preference/Preference;->t:Ljava/lang/String;

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    move-object v0, p0

    .line 16
    :goto_0
    iget-object v1, v0, Landroidx/preference/Preference;->Q:Landroidx/preference/PreferenceGroup;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    move-object v0, v1

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    iget-object v1, p1, Landroidx/preference/Preference;->t:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceGroup;->z(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 25
    .line 26
    .line 27
    :cond_2
    iget v0, p1, Landroidx/preference/Preference;->o:I

    .line 28
    .line 29
    const v1, 0x7fffffff

    .line 30
    .line 31
    .line 32
    if-ne v0, v1, :cond_4

    .line 33
    .line 34
    iget-boolean v1, p0, Landroidx/preference/PreferenceGroup;->Y:Z

    .line 35
    .line 36
    if-eqz v1, :cond_3

    .line 37
    .line 38
    iget v1, p0, Landroidx/preference/PreferenceGroup;->Z:I

    .line 39
    .line 40
    add-int/lit8 v2, v1, 0x1

    .line 41
    .line 42
    iput v2, p0, Landroidx/preference/PreferenceGroup;->Z:I

    .line 43
    .line 44
    if-eq v1, v0, :cond_3

    .line 45
    .line 46
    iput v1, p1, Landroidx/preference/Preference;->o:I

    .line 47
    .line 48
    iget-object v0, p1, Landroidx/preference/Preference;->O:Lhu0;

    .line 49
    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    iget-object v1, v0, Lhu0;->g:Landroid/os/Handler;

    .line 53
    .line 54
    iget-object v0, v0, Lhu0;->h:Lfu0;

    .line 55
    .line 56
    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 60
    .line 61
    .line 62
    :cond_3
    instance-of v0, p1, Landroidx/preference/PreferenceGroup;

    .line 63
    .line 64
    if-eqz v0, :cond_4

    .line 65
    .line 66
    move-object v0, p1

    .line 67
    check-cast v0, Landroidx/preference/PreferenceGroup;

    .line 68
    .line 69
    iget-boolean v1, p0, Landroidx/preference/PreferenceGroup;->Y:Z

    .line 70
    .line 71
    iput-boolean v1, v0, Landroidx/preference/PreferenceGroup;->Y:Z

    .line 72
    .line 73
    :cond_4
    iget-object v0, p0, Landroidx/preference/PreferenceGroup;->X:Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-static {v0, p1}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    const/4 v1, 0x1

    .line 80
    if-gez v0, :cond_5

    .line 81
    .line 82
    mul-int/lit8 v0, v0, -0x1

    .line 83
    .line 84
    sub-int/2addr v0, v1

    .line 85
    :cond_5
    invoke-virtual {p0}, Landroidx/preference/Preference;->v()Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    iget-boolean v3, p1, Landroidx/preference/Preference;->D:Z

    .line 90
    .line 91
    if-ne v3, v2, :cond_6

    .line 92
    .line 93
    xor-int/2addr v2, v1

    .line 94
    iput-boolean v2, p1, Landroidx/preference/Preference;->D:Z

    .line 95
    .line 96
    invoke-virtual {p1}, Landroidx/preference/Preference;->v()Z

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    invoke-virtual {p1, v2}, Landroidx/preference/Preference;->h(Z)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1}, Landroidx/preference/Preference;->g()V

    .line 104
    .line 105
    .line 106
    :cond_6
    monitor-enter p0

    .line 107
    :try_start_0
    iget-object v2, p0, Landroidx/preference/PreferenceGroup;->X:Ljava/util/ArrayList;

    .line 108
    .line 109
    invoke-virtual {v2, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 113
    iget-object v0, p0, Landroidx/preference/Preference;->k:Lju0;

    .line 114
    .line 115
    iget-object v2, p1, Landroidx/preference/Preference;->t:Ljava/lang/String;

    .line 116
    .line 117
    if-eqz v2, :cond_7

    .line 118
    .line 119
    iget-object v3, p0, Landroidx/preference/PreferenceGroup;->V:Lu71;

    .line 120
    .line 121
    invoke-virtual {v3, v2}, Lu71;->containsKey(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    if-eqz v3, :cond_7

    .line 126
    .line 127
    iget-object v3, p0, Landroidx/preference/PreferenceGroup;->V:Lu71;

    .line 128
    .line 129
    const/4 v4, 0x0

    .line 130
    invoke-virtual {v3, v2, v4}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    check-cast v3, Ljava/lang/Long;

    .line 135
    .line 136
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 137
    .line 138
    .line 139
    move-result-wide v3

    .line 140
    iget-object v5, p0, Landroidx/preference/PreferenceGroup;->V:Lu71;

    .line 141
    .line 142
    invoke-virtual {v5, v2}, Lu71;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_7
    monitor-enter v0

    .line 147
    :try_start_1
    iget-wide v3, v0, Lju0;->b:J

    .line 148
    .line 149
    const-wide/16 v5, 0x1

    .line 150
    .line 151
    add-long/2addr v5, v3

    .line 152
    iput-wide v5, v0, Lju0;->b:J

    .line 153
    .line 154
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 155
    :goto_1
    iput-wide v3, p1, Landroidx/preference/Preference;->l:J

    .line 156
    .line 157
    iput-boolean v1, p1, Landroidx/preference/Preference;->m:Z

    .line 158
    .line 159
    const/4 v1, 0x0

    .line 160
    :try_start_2
    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->j(Lju0;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 161
    .line 162
    .line 163
    iput-boolean v1, p1, Landroidx/preference/Preference;->m:Z

    .line 164
    .line 165
    iget-object v0, p1, Landroidx/preference/Preference;->Q:Landroidx/preference/PreferenceGroup;

    .line 166
    .line 167
    if-nez v0, :cond_a

    .line 168
    .line 169
    iput-object p0, p1, Landroidx/preference/Preference;->Q:Landroidx/preference/PreferenceGroup;

    .line 170
    .line 171
    iget-boolean v0, p0, Landroidx/preference/PreferenceGroup;->a0:Z

    .line 172
    .line 173
    if-eqz v0, :cond_8

    .line 174
    .line 175
    invoke-virtual {p1}, Landroidx/preference/Preference;->i()V

    .line 176
    .line 177
    .line 178
    :cond_8
    iget-object p0, p0, Landroidx/preference/Preference;->O:Lhu0;

    .line 179
    .line 180
    if-eqz p0, :cond_9

    .line 181
    .line 182
    iget-object p1, p0, Lhu0;->g:Landroid/os/Handler;

    .line 183
    .line 184
    iget-object p0, p0, Lhu0;->h:Lfu0;

    .line 185
    .line 186
    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 190
    .line 191
    .line 192
    :cond_9
    :goto_2
    return-void

    .line 193
    :cond_a
    const-string p0, "This preference already has a parent. You must remove the existing parent before assigning a new one."

    .line 194
    .line 195
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    return-void

    .line 199
    :catchall_0
    move-exception p0

    .line 200
    iput-boolean v1, p1, Landroidx/preference/Preference;->m:Z

    .line 201
    .line 202
    throw p0

    .line 203
    :catchall_1
    move-exception p0

    .line 204
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 205
    throw p0

    .line 206
    :catchall_2
    move-exception p1

    .line 207
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 208
    throw p1
.end method

.method public final z(Ljava/lang/CharSequence;)Landroidx/preference/Preference;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_4

    .line 3
    .line 4
    iget-object v1, p0, Landroidx/preference/Preference;->t:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    iget-object v1, p0, Landroidx/preference/PreferenceGroup;->X:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x0

    .line 20
    :goto_0
    if-ge v2, v1, :cond_3

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Landroidx/preference/PreferenceGroup;->A(I)Landroidx/preference/Preference;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    iget-object v4, v3, Landroidx/preference/Preference;->t:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v4, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-eqz v4, :cond_1

    .line 33
    .line 34
    return-object v3

    .line 35
    :cond_1
    instance-of v4, v3, Landroidx/preference/PreferenceGroup;

    .line 36
    .line 37
    if-eqz v4, :cond_2

    .line 38
    .line 39
    check-cast v3, Landroidx/preference/PreferenceGroup;

    .line 40
    .line 41
    invoke-virtual {v3, p1}, Landroidx/preference/PreferenceGroup;->z(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    if-eqz v3, :cond_2

    .line 46
    .line 47
    return-object v3

    .line 48
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    return-object v0

    .line 52
    :cond_4
    const-string p0, "Key cannot be null"

    .line 53
    .line 54
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-object v0
.end method
